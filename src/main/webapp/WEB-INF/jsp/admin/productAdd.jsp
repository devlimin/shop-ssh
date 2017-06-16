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
		<script>
			$(function() {
				var reg = /^\d+(\.\d+)?$/;
				$("#market_price").blur(function() {
					$("#marketPriceMsg").text("");
					var value = $.trim($("#market_price").val());
					if(!reg.test(value)) {
						$("#marketPriceMsg").text("请输入数字");
					}
				});
				$("#shop_price").blur(function() {
					$("#shopPriceMsg").text("");
					var value = $("#shop_price").val();
					if(!reg.test(value)) {
						$("#shopPriceMsg").text("请输入数字");
					}
				});
				$("#submitForm").click(function() {
					var market_price = $("#market_price").val();
					if(!reg.test(market_price)) {
						$("#marketPriceMsg").text("请输入数字");
						alert("请输入数字");
						return;
					}
					var shop_price = $("#shop_price").val();
					if(!reg.test(shop_price)) {
						$("#shopPriceMsg").text("请输入数字");
						alert("请输入数字");
						return;
					}
					$("form:first").submit();
				}); 
			});
			function up() {
				$('.img_show').each(function() {
					var $this = $(this),
					btn = $this.find('.upfile'),
					img = $this.find('img');
					btn.on('change', function() {
						var file = $(this)[0].files[0],
						imgSrc = $(this)[0].value,
						url = URL.createObjectURL(file);
						if(false) {
							alert("请上传jpg和png格式的图片！");
							return false;
						} else {
							img.attr('src',url);
							img.css({'opacity' : '1'});
						}
					})
				})
			}
		</script>
	</head>
	<body style="margin: auto;">
		<%@ include file="/WEB-INF/jsp/admin/head.jsp" %>
		<div class="col-xs-10">
			<div class="bg-primary">
				<p style="text-align: center;">增加商品</p>
			</div>
			
			<s:form id="productForm" action="adminProduct_save" style="width:1140px;float:left" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td>商品名称</td>
						<td><s:textfield name="name"></s:textfield> </td>
						<td>是否热门</td>
						<td>
							<select name="is_hot">
								<option value="1" <s:if test="model.is_hot==1">selected</s:if>>是</option>
								<option value="0" <s:if test="model.is_hot==0">selected</s:if>>否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>市场价格</td>
						<td><s:textfield name="market_price" id="market_price"></s:textfield>
							<span id="marketPriceMsg"></span>
						</td>
						<td>商城价格</td>
						<td><s:textfield name="shop_price" id="shop_price"></s:textfield>
							<span id="shopPriceMsg"></span>
						</td>
					</tr>
					<tr>
						<td>商品图片</td>
						<td>
							<!-- <input type="file" name="upload"/> -->
							<div class="img_show text-center">
								<img src="${pageContext.request.contextPath }${image }" widht ="103" height="103" />
								<input type="file" name="upload" class="upfile" onclick="up()" accept="*/*"/>
							</div>
						</td>
						<td>所属二级分类</td>
						<td>
							<s:select list="%{scList}" listKey="id" listValue="name" name="secondCategory.id"></s:select>		
						</td>
					</tr>
					<tr>
						<td>商品描述</td>
						<td><s:textarea name="pdesc" rows="5" cols="40"></s:textarea> </td>
					</tr>
				</table>
				<div style="text-align: center;">
					<input class="btn btn-default" type="button" value="提交" id="submitForm"/>
					<input class="btn btn-default" type="reset" />
					<input class="btn btn-default" type="button" value="返回" onclick="history.go(-1);"/>
				</div>
			</s:form>
		</div>
		</div>
	</body>
</html>
