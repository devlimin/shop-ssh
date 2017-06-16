package com.shop.category.adminAction;

import java.io.IOException;

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

@Controller
@Scope("prototype")
public class CategoryAdminAction extends ActionSupport
								implements ModelDriven<Category>{
	private static final long serialVersionUID = 6679083649752902003L;

	@Resource
	private CategoryService categoryService;
	
	private Category category = new Category();
	@Override
	public Category getModel() {
		return category;
	}
	private Integer page=1;
	

	public String findAll() {
		PageBean<Category> pageBean = categoryService.selectPage(page, 10);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	public String addPage() {
		return "addPage";
	}
	public String save() {
		categoryService.save(category);
		return "saveSuccess";
	}
	
	public String delete() throws IOException {
		category = categoryService.selectById(category.getId());
		if(category != null) {
			categoryService.delete(category.getId());
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("success");
		return NONE;
	}
	
	public String edit() {
		ActionContext.getContext().getValueStack().pop();
		category = categoryService.selectById(category.getId());
		ActionContext.getContext().getValueStack().push(category);
		return "editSuccess";
	}
	
	public String update() {
		categoryService.update(category);
		return "updateSuccess";
	}

	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}

















