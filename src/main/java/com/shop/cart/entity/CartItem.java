package com.shop.cart.entity;

import java.io.Serializable;

import com.shop.product.entity.Product;

/**
 * 
 * @author: limin
 * @description: 购物项
 * @date: 2017年3月26日 下午8:32:27
 */
public class CartItem implements Serializable{
	private static final long serialVersionUID = -3347398707096995736L;
	private Product product;	//购物项中商品信息
	private int count;			//商品数量
	private double subtotal;	//商品小计
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSubtotal() {
		subtotal = count * product.getShop_price();
		return subtotal;
	}
}
