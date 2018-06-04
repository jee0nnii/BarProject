<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>마이페이지</title>
<meta charset="utf-8" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400,300,700,800"
	rel="stylesheet" media="screen">

<link href="<c:url value="/static/css/bootstrap.min.css"/>"
	rel="stylesheet" media="screen">
<link href="<c:url value="/static/css/style.css"/>" rel="stylesheet"
	media="screen">
<link href="<c:url value="/static/color/default.css"/>" rel="stylesheet"
	media="screen">
<link href="<c:url value="/static/css/search.css"/>" rel="stylesheet">
<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>

<style>
/* responsive sidebar */
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #FE7A66;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

/* 이미지 div에 5대5 */
ul.flex {
	display: -webkit-box; /* OLD - iOS 6-, Safari 3.1-6 */
	display: -moz-box; /* OLD - Firefox 19- (거의 대부분 동작) */
	display: -ms-flexbox; /* TWEENER - IE 10 */
	display: -webkit-flex; /* NEW - Chrome */
	display: flex; /* NEW, Spec - Opera 12.1, Firefox 20+ */
}
</style>
<script type="text/javascript">
$().ready(function(){

});


</script>
</head>

<body>
	<div class="wrapper">

		<!-- sidebar  -->
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="<c:url value ="/main"/>">MAIN</a> 
			<a href="#">1</a> 
			<a href="#">2</a>
		</div>




		<div id="main">

			<!-- Works -->
			<div class="container bg-white">
				<div class="row">
					<div class="col-md-offset-1 col-md-10" style="text-align: left">
						<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;open</span>
						<div id="statusChk" style="display: inline-block; float: right;">
							
							<c:if test="${empty sessionScope.__USER__}">
								<span><a href="<c:url value="/login"/>">LOGIN</a></span>
							</c:if>
							<c:if test="${not empty sessionScope.__USER__ }">
								<span><a href="<c:url value="/logout"/>">LOGOUT</a></span>
							</c:if>
							
							<c:if test="${empty sessionScope.__USER__ }">
								<span id="goLogin">JOIN</span>
							</c:if>
							<c:if test="${not empty sessionScope.__USER__ }">
								<span id="goMypage"><a href="<c:url value="/mypage"/>">MYPAGE</a></span>
							</c:if>	
							
						</div>

						<div class="section-heading">
							<h2>MYPAGE</h2>
							

							<div class="heading-line"></div>
							<p>닉네임 : ${user.nickname }</p>
							<p>선호하는 맛 : ${user.userFavTasteVO.beerTasteVO.beerTasteName }</p>
						</div>
					</div>
				</div>
			</div>

			<!-- <!--  -->
			<div class="row">
				<a id ="contact" href="<c:url value="/contact"/>">contact form으로 이동</a>
			</div>
			<!-- <!--  -->
		</div>
	</div>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p>Copyright &copy; Jeony. All rights reserved.</p>
					<div class="credits">

						Designed with <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<!-- sidebar -->
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
		}
	</script>
</body>
</html>
