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
		<script type="text/javascript">
			function deleteCategory (cId) {
				if(confirm("确定要删除吗")) {
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath }/adminCategory_delete.action",
						data : "id="+cId,
						success : function(msg) {
							if($.trim(msg) == "success") {
								$("#"+cId).remove();	
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
					一级分类列表
				</p>
				<a class="btn btn-default pull-right" href="${pageContext.request.contextPath }/adminCategory_addPage">增加</a>
			</div>
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<thead>
					<th>ID</th>
					<th>一级分类名称</th>
					<th>操作</th>
				</thead>
				<tbody>
					<s:iterator value="pageBean.pageItems" var="category">
						<tr id="<s:property value="#category.id"/>">
							<td><s:property value="#category.id"/> </td>
							<td><s:property value="#category.name"/> </td>
							<td>
								<a class="btn btn-default" href="${pageContext.request.contextPath }/adminCategory_edit?id=<s:property value="#category.id"/>">
									编辑
								</a>
								<%-- <a href="${pageContext.request.contextPath }/adminCategory_delete?id=<s:property value="#category.id"/>">
									<img width="20" src="../../img/6.jpg">
								</a> --%>
								<input type="button" class="btn btn-default" onclick="deleteCategory(<s:property value="#category.id"/>);" value="删除">
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<ul class="pagination" style="float: right;">
				<li>
					<s:if test="pageBean.currentPage != 1">
						<a href="${pageContext.request.contextPath }/adminCategory_findAll?page=1"  aria-label="Previous">
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
							<a href="${pageContext.request.contextPath }/adminCategory_findAll?page=<s:property value='#page'/>">
								<s:property value="#page"/>
							</a>
						</s:else>
					</li>
				</s:iterator>
				<li>
					<s:if test="pageBean.currentPage != pageBean.totalPage">
						<a href="${pageContext.request.contextPath }/adminCategory_findAll?page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</s:if>
				</li>
			</ul>
		</div>
		</div>
	</body>
</html>
