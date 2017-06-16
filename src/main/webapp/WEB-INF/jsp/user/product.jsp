<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网上商城</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		var reg = /^\d+$/
		var countMsg = $("#countMsg");
		$("#count").blur(function() {
			countMsg.text("");
			var count = $("#count").val();
			if(!reg.test(count)) {
				countMsg.text("请输入数字！");
			}
		});
		$("#addCart").click(function(){
			var count = $("#count").val();
			if(!reg.test(count)) {
				alert("请输入数字！");
				return;
			}
			$("#cartForm").submit();
		});
	});
</script>
</head>
<body style="width: 80%; margin: auto;">
	<%@ include file="/WEB-INF/jsp/user/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="list-group col-xs-2">
				<s:iterator value="#session.categoryList" var="category">
					<a
						href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value='#category.id'/>"
						class="list-group-item active"> <s:property
							value="#category.name" />
					</a>
					<s:iterator value="#category.secondCategories" var="secondCateogry">
						<a
							href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value='#secondCateogry.id'/>"
							class="list-group-item"> <s:property
								value="#secondCateogry.name" />
						</a>
					</s:iterator>
				</s:iterator>
			</div>

			<div class="col-xs-10">
				<div>
					<div style="float: left; margin-right: 20px;">
						<img width="300"
							src="${pageContext.request.contextPath }${product.image }"
							class="img-rounded" />
					</div>
					<div>
						<div class="text-info">
							<s:property value="product.name" />
						</div>
						<div>
							商城价：<span class="text-danger" style="font-size: large;"><s:property
									value="product.shop_price" />￥</span> 参考价：
							<del>
								<s:property value="product.market_price" />
								￥
							</del>
						</div>
						<div>
							<s:form action="cart_addCart" id="cartForm">
								购买数量：<input type="text" value="1" maxlength="4" name="count" id="count"/>
								<input type="hidden" name="pid"
									value='<s:property value="product.id"/>'>
								<input type="button" value="加入购物车" id="addCart"/>
								<span id="countMsg"></span>
							</s:form>
						</div>
					</div>
				</div>
				<div style="margin-top: 260px;width : 90%;">
					<p class="bg-info">商品介绍</p>
					<p class="text-muted">
						<s:property value="product.pdesc" />
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
