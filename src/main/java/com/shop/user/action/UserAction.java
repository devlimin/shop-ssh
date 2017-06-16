package com.shop.user.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.user.entity.User;
import com.shop.user.service.UserService;

@Controller
@Scope(scopeName="prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	private static final long serialVersionUID = -706808106274101909L;
	
	@Resource
	private UserService userService;
	
	private User user;
	
	
	@Override
	public User getModel() {
		if(user == null) {
			user = new User();
		}
		return user;
	}

	// 接收验证码:
	private String checkcode;

	/**
	 * 跳转到注册页面的执行方法
	 */
	public String registPage() {
		return "registPage";
	}

	/**
	 * AJAX进行异步校验用户名的执行方法
	 * 
	 * @throws IOException
	 */
	public String findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsename(user.getUsername());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("用户名已经存在");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("用户名可以使用");
		}
		return NONE;
	}
	
	/**
	 * 异步验证验证码
	 * @return
	 * @throws Exception
	 */
	public String checkCode() throws Exception{
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (!checkcode.equalsIgnoreCase(checkcode1)) {
			response.getWriter().println("wrong");
		} else {
			response.getWriter().println("right");
		}
		return NONE;
	}

	/**
	 * 用户注册的方法:
	 */
	public String regist() {
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if (!checkcode.equalsIgnoreCase(checkcode1)) {
			this.addActionError("验证码输入错误!");
			return "checkcodeFail";
		}
		userService.regist(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
		ServletActionContext.getRequest().getSession().removeAttribute("checkcode");
		return "msg";
	}
	
	/**
	 * 用户激活的方法
	 */
	public String auth() {
		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误
			this.addActionMessage("激活失败！");
		} else {
			// 激活成功
			existUser.setState(1);
			// 清除激活码，防止重复激活
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功，请登录！");
		}
		return "msg";
	}

	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}

	/**
	 * 登录的方法
	 */
	public String login() {
		User existUser = userService.login(user.getUsername(), user.getPassword());
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			// 页面跳转
			return "loginSuccess";
		}
	}

	/**
	 * 用户退出的方法
	 */
	public String quit() {
		// 销毁session
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return "quit";
	}
	
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

}
