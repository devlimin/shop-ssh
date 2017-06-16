<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
		<div>
			<div class="pull-left">
				<img width="90" src="${pageContext.request.contextPath }/img/1.jpg" class="img-rounded"/>
			</div>
			<div class="pull-right">
				<ol class="nav nav-pills">
				  <s:if test="#session.existUser != null">
				  	<li><a>欢迎您：<s:property value="#session.existUser.username"/></a></li>
				  	<li><a href="${pageContext.request.contextPath }/order_findByUid">我的订单</a></li>
				  	<li><a href="${pageContext.request.contextPath }/user_quit">退出</a></li>
				  </s:if>
				  <s:else>
				  	<li><a href="${pageContext.request.contextPath }/user_loginPage">登陆</a></li>
				  	<li><a href="${pageContext.request.contextPath }/user_registPage">注册</a></li>
				  </s:else>
				  <li><a href="#">会员中心</a></li>
				  <li><a href="#">购物指南</a></li>
				</ol>
				<div class="pull-right">
					服务热线<strong>1395503333</strong>
				</div>
				<div class="pull-right" style="margin-right: 10px;">
					<a href="${pageContext.request.contextPath }/cart_myCart.action">购物车</a>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div>
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }/index.action">首页</a></li>
			  <s:iterator value="#session.categoryList" var="category">
			  	<li>
			  		<a href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='#category.id'/>">
			  			<s:property value="#category.name"/>
			  		</a>
			  	</li>
			  </s:iterator>
			</ol>
		</div>
