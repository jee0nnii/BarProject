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
		$("#goJoin").click(function() {
			location.href = "<c:url value = "/join"/>"
		});
	});
</script>
<style>
@charset "UTF-8";
body {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
}

h3, h4 {
	margin: 10px 0 30px 0;
	letter-spacing: 10px;
	font-size: 20px;
	color: #111;
}

.container {
	padding: 80px 120px;
}

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
	opacity: 0.7;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

.bg-1 {
	background: #2d2d30;
	color: #bdbdbd;
}

.bg-1 h3 {
	color: #fff;
}

.bg-1 p {
	font-style: italic;
}

.list-group-item:first-child {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.list-group-item:last-child {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail p {
	margin-top: 15px;
	color: #555;
}

.btn {
	padding: 10px 20px;
	background-color: #333;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}

.btn:hover, .btn:focus {
	border: 1px solid #333;
	background-color: #fff;
	color: #000;
}

.modal-header, h4, .close {
	background-color: #333;
	color: #fff !important;
	text-align: center;
	font-size: 30px;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}

.nav-tabs li a {
	color: #777;
}

#googleMap {
	width: 100%;
	height: 400px;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #2d2d30;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: red !important;
}

footer {
	background-color: #2d2d30;
	color: #f5f5f5;
	padding: 32px;
}

footer a {
	color: #f5f5f5;
}

footer a:hover {
	color: #777;
	text-decoration: none;
}

.form-control {
	border-radius: 0;
}

textarea {
	resize: none;
}
</style>
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
			<h3 class="text-center">LOGIN & JOIN</h3>
			<p class="text-center">커몬커몬</p>

			<div class="row text-center">
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<button class="btn" id="goLogin">LOGIN</button>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<button class="btn" id="goJoin">JOIN</button>
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