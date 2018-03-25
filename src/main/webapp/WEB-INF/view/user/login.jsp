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
				<form:errors path="email"/>
				<div>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Enter password">
				</div>
				<form:errors path="password"/>
				<div style="float:right">
					<span id ="joinBtn">JOIN US &nbsp&nbsp</span>
					<input type="button" id="loginBtn" class="btn" value="LOGIN" />
				</div>
			</form:form>
		</div>
	</div>



</body>
</html>