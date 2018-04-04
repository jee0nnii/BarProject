<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>져니바</title>
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

<script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"
	type="text/javascript"></script>

<style>
.sidenav {
	height: 100%;
	width: 300px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #FE7A66;
	/*  overflow-x: hidden; */
	padding-top: 60px;
	transition: 0.5s;
}

.side-section {
	display: inline-block;
	width: 1219px;
	float: right;
	padding: 150px 0px 150px 0px;
}
</style>

</head>

<body>
	<div class="wrapper">
		<!-- 주황주황 <div class="sidenav"></div> -->
		<!-- Works -->
		<div class="container bg-white">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>WeHave</h2>
						<div class="heading-line"></div>
						<p>골라골라아아</p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <!--  -->
		<div class="row">
			<div class="col-lg-12">

				<ul id="og-grid" class="og-grid">
					<c:forEach items="${beerList}" var="beerList">
						<li><a href="#"> <img
								src="<c:url value="${beerList.beerImg }"/>"
								style="width: 200px; height: 200px;" alt="img01" />
						</a></li>
						<p>${beerList.beerNameKor}</p>
						<!-- <li><a href="#"> <img
							src="https://image.mycelebs.com/beer/new/sq/241338_sq_1477230606.jpg"
							style="width: 200px; height: 200px;" "alt="img01" />
					</a></li>
					<li><a href="#"> <img
							src="https://image.mycelebs.com/beer/new/sq/241358_sq_1477448309.jpg"
							style="width: 200px; height: 200px;" alt="img01" />
					</a></li>
					<li><a href="#"> <img
							src="https://image.mycelebs.com/beer/new/sq/241355_sq_1477273995.jpg"
							style="width: 200px; height: 200px;" alt="img01" />
					</a></li> -->
					</c:forEach>
				</ul>

			</div>
		</div>
		<!-- <!--  -->

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


</body>
</html>
