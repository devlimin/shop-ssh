<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<style></style>
	</head>
	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<div>
			<p class="bg-primary" style="font-size: x-large;">热门</p>
			<div class="container">
				<div class="row" style="width: 95%;">
					<s:iterator value="hotProductList" var="product">
						<div class="col-xs-2" style="margin-bottom: 20px;">
							<a href="${pageContext.request.contextPath }/product_findByPid.action?id=<s:property value='#product.id'/>">
								<img width="160" src="${pageContext.request.contextPath }${product.image }" class="img-rounded" />
							</a>
							<div>
								<div class="text-info"><s:property value="#product.name"/></div>
								<div class="text-primary">商城价：<s:property value="#product.shop_price"/>￥</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
			<br />
			<p class="bg-primary" style="font-size: x-large;">新品</p>
			<div class="container">
				<div class="row" style="width: 95%;">
					<s:iterator value="newProductList" var="product">
						<div class="col-xs-2" style="margin-bottom: 20px;">
							<a href="${pageContext.request.contextPath }/product_findByPid.action?id=<s:property value='#product.id'/>">
								<img width="160" src="${pageContext.request.contextPath }${product.image }" class="img-rounded" />
							</a>
							<div class="text-center">
								<div class="text-info"><s:property value="#product.name"/></div>
								<div class="text-primary">商城价：<s:property value="#product.shop_price"/>￥</div>
							</div>
						</div>
					</s:iterator>	
				</div>
			</div>
		</div>
	</body>
</html>
