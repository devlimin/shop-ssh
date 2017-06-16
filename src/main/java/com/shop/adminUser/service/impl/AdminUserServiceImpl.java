package com.shop.adminUser.service.impl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.shop.adminUser.dao.AdminUserDao;
import com.shop.adminUser.entity.AdminUser;
import com.shop.adminUser.service.AdminUserService;

@Service("adminUserService")
public class AdminUserServiceImpl extends BaseServiceImpl<AdminUser> implements AdminUserService {
	
	private AdminUserDao adminUserDao;
	@Resource
	public void setAdminUserDao(AdminUserDao adminUserDao) {
		super.setBaseDao(adminUserDao);
		this.adminUserDao = adminUserDao;
	}
	
	@Override
	public AdminUser login(String username, String password) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AdminUser.class)
												.add(Restrictions.eq("username", username))
												.add(Restrictions.eq("password", password));
		return adminUserDao.selectByQBC(criteria);
	}
	
}
