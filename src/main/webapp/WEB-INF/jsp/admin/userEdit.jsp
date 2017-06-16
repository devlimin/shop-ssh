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
				<p style="text-align: center;">编辑用户</p>
			</div>
			<s:form action="userAdmin_update">
				<s:hidden name="id"></s:hidden>
				<table class="table">
					<tr>
						<td>用户名</td>
						<td><s:textfield name="username"/> </td>
						<td>密码</td>
						<td><s:textfield name="password"/> </td>
					</tr>
					<tr>
						<td>邮箱</td>
						<td><s:textfield name="email"/> </td>
						<td>状态</td>
						<td>
							<s:if test="state == 1">
								已激活
							</s:if>
							<s:else>
								未激活
							</s:else>
						</td>
					</tr>
					<tr>
						<td>地址</td>
						<td><s:textfield name="addr"/>  </td>
						<td>电话</td>
						<td><s:textfield name="phone"/> </td>
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
