package com.shop.order.adminAction;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.entity.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shop.order.entity.Order;
import com.shop.order.service.OrderService;

@Controller
@Scope("prototype")
public class OrderAdminAction extends ActionSupport 
				implements ModelDriven<Order>{
	private static final long serialVersionUID = -4329407193705934387L;

	private Order order = new Order();
	@Override
	public Order getModel() {
		return order;
	}
	
	private Integer page = 1;
	
	@Resource
	private OrderService orderService;

	// 提供后台查询所有订单的方法:
	public String findAll(){
		// 订单的分页查询
		PageBean<Order> pageBean = orderService.selectPage(page, 10);
		// 将数据存入到值栈中保存到页面
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 页面跳转:
		return "findAll";
	}

	// 修改订单状态
	public String updateState(){
		// 根据id查询订单
		Order currOrder = orderService.selectById(order.getId());
		currOrder.setState(3);
		orderService.update(currOrder);
		// 页面跳转
		return "updateStateSuccess";
	}
	
	// 根据订单的id查询订单项:
	public String findOrderItem(){
		// 根据订单id查询订单项:
		ActionContext.getContext().getValueStack().pop();
		order = orderService.selectOrderWithItem(order.getId());
		ActionContext.getContext().getValueStack().push(order);
		return "findOrderItem";
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}
















