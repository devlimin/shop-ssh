<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城管理中心</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	<body style="margin: auto;">
		<%@ include file="/WEB-INF/jsp/admin/head.jsp" %>
		<div class="col-xs-10">
			<div style="background-color: #C7DDEF">
				<p style="text-align: center;font-weight: 800;">
					订单详情
				</p>
			</div>
			<p class="bg-info" style="font-size: 20px">
				订单编号：<s:property value="id"/> |
				订单金额：<s:property value="total"/>￥ |
				订单时间：<fmt:formatDate value='${orderTime }' pattern="yyyy-MM-dd hh:mm:ss"/> |
				<s:if test="state == 1">
					未付款
				</s:if>
				<s:elseif test="state == 2">
					已付款
				</s:elseif>
				<s:elseif test="state == 3">
					已发货
				</s:elseif>
				<s:else>
					交易成功
				</s:else>
			</p>
			<p class="bg-info" style="font-size: 20px">
				下单人：<s:property value="user.username"/> |
				收货人：<s:property value="name"/> |
				手机：<s:property value="phone"/> |
				详细地址：<s:property value="addr"/>
			</p>
			<table class="table table-striped table-bordered table-hover  table-condensed" >
				<thead>
					<th>图片</th>
					<th>商品</th>
					<th>价格</th>
					<th>数量</th>
					<th>小计</th>
				</thead>
				<tbody>
					<s:iterator value="orderItems" var="orderItem">
						<tr>
							<td><img width="70px" src="${pageContext.request.contextPath }${orderItem.product.image }" /></td>
							<td><s:property value="#orderItem.product.name"/> </td>
							<td><s:property value="#orderItem.product.shop_price"/> </td>
							<td><s:property value="#orderItem.count"/> </td>
							<td><s:property value="#orderItem.subTotal"/> </td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
	</body>
</html>
