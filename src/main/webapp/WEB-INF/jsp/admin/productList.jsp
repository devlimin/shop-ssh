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
			function deleteProduct (pId) {
				if(confirm("确定要删除吗")) {
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath }/adminProduct_delete.action",
						data : "id="+pId,
						success : function(msg) {
							if($.trim(msg) == "success") {
								$("#"+pId).remove();	
							}
						}
					})	
				}
			}
		</script>
	</head>
	<body style="margin: auto;">
		<%@ include file="/WEB-INF/jsp/admin/head.jsp" %>
		<div class="col-xs-10">
			<div style="background-color: #C7DDEF">
				<p style="text-align: center;font-weight: 800;">
					商品列表
				</p>
				<a class="btn btn-default pull-right" href="${pageContext.request.contextPath }/adminProduct_addPage">增加</a>
			</div>
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<thead>
					<th>ID</th>
					<th>图片</th>
					<th>名称</th>
					<th>商城价格</th>
					<th>市场价格</th>
					<th>操作</th>
				</thead>
				<tbody>
					<s:iterator value="pageBean.pageItems" var="product">
						<tr id="<s:property value="#product.id"/>">
							<td><s:property value="#product.id"/> </td>
							<td><img width="80px" height="60px" src="${pageContext.request.contextPath }${product.image }"></td>
							<td><s:property value="#product.name"/> </td>
							<td><s:property value="#product.shop_price"/></td>
							<td><s:property value="#product.market_price"/></td>
							<td>
								<a class="btn btn-default" href="${pageContext.request.contextPath }/adminProduct_edit?id=<s:property value='#product.id'/>">
									编辑
								</a>
								<%-- <a href="${pageContext.request.contextPath }/adminProduct_delete?id=<s:property value='#product.id'/>">
									<img width="20" src="../../img/6.jpg">
								</a> --%>
								<input type="button" class="btn btn-default" onclick="deleteProduct(<s:property value="#product.id"/>);" value="删除">
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<ul class="pagination" style="float: right;">
				<li>
					<s:if test="pageBean.currentPage != 1">
						<a href="${pageContext.request.contextPath }/adminProduct_findAll?page=1"  aria-label="Previous">
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
							<a href="${pageContext.request.contextPath }/adminProduct_findAll?page=<s:property value='#page'/>">
								<s:property value="#page"/>
							</a>
						</s:else>
					</li>
				</s:iterator>
				<li>
					<s:if test="pageBean.currentPage != pageBean.totalPage">
						<a href="${pageContext.request.contextPath }/adminProduct_findAll?page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</s:if>
				</li>
			</ul>
		</div>
		</div>
	</body>
</html>
