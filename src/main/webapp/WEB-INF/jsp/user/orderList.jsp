<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<p class="bg-primary">我的订单</p>
		<s:iterator value="pageBean.pageItems" var="orders">
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<p class="bg-info" style="font-size: 20px">
					订单编号：<s:property value="#orders.id"/> |
					订单金额：<s:property value="#orders.total"/>￥ |
					订单时间：<fmt:formatDate value='${orders.orderTime }' pattern="yyyy-MM-dd hh:mm:ss"/> |
					<s:if test="#orders.state == 1">
						<a href="${pageContext.request.contextPath }/order_findByOid?id=<s:property value='#orders.id'/>">
							付款
						</a>
					</s:if>
					<s:if test="#orders.state == 2">
						已付款 |
						<a href="${pageContext.request.contextPath }/order_orderDetail?id=<s:property value='#orders.id'/>">
							详情
						</a>
					</s:if>
					<s:if test="#orders.state == 3">
						<a href="${ pageContext.request.contextPath }/order_updateState.action?id=<s:property value="#orders.id" />">
							确认收货
						</a>
					</s:if>
					<s:if test="#orders.state == 4">
						交易成功
					</s:if>
				</p>
				<thead>
					<th>图片</th>
					<th>商品</th>
					<th>价格</th>
					<th>数量</th>
					<th>小计</th>
				</thead>
				<tbody>
					<s:iterator value="#orders.orderItems" var="orderItem">
						<c:url value="/product_findByPid.action" var="url" scope="page">
							<c:param name="id" value="${orderItem.product.id }"/>
						</c:url>
						<tr>
							<td>
								<a href="${url }">
									<img width="70px" src="${pageContext.request.contextPath }${product.image }" /></td>
								</a>
							<td>
								<a href="${url }">
									<s:property value="#orderItem.product.name"/>
								</a>
							</td>
							<td><s:property value="#orderItem.product.shop_price"/> </td>
							<td><s:property value="#orderItem.count"/> </td>
							<td><s:property value="#orderItem.subTotal"/> </td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<hr />
		</s:iterator>
		<ul class="pagination" style="float: right;">
			<li>
				<s:if test="pageBean.currentPage != 1">
					<a href="${pageContext.request.contextPath }/order_findByUid?page=1"  aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</s:if>
			</li>
			<s:iterator value="pageBean.pageBar" var="page">
				<li>
					<s:if test="#page == pageBean.currentPage">
						<a style="color: black"><s:property value="#page"/></a> 
					</s:if>
					<s:else>
						<a href="${pageContext.request.contextPath }/order_findByUid?page=<s:property value='#page'/>">
							<s:property value="#page"/>
						</a>
					</s:else>
				</li>
			</s:iterator>
			<li>
				<s:if test="pageBean.currentPage != pageBean.totalPage">
					<a href="${pageContext.request.contextPath }/order_findByUid?page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</s:if>
			</li>
		</ul>
	</body>
</html>