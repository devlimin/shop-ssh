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
			<div class="bg-primary">
				<p style="text-align: center;">编辑二级分类</p>
			</div>
			
			<s:form action="adminCategorySecond_save"  style="float:left;">
				<table class="table">
					<tr>
						<td>二级分类名称</td>
						<td><input type="text" name="name"/></td>
						<td>所属一级分类名称</td>
						<td>
							<s:select list="%{cList}" listKey="id" listValue="name" name="category.id">
							</s:select>
						</td>
					</tr>
				</table>
				<div style="text-align: center;">
					<input class="btn btn-default" type="submit" />
					<input class="btn btn-default" type="reset" />
					<input class="btn btn-default" type="button" value="返回" onclick="history.go(-1);"/>
				</div>
			</s:form>
		</div>
		</div>
	</body>
</html>
