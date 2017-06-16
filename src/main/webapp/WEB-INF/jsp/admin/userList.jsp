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
			function deleteUser (userId) {
				if(confirm("确定要删除吗")) {
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath }/userAdmin_delete.action",
						data : "id="+userId,
						success : function(msg) {
							if($.trim(msg) == "success") {
								$("#"+userId).remove();	
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
			<div class="bg-info">
				<p style="text-align: center;font-weight: 800;">用户列表</p>
			</div>
			<table class="table table-striped table-bordered table-hover  table-condensed">
				<thead>
					<th>ID</th>
					<th>用户名</th>
					<th>状态</th>
					<th>邮箱</th>
					<th>手机</th>
					<th>操作</th>
				</thead>
				<tbody>
					<s:iterator value="pageBean.pageItems" var="user">
						<tr id="<s:property value="#user.id"/>">
							<td><s:property value="#user.id"/></td>
							<td><s:property value="#user.username"/> </td>
							<td>
								<s:if test="#user.state == 1">
									已激活
								</s:if>
								<s:else>
									未激活
								</s:else>
							</td>
							<td><s:property value="#user.email"/></td>
							<td><s:property value="#user.phone"/></td>
							<td>
								<a class="btn btn-default" href="${pageContext.request.contextPath }/userAdmin_edit?id=<s:property value="#user.id"/>">
									编辑
								</a>
								<%-- <a href="${pageContext.request.contextPath }/userAdmin_delete?id=<s:property value="#user.id"/>">
									<img width="20" src="../../img/6.jpg">
								</a> --%>
								<input type="button" class="btn btn-default" onclick="deleteUser(<s:property value="#user.id"/>);" value="删除">
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<ul class="pagination" style="float: right;">
				<li>
					<s:if test="pageBean.currentPage != 1">
						<a href="${pageContext.request.contextPath }/userAdmin_findAll?page=1"  aria-label="Previous">
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
							<a href="${pageContext.request.contextPath }/userAdmin_findAll?page=<s:property value='#page'/>">
								<s:property value="#page"/>
							</a>
						</s:else>
					</li>
				</s:iterator>
				<li>
					<s:if test="pageBean.currentPage != pageBean.totalPage">
						<a href="${pageContext.request.contextPath }/userAdmin_findAll?page=<s:property value='pageBean.totalPage'/> " aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</s:if>
				</li>
			</ul>
		</div>
		
		</div>
	</body>
</html>
