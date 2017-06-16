package com.shop.adminUser.dao.impl;

import org.springframework.stereotype.Repository;

import com.core.dao.impl.BaseDaoImpl;
import com.shop.adminUser.dao.AdminUserDao;
import com.shop.adminUser.entity.AdminUser;

@Repository("adminUserDao")
public class AdminUserDaoImpl extends BaseDaoImpl<AdminUser> implements AdminUserDao {

}
