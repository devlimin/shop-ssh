package com.shop.adminUser.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.shop.adminUser.entity.AdminUser;
import com.shop.adminUser.service.AdminUserService;

@Controller
@Scope("prototype")
public class AdminUserAction extends ActionSupport{
	private static final long serialVersionUID = -3316762356630855999L;
	@Resource
	private AdminUserService adminUserService;
	
	private String username;
	private String password;
	
	public String loginPage() {
		return "login";
	}
	
	public String login() {
		AdminUser existAdminUser = adminUserService.login(username,password);
		if(existAdminUser == null) {
			this.addActionError("用户名或密码错误");
			return "loginFail";
		}
		ServletActionContext.getRequest().getSession()
		.setAttribute("existAdminUser", existAdminUser);
		return "loginSuccess";
	}
	public String logout() {
		ServletActionContext.getRequest().getSession()
		.removeAttribute("existAdminUser");
		return "login";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
