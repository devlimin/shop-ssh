package com.shop.user.service;

import com.core.service.BaseService;
import com.shop.user.entity.User;

public interface UserService extends BaseService<User> {
	
	User login(String username, String password);
	void regist(User user);
	User findByUsename(String username);
	User findByCode(String code);
	
}
