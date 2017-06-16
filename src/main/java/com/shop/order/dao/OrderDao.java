package com.shop.order.dao;

import java.io.Serializable;
import java.util.List;

import com.core.dao.BaseDao;
import com.shop.order.entity.Order;

public interface OrderDao extends BaseDao<Order> {


	List<Order> selectByUserId(Serializable userId, int currentPage, int pageRow);

}
