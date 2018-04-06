<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>login</title>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/css/main.css"/>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input {
	margin-bottom: 5px;
}
</style>
<script type="text/javascript">
	$().ready(function() {
		$("#loginBtn").click(function() {
			$("#loginForm").attr({
				"action" : "<c:url value = "/login"/>",
				"method" : "post"
			}).submit();
		});
		$("#joinBtn").click(function() {
			location.href = "<c:url value = "/join"/>"
		});
		$("#findPwdBtn").click(function(){
			$("#findPwdForm").attr({
				"action" : "<c:url value = "/findPwd"/>",
				"method" : "post"
			}).submit();
		});
		
	});
</script>
</head>
<body>
	<div style="margin-top: 20px;">
		<div class="col-md-4 col-md-offset-4" id="loginSection">
			<h3>&nbsplogin form</h3>
			<hr />
			<form:form modelAttribute="loginForm">
				<div>
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Enter Email">
				</div>
				<form:errors path="email" />
				<div>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Enter password">
				</div>
				<form:errors path="password" />
				<div style="float: right">
					<span id="findPwd"><a data-toggle="modal" href="#myModal">비밀번호
							찾기</a> &nbsp&nbsp</span> <span id="joinBtn">JOIN US &nbsp&nbsp</span> 
					<input type="button" id="loginBtn" class="btn" value="LOGIN" />
				</div>
			</form:form>
		</div>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">비밀번호 찾기</h4>
				</div>
				<div class="modal-body">
					<form id ="findPwdForm" method="post">
					<p>가입시 사용한 이메일을 입력하세요.</p>
					<div><input type="text" class="form-control" id="emailForFind" name="emailForFind"></div>
					<div><input type="button" id="findPwdBtn" class="btn" value="확인" /></div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>