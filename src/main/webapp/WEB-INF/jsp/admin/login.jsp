<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城管理中心</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	<body style="width: 80%;margin: auto;">
		<div class="pull-left">
			<img width="500" src="${pageContext.request.contextPath }/img/1.jpg" class="img-rounded" />
		</div>
		<div style="margin-left: 550px;">
			<p class="bg-primary">管理员登陆</p>
			<s:actionerror/>
			<form action="${pageContext.request.contextPath }/adminUser_login" method="post">
				<table>
					<tr>
						<td>管理员：</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="登陆" /></td>
					</tr>
				</table>

			</form>
		</div>
	</body>
</html>
