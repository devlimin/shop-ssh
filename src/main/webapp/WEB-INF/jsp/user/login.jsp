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
	</head>

	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<div id="">
			<div class="pull-left">
				<img width="500" src="${pageContext.request.contextPath }/img/2.jpg" class="img-rounded" />
			</div>
			<div style="margin-left: 550px;">
			
				<p class="bg-primary">会员登陆</p>
				<s:actionerror/>
				<s:form action="user_login.action">
					<table>
						<tr>
							<td><s:textfield name="username" cssClass="form-control" placeholder="用户名"></s:textfield></td>
						</tr>
						<tr>
							<td><s:password name="password" cssClass="form-control" placeholder="密码"></s:password></td>
						</tr>
						<tr>
							<td>
								<input type="button" value="注册" class="btn btn-default" />
								<s:submit value="登陆" class="btn btn-default"></s:submit>	
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</body>

</html>