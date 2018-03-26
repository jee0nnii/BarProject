<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>main</title>
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

<script type="text/javascript">
	$().ready(function() {
		$("#goLogin").click(function() {
			location.href = "<c:url value = "/login"/>"
		});
		$("#goLogout").click(function() {
			location.href = "<c:url value = "/logout"/>"
		});
		$("#goJoin").click(function() {
			location.href = "<c:url value = "/join"/>"
		});
		$("#goMypage").click(function() {
			location.href = "<c:url value = "/mypage"/>"
		});
	});
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">




	<!-- Container (The about Section) -->
	<div id="list" class="container text-center">

		<!-- 로그인 상태 확인 -->
		<div>
			<c:if test="${empty sessionScope.__USER__}">
				<a href="<c:url value="/login"/>">login</a>
			</c:if>
			<c:if test="${not empty sessionScope.__USER__ }">
				<a href="<c:url value="/logout"/>">logout</a>
			</c:if>
		</div>

		<h3>JEONY BAR</h3>
		<p>
			<em>We love drink!</em>
		</p>
		<p>적셔~~~</p>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<input type="button" id="wehave" class="btn" value="WE HAVE" />
			</div>
			<div class="col-sm-4">
				<input type="button" id="wishlist" class="btn" value="WISH LIST" />
			</div>
			<div class="col-sm-4">
				<input type="button" id="canbuy" class="btn" value="CAN BUY" />
			</div>
		</div>
	</div>

	<!-- Container (list Section) -->
	<div id="login" class="bg-1">
		<div class="container">
			<c:if test="${empty sessionScope.__USER__ }">
				<h3 class="text-center">LOGIN & JOIN</h3>
			</c:if>
			<c:if test="${not empty sessionScope.__USER__ }">
				<h3 class="text-center">LOGOUT & MYPAGE</h3>
			</c:if>

			<p class="text-center">커몬커몬</p>

			<div class="row text-center">
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<c:if test="${empty sessionScope.__USER__ }">
							<button class="btn" id="goLogin">LOGIN</button>
						</c:if>
						<c:if test="${not empty sessionScope.__USER__ }">
							<button class="btn" id="goLogout">LOGOUT</button>
						</c:if>		
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">	
						<c:if test="${empty sessionScope.__USER__ }">
							<button class="btn" id="goLogin">JOIN</button>
						</c:if>
						<c:if test="${not empty sessionScope.__USER__ }">
							<button class="btn" id="goMypage">MYPAGE</button>
						</c:if>	
						<!-- <button class="btn" data-toggle="modal" data-target="#myModal">JOIN US</button> -->
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Tickets
						</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23
									per person</label> <input type="number" class="form-control" id="psw"
									placeholder="How many?">
							</div>
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Send To</label> <input
									type="text" class="form-control" id="usrname"
									placeholder="Enter email">
							</div>
							<button type="submit" class="btn btn-block">
								Pay <span class="glyphicon glyphicon-ok"></span>
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>
							Need <a href="#">help?</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script>
		$(document).ready(
				function() {
					// Initialize Tooltip
					$('[data-toggle="tooltip"]').tooltip();

					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#mainPage']").on('click',
							function(event) {

								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {

									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});
				})
	</script>
 -->
</body>
</html>