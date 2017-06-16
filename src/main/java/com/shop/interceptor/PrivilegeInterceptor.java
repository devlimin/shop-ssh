package com.shop.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shop.adminUser.entity.AdminUser;

public class PrivilegeInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -1877361251384327034L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		AdminUser adminUser = (AdminUser) ActionContext.getContext().getSession().get("existAdminUser");
		if(adminUser == null) {
			ActionSupport action = (ActionSupport) invocation.getAction();
			action.addActionError("您还没有登陆");
			return "login";
		}
		return invocation.invoke();
	}

}
