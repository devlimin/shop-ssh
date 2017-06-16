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
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.data.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/distpicker.min.js"></script>
		<script>
			$('#target').distpicker({
			    province: '---- 所在省 ----',
			    city: '---- 所在市 ----',
			    district: '---- 所在区 ----'
			});
			$(function() {
				$("#orderSubmit").click(function() {
					var addr = $("#addr").val();
					if($.trim(addr) == "") {
						alert("详细地址不能为空！");
						return;
					}
					var name = $("#name").val();
					if($.trim(name) == "") {
						alert("收货人不能为空！");
						return;
					}
					var phone = $("#phone").val();
					if($.trim(phone) == "") {
						alert("手机不能为空！");
						return;
					}
					var phoneRge = /^1\d{10}$/;
				    if (!phoneRge.test(phone)) {
						alert("手机格式不正确！");
				    	return;
				    }
				    $("#orderForm").submit();
				});
			})
		</script>
	</head>

	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<p class="bg-primary">我的订单</p>
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<p class="bg-info"  style="font-size: 20px">
				订单编号：<s:property value="order.id"/> |
				订单金额：<s:property value="order.total"/>￥ 
			</p>
			<thead>
				<th>图片</th>
				<th>商品</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
			</thead>
			<tbody>
				<s:iterator value="order.orderItems" var="orderItem">
					<c:url value="/product_findByPid.action" var="url" scope="page">
						<c:param name="id" value="${orderItem.product.id }"/>
					</c:url>
					<tr>
						<td>
							<a href="${url }">
								<img width="70px" src="${pageContext.request.contextPath }${product.image }" />
							</a>
						</td>
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
		
		<form id="orderForm" action="${ pageContext.request.contextPath }/order_payOrder.action" method="post">
				<s:hidden name="id"></s:hidden>
				<s:fielderror></s:fielderror>
				<s:actionerror/>
					<table>
						<tr>
							<td>省市区：</td>
							<td>
								<div data-toggle="distpicker" class="form-control"><!-- container -->
								  <select name="province"></select><!-- 省 -->
								  <select name="city"></select><!-- 市 -->
								  <select name="district"></select><!-- 区 -->
								</div>
							</td>
						</tr>
						<tr>
							<td>详细地址</td>
							<td>
								<input id="addr" name="addr" class="form-control" type="text" value="<s:property value="order.user.addr"/>" style="width:400px" />
							</td>
						</tr>
						<tr>
							<td>收货人：</td>
							<td>
								<input id="name" name="name" class="form-control" type="text" value="<s:property value="order.user.username"/>" style="width:400px" />
							</td>
						</tr>
						<tr>
							<td>手机：</td>
							<td>
								<input id="phone" name="phone" class="form-control" type="text"value="<s:property value="order.user.phone"/>" style="width:400px" />
							</td>
						</tr>
					</table>
					<hr />
						选择银行：<br/>
						<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>
						<br/><br/>
						<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
						<img width="70px" src="${pageContext.request.contextPath }/img/2.jpg"/>
						<br/><br />
					<hr />
					<p style="text-align:right">
						<button type="button" id="orderSubmit" class="btn btn-success">提交</button>
					</p>
			</form>
	</body>
</html>