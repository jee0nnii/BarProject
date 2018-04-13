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
<!-- search js-->
<script type="text/javascript">
	function searchToggle(obj, evt) {
		var container = $(obj).closest('.search-wrapper');

		if (!container.hasClass('active')) {
			container.addClass('active');
			evt.preventDefault();
		} else if (container.hasClass('active')
				&& $(obj).closest('.input-holder').length == 0) {
			container.removeClass('active');
			// clear input
			container.find('.search-input').val('');
			// clear and hide result container when we press close
			container.find('.result-container').fadeOut(100, function() {
				$(this).empty();
			});
		}
	}

	function submitFn(obj, evt) {
		value = $(obj).find('.search-input').val().trim();

		_html = "검색 단어는 : ";
		if (!value.length) {
			_html = "검색어를 입력하세요:D";
		} else {
			_html += "<b>" + value + "</b>";
		}

		$(obj).find('.result-container').html('<span>' + _html + '</span>');
		$(obj).find('.result-container').fadeIn(100);

		evt.preventDefault();
	}
</script>
</head>

<body>
	<div class="wrapper">

		<!-- sidebar  -->
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
			<a href="#">Contact</a>
		</div>




		<div id="main">

			<!-- Works -->
			<div class="container bg-white">
				<div class="row">
					<div class="col-md-offset-1 col-md-10" style="text-align: left">

						<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;open</span>
						<div id="statusChk" style="display: inline-block; float: right;">
							<span>LOGIN</span> <span>MYPAGE</span>
						</div>

						<div class="section-heading">
							<h2>WeHave</h2>
							<!-- search -->
							<form onsubmit="submitFn(this, event);">
								<div class="search-wrapper">
									<div class="input-holder">
										<input type="text" class="search-input"
											placeholder="Type to Search" />
										<button class="search-icon"
											onclick="searchToggle(this, event);">
											<span></span>
										</button>
									</div>
									<span class="close" onclick="searchToggle(this, event);"></span>
									<div class="result-container"></div>
								</div>
							</form>

							<div class="heading-line"></div>
							<p>골라골라아아</p>
						</div>
					</div>
				</div>
			</div>

			<!-- <!--  -->
			<div class="row">
				<div class="col-lg-12">
					<div>${pageExplorer.totalCount }</div>
					<div class="col-md-offset-1 col-md-10 flex">
						<c:forEach items="${pageExplorer.list}" var="beerList">
							<a href="<c:url value="/beer/desc/${beerList.beerId }"/>"> <img
								src="<c:url value="${beerList.beerImg }"/>"
								style="width: 220px; height: 220px; display: inline-block;"
								alt="img01" />
							</a>
							<%-- <p>${beerList.beerNameKor}</p> --%>
						</c:forEach>
					</div>

				</div>
				<form id="pageForm" onsubmit="movePage('0')">${pageExplorer.make() }</form>
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
