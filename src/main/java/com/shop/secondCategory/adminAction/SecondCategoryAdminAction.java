package com.shop.secondCategory.adminAction;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.entity.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.category.entity.Category;
import com.shop.category.service.CategoryService;
import com.shop.secondCategory.entity.SecondCategory;
import com.shop.secondCategory.service.SecondCategoryService;

@Controller
@Scope("prototype")
public class SecondCategoryAdminAction extends ActionSupport 
									implements ModelDriven<SecondCategory>{
	private static final long serialVersionUID = 1055076707845630134L;
	
	@Resource
	private SecondCategoryService secondCategoryService;
	@Resource
	private CategoryService categoryService;

	private SecondCategory secondCategory = new SecondCategory();
	@Override
	public SecondCategory getModel() {
		return secondCategory;
	}
	
	private Integer page=1;

	// 带有分页的查询所有二级分类的操作:
	public String findAll() {
		// 调用Service进行查询.
		PageBean<SecondCategory> pageBean = secondCategoryService.selectPage(page, 10);
		// 将pageBean的数据存入到值栈中.
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	// 跳转到添加页面的方法:
	public String addPage() {
		// 查询所有一级分类.
		List<Category> cList = categoryService.selectAll();
		// 将集合存入到值栈中.
		ActionContext.getContext().getValueStack().set("cList", cList);
		// 页面跳转:
		return "addPage";
	}

	// 添加二级分类的方法:
	public String save() {
		secondCategoryService.save(secondCategory);
		return "saveSuccess";
	}

	// 删除二级分类的方法:
	public String delete() throws IOException {
		secondCategoryService.delete(secondCategory.getId());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("success");
		return NONE;
	}

	// 编辑二级分类的方法:
	public String edit() {
		// 根据id查询二级分类:
		ActionContext.getContext().getValueStack().pop();
		secondCategory = secondCategoryService.selectById(secondCategory.getId());
		ActionContext.getContext().getValueStack().push(secondCategory);
		
		// 查询所有一级分类:
		List<Category> cList = categoryService.selectAll();
		// 将集合存入到值栈中.
		ActionContext.getContext().getValueStack().set("cList", cList);
		// 页面跳转:
		return "editSuccess";
	}
	
	// 修改二级分类的方法:
	public String update(){
		secondCategoryService.update(secondCategory);
		return "updateSuccess";
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}
