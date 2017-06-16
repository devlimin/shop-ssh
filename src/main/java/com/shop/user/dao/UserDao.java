package com.shop.user.dao;

import com.core.dao.BaseDao;
import com.shop.user.entity.User;

public interface UserDao extends BaseDao<User> {
	User selectByNameAndPass(String name, String pass);

	User selectByUsername(String username);

	User selectByCode(String code);
}
