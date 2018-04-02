<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>join</title>
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
		
		$("#email").keyup(function(){
			var inputEmail = $(this).val();
			if (inputEmail != ""){
				
				$.post("<c:url value="/api/duplicate/email"/>",{
					email: inputEmail
				}, function(response){
					console.log(response.respEmail);
					if(response.respEmail){
						$("<p>중복됨</p>").appendTo($(this).closeset("#email"));
					}
					
				});
				
			}
		});
		//0328
		$("#endDateYear, #endDateMonth").change(
				function() {
					var data = $(this);
					if (data.attr("id") == "endDateYear") {
						var year = data.val();
						var month = $("#endDateMonth").val();
					} else {
						var year = $("#endDateYear").val();
						var month = data.val();
					}
					$.post("<c:url value="/api/date/max/"/>" + year
							+ "/" + month, {}, function(response) {
						$("#endDateDate").find("option").remove();
						setDate("#endDateDate", parseInt(response));
					});
				});

				//1. 검색 날짜 셋팅 : 
				setYear("#endDateYear", parseInt("${search.endDateYear-19}"),
						parseInt("${search.endDateYear}"));

				setMonth("#endDateMonth");

				setDate("#endDateDate", parseInt("${endDateMaximumDate}"));

				// 날짜 셋팅
				$("#endDateYear").val("${search.endDateYear}");
				$("#endDateMonth").val("${search.endDateMonth}");
				$("#endDateDate").val("${search.endDateDate}");

				function setYear(elementId, startYear, endYear) {
					for (var i = startYear; i <= endYear; i++) {
						$(elementId).append($("<option>", {
							value : i,
							text : i
						}));
					}
				}
				function setMonth(elementId) {
					for (var i = 1; i < 13; i++) {
						var value = (i < 10) ? "0" + i : i;
						$(elementId).append($("<option>", {
							value : value,
							text : value
						}));
					}
				}
				function setDate(elementId, maximumdate) {
					for (var i = 1; i <= maximumdate; i++) {
						var value = (i < 10) ? "0" + i : i;
						$(elementId).append($("<option>", {
							value : value,
							text : value
						}));
					}
				}
		//0328
		
		
		//폼에 들어온 값 처리 이벤트 시작
		$("#joinBtn").click(function() {
			$("#joinForm").attr({
				"action" : "<c:url value = "/join"/>",
				"method" : "post"
			}).submit();
		});
		//폼 처리 이벤트 끝
	});
</script>
</head>
<body>
	<div style="margin-top: 20px;">
		<div class="col-md-4 col-md-offset-4" id="joinSection">
			<h3>&nbspjoin form</h3>
			<hr />
			<form:form modelAttribute="joinForm">
				<div>
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름입력">
				</div>
				<div>
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일입력">
				</div>
				<div>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="비밀번호입력">
				</div>
				<div>
					<input type="password" class="form-control" id="password-confirm"
						placeholder="비밀번호재입력">
				</div>
				<div>
					<input type="text" class="form-control" id="nickname"
						name="nickname" placeholder="닉네임입력">
				</div>
				<div>
					생년월일
					<select id ="endDateYear" name = "endDateYear"></select>
					-<select id ="endDateMonth" name = "endDateMonth"></select>
					-<select id ="endDateDate" name = "endDateDate"></select>
				</div>
				<div style="float:right">
					<input type="button" id="joinBtn" class="btn" value="JOIN US" />
				</div>
			</form:form>
		</div>
	</div>



</body>
</html>