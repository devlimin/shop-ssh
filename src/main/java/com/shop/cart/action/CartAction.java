package com.shop.cart.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.shop.cart.entity.Cart;
import com.shop.cart.entity.CartItem;
import com.shop.product.entity.Product;
import com.shop.product.service.ProductService;

@Controller
@Scope(scopeName="prototype")
public class CartAction extends ActionSupport {
	private static final long serialVersionUID = -2600844073487614672L;
	
	private Integer pid;
	private Integer count;
	@Resource
	private ProductService productService;
	
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest()
							.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			ServletActionContext.getRequest()
					.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	//将购物项添加到购物车
	public String addCart() {
		//封装成一个CartItem对象
		CartItem cartItem = new CartItem();
		cartItem.setCount(count);
		Product product = productService.selectById(pid);
		cartItem.setProduct(product);
		Cart cart = getCart();
		//将购物项添加到购物车中
		cart.addCart(cartItem);
		return "addCart";
	}
	//清空购物车
	public String clearCart() {
		Cart cart = getCart();
		cart.clearCart();
		ServletActionContext.getRequest().getSession().removeAttribute("cart");
		return "clearCart";
	}
	
	public String removeCart() {
		Cart cart = getCart();
		cart.removeCart(pid);
		return "removeCart";
	}
	
	public String myCart() {
		return "myCart";
	}
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
