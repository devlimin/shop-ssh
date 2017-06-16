<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
	<div class="bg-primary" >
		<p style="font-size: 40px;font-style: italic; letter-spacing: 20px; margin-left: 200px;">商城管理系统</p>
	</div>
	<div class="bg-success">
		<div style="margin-left: 40px; font-weight: bolder; font-size:large;">
			管理员：<s:property value="#session.existAdminUser.username"/>
			<a style="float:right;margin-right:40px;" class="btn btn-small" href="${pageContext.request.contextPath }/adminUser_logout.action">退出</a>
		</div>
	</div>
	<div class="container" style="width: 100%">
		<div class="col-xs-2 ">
			<div>
				<a href="${pageContext.request.contextPath }/userAdmin_findAll" class="list-group-item">用户管理</a>
				<a href="${pageContext.request.contextPath }/adminCategory_findAll" class="list-group-item">一级分类管理</a>
				<a href="${pageContext.request.contextPath }/adminCategorySecond_findAll" class="list-group-item">二级分类管理</a>
				<a href="${pageContext.request.contextPath }/adminProduct_findAll" class="list-group-item">商品管理</a>
				<a href="${pageContext.request.contextPath }/adminOrder_findAll" class="list-group-item">订单管理</a>
			</div>
		</div>
