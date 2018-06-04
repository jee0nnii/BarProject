<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>문의사항 글</title>
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
<!--테이블 -->


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
	color: #333427;
	display: block;
	transition: 0.3s;
	text-align : left;
}
#opennav{
	color: #333427;
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
			<a href="<c:url value ="/main"/>"><i class="fa fa-home" style="font-size:24px"></i>&nbsp;&nbsp;MAIN</a>
			<a href="<c:url value ="/wehave"/>">WE HAVE</a> 
			<a href="#" class = "active"><i class="fa fa-comments" style="font-size:24px"></i>&nbsp;&nbsp;TALK</a>
		</div>




		<div id="main">

			<!-- Works -->
			<div class="container bg-white">
				<div class="row">
					<div class="col-md-offset-1 col-md-10" style="text-align: left">
						<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;open</span>
						<div id="statusChk" style="display: inline-block; float: right;">
							<c:if test="${empty sessionScope.__USER__ }">
								<span id="goLogin">JOIN</span>
							</c:if>
							<c:if test="${not empty sessionScope.__USER__ }">
								${sessionScope.__USER__.nickname}, Hellooo:D &nbsp;&nbsp;
								<span id="goMypage"><a href="<c:url value="/mypage"/>">MYPAGE</a></span>&nbsp;&nbsp;
							</c:if>	
							<c:if test="${empty sessionScope.__USER__}">
								<span><a href="<c:url value="/login"/>">LOGIN</a></span>
							</c:if>
							<c:if test="${not empty sessionScope.__USER__ }">
								<span><a href="<c:url value="/logout"/>">LOGOUT</a></span>
							</c:if>
							
						</div>

						<div class="section-heading">
							<h2>Talk Detail</h2>
							

							<div class="heading-line" style="float:left"></div>
							<!-- <p>골라골라아아</p> -->
						</div>
					</div>
				</div>
			</div>
			<div class="container bg-white">
			<!-- <!--  -->
				<div class="row">
					<div class="col-md-offset-1 col-md-10">
						<h5 style="text-align:left;"><a href="<c:url value = "/talk"/>" >목록으로</a></h5>
					<div style ="padding:5px;">
						<div class="col-md-4" style ="display:inline-block;text-align:left;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;">qnaNo. <b>${qnaOne.qnaId }</b></div>
						<div class="col-md-8" style ="display:inline-block;text-align:center;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;">${qnaOne.qnaTitle }</div><!-- 글제목  -->
					</div>
					<br>
					<div>
						<div class="col-md-4" style ="display:inline-block;text-align:left;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;">Type. <b>${qnaOne.qnaType }</b></div>
						<div class="col-md-3" style ="display:inline-block;text-align:right;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;">${qnaOne.userVO.nickname }</div>
						<div class="col-md-5" style ="display:inline-block;text-align:right;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;">${qnaOne.qnaRegistDate }</div>
					</div>
					<div>
						<div class="col-md-4" style ="display:inline-block;text-align:left;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;height:300px;"><b>내용</b></div>
						<div class="col-md-8" style ="display:inline-block;text-align:center;font-size:1.2em;border-bottom:1px solid #ccc;padding:10px;height:300px;"> ${qnaOne.qnaContents }</div>	
					</div>
					
					<c:if
						test="${sessionScope.__USER__.id == qnaOne.userVO.id }">
						<div style ="display:inline-block;"><h5><a href="<c:url value = "/modify/${qnaOne.qnaId }"/>">수정하기</a></h5></div>
						<div style ="display:inline-block;"><h5><a href="<c:url value ="/delete/${qnaOne.qnaId }"/>">삭제하기</a></h5></div>
					</c:if>			
				</div>
				</div>
			</div><br><br><br><br><br>
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
