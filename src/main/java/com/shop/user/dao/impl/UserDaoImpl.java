package com.shop.user.dao.impl;

import org.hibernate.Session;

import com.core.dao.impl.BaseDaoImpl;
import com.shop.user.dao.UserDao;
import com.shop.user.entity.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public User selectByNameAndPass(String name, String pass) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "FROM User where username=:username and password=:password";
		return (User) session.createQuery(hql)
				.setParameter("username", name)
				.setParameter("password", pass)
				.uniqueResult();
	}

	@Override
	public User selectByUsername(String username) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "FROM User where username=:username";
		return (User) session.createQuery(hql)
				.setParameter("username", username)
				.uniqueResult();
	}

	@Override
	public User selectByCode(String code) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "FROM User where code=:code";
		return (User) session.createQuery(hql)
				.setParameter("code", code)
				.uniqueResult();
	}

}
