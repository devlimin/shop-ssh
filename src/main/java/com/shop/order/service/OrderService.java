package com.shop.order.service;

import java.io.Serializable;

import com.core.entity.PageBean;
import com.core.service.BaseService;
import com.shop.order.entity.Order;

public interface OrderService extends BaseService<Order> {
	PageBean<Order> selectPageByUserId(Serializable userId, int currentPage, int pageRow);

	Order selectOrderWithItem(Integer id);
}
