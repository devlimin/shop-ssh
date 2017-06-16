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
		<script type="text/javascript">
			$(function() {
				$("#username").focus();
				
				$("#checkImg").click(function() {
					this.src="${pageContext.request.contextPath}/checkImg.action?"+new Date().getTime();
				}); 
			});
			function checkname() {
				$("#usernameMsg").text("");
				var data = $("#username").val();
				var len = data.length;
				if($.trim(data) == "") {
					$("#usernameMsg").text("用户名不能为空");
					return;
				} else if(len < 6 || len > 50){
					$("#usernameMsg").text("用户名长度应在6到50个字符间");
				} else {
					var url = "${pageContext.request.contextPath}/user_findByName.action";
					$.ajax({
						type : "post",
						data : "username="+data,
						url : url,
						success : function(msg) {
							$("#usernameMsg").text(msg);
						}
					})
					return;
				}
			}
			
			function regist() {
				$("#usernameMsg").text("");
				$("#passwordMsg").text("");
				$("#repasswordMsg").text("");
				$("#emailMsg").text("");
				$("#phoneMsg").text("");	
				var username = $("#username").val();
				if($.trim(username) == "") {
					$("#usernameMsg").text("用户名不能为空");
					return;
				}
				var password = $("#password").val();
				if($.trim(password) == "") {
					$("#passwordMsg").text("密码不能为空");
					return;
				}
				var repassword = $("#repassword").val();
				if($.trim(repassword) == "" || repassword != password) {
					$("#repasswordMsg").text("密码重复出错");
					return;
				}
				var email = $("#email").val();
				if($.trim(email) == "") {
					$("#emailMsg").text("邮箱不能为空");
					return;
				}
				var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
				if(!emailReg.test(email)) {
					$("#emailMsg").text("邮箱格式不正确");
					return;
				}
				var phone = $("#phone").val();
				if($.trim(phone) == "") {
					$("#phoneMsg").text("手机不能为空");
					return;
				}
				var phoneRge = /^1\d{10}$/;
			    if (!phoneRge.test(phone)) {
			    	$("#phoneMsg").text("手机格式不正确");
					return;
			    }
			    var checkcode = $("#checkcode").val();
			    if($.trim(checkcode) == "") {
			    	$("#checkcodeMsg").text("验证码不能为空");
					return;
			    }
			    var url = "${pageContext.request.contextPath}/user_checkCode.action";
				$.ajax({
					type : "post",
					data : "checkcode="+checkcode,
					url : url,
					success : function(msg) {
						msg = $.trim(msg);
						if(msg == "wrong") {
							$("#checkcodeMsg").text("验证码输入出错");
							return;
						} else {
							$("#registForm").submit();
						}
					}
				})
				
			}
	</script>
	</head>

	<body style="width: 80%;margin: auto;">
		<%@ include file="/WEB-INF/jsp/user/head.jsp" %>
		<div id="">
			<div class="pull-left">
				<img width="500" src="${pageContext.request.contextPath }/img/2.jpg" class="img-rounded" />
			</div>
			<div style="margin-left: 550px;">
				<p class="bg-primary">会员注册</p>
				<s:fielderror></s:fielderror>
				<s:actionerror/>
				<s:form action="user_regist" id="registForm" method="post">
					<table>
						<tr>
							<td style="width: 250px;">
								<s:textfield name="username" id="username" cssClass="form-control" 
									onblur="checkname();" placeholder="用户名"/>
							</td>
							<td>
								<span id="usernameMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:password name="password" id="password" cssClass="form-control" placeholder="密码"/>
							</td>
							<td>
								<span id="passwordMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:password id="repassword" cssClass="form-control" placeholder="确认密码" />
							 </td>
							<td>
								<span id="repasswordMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:textfield name="email" id="email"  cssClass="form-control" placeholder="email"/>
							</td>
							<td>
								<span id="emailMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:textfield name="phone" id="phone" cssClass="form-control" placeholder="手机"/>
							</td>
							<td>
								<span id="phoneMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:textfield id="checkcode" name="checkcode" maxlength="4" placeholder="验证码"
									cssClass="form-control" cssStyle="width:125px;display:inline"/>
								<img id="checkImg" src="${pageContext.request.contextPath}/checkImg.action" title="点击更换验证码">
							</td>
							<td>
								<span id="checkcodeMsg"></span>
							</td>
						</tr>
						<tr>
							<td>
								<s:reset value="重置" cssClass="btn btn-default"/> 
								<input type="button" value="注册" class="btn btn-default" onclick="regist();">
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</body>
	
</html>
