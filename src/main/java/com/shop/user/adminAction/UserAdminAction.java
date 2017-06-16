package com.shop.user.adminAction;

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
import com.shop.user.entity.User;
import com.shop.user.service.UserService;

@Controller
@Scope("prototype")
public class UserAdminAction extends ActionSupport implements ModelDriven<User>{
	private static final long serialVersionUID = 3158423974341686225L;
	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}
	
	@Resource
	private UserService userService;

	// 接受page参数
	private Integer page=1;

	public void setPage(Integer page) {
		this.page = page;
	}

	// 后台查询所有用户的方法带分页:
	public String findAll(){
		PageBean<User> pageBean = userService.selectPage(page, 10);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	// 后台用户的删除
	public String delete() throws IOException{
//		User existUser = userService.selectById(user.getId());
		userService.delete(user.getId());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("success");
		return NONE;
	}
	
	// 后台用户的编辑
	public String edit(){
		ActionContext.getContext().getValueStack().pop();
		user = userService.selectById(user.getId());
		ActionContext.getContext().getValueStack().push(user);
		return "editSuccess";
	}
	
	// 后台用户的修改:
	public String update(){
		userService.update(user);
		return "updateSuccess";
	}

}
