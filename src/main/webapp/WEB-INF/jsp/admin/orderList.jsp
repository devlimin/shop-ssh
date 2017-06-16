<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					订单列表
				</p>
			</div>
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<thead>
					<th>ID</th>
					<th>金额</th>
					<th>下单人</th>
					<th>收货人</th>
					<th>状态</th>
					<th>详情</th>
				</thead>
				<tbody>
					<s:iterator value="pageBean.pageItems" var="order">
						<tr>
							<td><s:property value="#order.id"/> </td>
							<td><s:property value="#order.total"/> </td>
							<td><s:property value="#order.user.username"/> </td>
							<td><s:property value="#order.name"/> </td>
							<td>
								<s:if test="#order.state == 1">
									未付款
								</s:if>
								<s:elseif test="#order.state == 2">
									已付款
								</s:elseif>
								<s:elseif test="#order.state == 3">
									已发货
								</s:elseif>
								<s:else>
									交易成功
								</s:else>
							</td>
							<td> <a href="${pageContext.request.contextPath }/adminOrder_findOrderItem?id=<s:property value="#order.id"/>" class="btn btn-default">订单详情</a> </td>
						</tr>
					</s:iterator>
			</table>
			<ul class="pagination" style="float: right;">
				<li>
					<s:if test="pageBean.currentPage != 1">
						<a href="${pageContext.request.contextPath }/adminOrder_findAll?page=1"  aria-label="Previous">
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
							<a href="${pageContext.request.contextPath }/adminOrder_findAll?page=<s:property value='#page'/>">
								<s:property value="#page"/>
							</a>
						</s:else>
					</li>
				</s:iterator>
				<li>
					<s:if test="pageBean.currentPage != pageBean.totalPage">
						<a href="${pageContext.request.contextPath }/adminOrder_findAll?page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</s:if>
				</li>
			</ul>
		</div>
		</div>
	</body>
</html>
