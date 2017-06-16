<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>

	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<th>图片</th>
				<th>商品</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</thead>
			<tbody>
				<s:iterator value="#session.cart.cartItems" var="cartItem">
					<c:url value="/product_findByPid.action" var="url" scope="page">
						<c:param name="id" value="${cartItem.product.id }"/>
					</c:url>
					<tr>
						<td>
							<a href="${url }">
								<img width="70px" src="${pageContext.request.contextPath }${cartItem.product.image }" /></td>
							</a>
						<td>
							<a href="${url }">
								<s:property value="#cartItem.product.name"/>
							</a>
						</td>
						<td><s:property value="#cartItem.product.shop_price"/></td>
						<td><s:property value="#cartItem.count"/></td>
						<td><s:property value="#cartItem.subtotal"/></td>
						<td><a href="${pageContext.request.contextPath }/cart_removeCart?pid=<s:property value="#cartItem.product.id"/>">删除</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div style="float: right;">
			商品金额<span class="text-danger"><s:property value="#session.cart.total"/>￥</span>
			<div>
				<a class="btn btn-default" href="${pageContext.request.contextPath }/cart_clearCart">清空购物车</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath }/order_saveOrder">提交订单</a>
			</div>
		</div>
		
	</body>

</html>