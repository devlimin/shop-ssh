package com.shop.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shop.user.entity.User;

public class UserInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -1877361251384327034L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("existUser");
		if(user == null) {
			ActionSupport action = (ActionSupport) invocation.getAction();
			action.addActionError("您还没有登陆");
			return "loginPage";
		}
		return invocation.invoke();
	}

}
