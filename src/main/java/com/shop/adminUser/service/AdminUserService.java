package com.shop.adminUser.service;

import com.core.service.BaseService;
import com.shop.adminUser.entity.AdminUser;

public interface AdminUserService extends BaseService<AdminUser> {

	AdminUser login(String username, String password);

}
