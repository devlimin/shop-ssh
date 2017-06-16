package com.shop.order.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.FetchMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Service;

import com.core.entity.PageBean;
import com.core.service.impl.BaseServiceImpl;
import com.shop.order.dao.OrderDao;
import com.shop.order.entity.Order;
import com.shop.order.service.OrderService;

@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {
	
	private OrderDao orderDao;
	@Resource
	public void setOrderDao(OrderDao orderDao) {
		super.setBaseDao(orderDao);
		this.orderDao = orderDao;
	}
	@Override
	public PageBean<Order> selectPageByUserId(Serializable userId, int currentPage, int pageRow) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class)
				.createAlias("user", "user", JoinType.LEFT_OUTER_JOIN)
				.add(Restrictions.eq("user.id", userId))
//				.setFetchMode("orderItems", FetchMode.JOIN);
				.createCriteria("orderItems", JoinType.LEFT_OUTER_JOIN)
				.setResultTransformer(DetachedCriteria.DISTINCT_ROOT_ENTITY)
				.add(Restrictions.sqlRestriction(" order by orderTime desc"));
				
//		List<Order> list = orderDao.selectPageByQBC(criteria, currentPage, pageRow);
		List<Order> list = orderDao.selectByUserId(userId, currentPage, pageRow);
		/*for(Order order : list) {
			System.out.println(order.getId());
			for(OrderItem item : order.getOrderItems()) {
				System.out.println(item.getProduct().getName());
			}
		}*/
		criteria = DetachedCriteria.forClass(Order.class)
				.createAlias("user", "user")
				.add(Restrictions.eq("user.id", userId))
				.setProjection(Projections.rowCount());
		long totalRow = orderDao.selectCountByQBC(criteria);
		
		PageBean<Order> pageBean = new PageBean<Order>(currentPage, pageRow);
		pageBean.setTotalRow(totalRow);
		pageBean.setPageItems(list);
		return pageBean;
	}
	@Override
	public Order selectOrderWithItem(Integer id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class, "o")
									.setFetchMode("user", FetchMode.JOIN)
									.add(Restrictions.eq("o.id", id))
									.setFetchMode("orderItems", FetchMode.JOIN)
									.setFetchMode("orderItems.product", FetchMode.JOIN);
		return orderDao.selectByQBC(criteria);
	}
	
}
