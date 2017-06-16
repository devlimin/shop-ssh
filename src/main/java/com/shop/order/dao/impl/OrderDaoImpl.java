package com.shop.order.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

import com.core.dao.impl.BaseDaoImpl;
import com.shop.order.dao.OrderDao;
import com.shop.order.entity.Order;

public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {

	@Override
	public List<Order> selectByUserId(Serializable userId, int currentPage, int pageRow) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select distinct o FROM Order o left join o.user u  join fetch o.orderItems i where u.id=:userId";
		return session.createQuery(hql)
				.setParameter("userId", userId)
				.setFirstResult((currentPage-1)*pageRow)
				.setMaxResults(pageRow)
				.list();
	}

}