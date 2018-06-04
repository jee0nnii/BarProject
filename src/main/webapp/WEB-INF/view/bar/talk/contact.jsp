<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<title>qna등록</title>
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
	var mode = "${mode}";
	if(mode == "modify"){
		var url = "<c:url value="/modify/${qnaVO.qnaId}"/>";
	}else{
		var url = "<c:url value="/contact"/>";
	}
	
	$("#writeBtn").click(function() {
		var writeForm = $("#writeForm");
		/* 속성을 제어시킴 */
		writeForm.attr({
			"method" : "post",
			"action" : "<c:url value="/contact"/>"
		});
		writeForm.submit();
	});	
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


		<!-- Contact -->
	<section id="contact">
	<div id ="main">
		<div class="container bg-white">
			<div class="row">
			
			<div class="col-md-offset-1 col-md-10" style="text-align: left">
						<span id ="opennav" style="font-size: 25px; cursor: pointer" onclick="openNav()">&#9776;&nbsp;open</span>
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
						
						</div>
			
			
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>Contact us</h2>
						<div class="heading-line"></div>
						<p>문의사항 등록</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-offset-2 col-md-8 ">

					<form:form modelAttribute="contactForm">
						<div style="margin-bottom:5px;"><input type="text" id="qnaTitle" class="form-control" name="qnaTitle" 
						value="${qnaVO.qnaTitle }" placeholder="제목 입력"/></div>
						<div style="margin-bottom:5px;"><input type="text" id="qnaType" class="form-control" name="qnaType" 
						value="${qnaVO.qnaType }" placeholder="질문 타입 입력" /></div>
						<div style="margin-bottom:5px;"><textarea id="qnaContents" class="form-control"
						 name="qnaContents" placeholder="질문입력" rows = 10>${qnaVO.qnaContents }</textarea></div>
						<input type="hidden" id="id" name="id" value="${sessionScope.__USER__.id}" />
						<div>
						<input type="submit" id="writeBtn" class="btn" value="등록" />
						</div>
					</form:form>
					<!-- <form action="" method="post" class="form-horizontal contactForm"
						role="form">
						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="세션에서 받아온 닉네임" data-rule="minlen:4"
									data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="세션에서 받아온 이메일" data-rule="email"
									data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="문의사항 제목" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									data-rule="required" data-msg="내용"
									placeholder="Message"></textarea>
								<div class="validation"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-2 col-md-8">
								<button type="submit" class="btn btn-theme btn-lg btn-block">Send
									message</button>
							</div>
						</div>
					</form> -->

				</div>
			</div>
			</div>
		</div>
	</section>


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
	
		<!-- js -->
	<script src="<c:url value="/static/js/jquery.js"/>"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/static/js/wow.min.js"/>"></script>
	<script src="<c:url value="/static/js/mb.bgndGallery.js"/>"></script>
	<script src="<c:url value="/static/js/mb.bgndGallery.effects.js"/>"></script>
	<script
		src="<c:url value="/static/js/jquery.simple-text-rotator.min.js"/>"></script>
	<script src="<c:url value="/static/js/jquery.scrollTo.min.js"/>"></script>
	<script src="<c:url value="/static/js/jquery.nav.js"/>"></script>
	<script src="<c:url value="/static/js/modernizr.custom.js"/>"></script>
	<script src="<c:url value="/static/js/grid.js"/>"></script>
	<script src="<c:url value="/static/js/stellar.js"/>"></script>
	<!-- Contact Form JavaScript File -->
	<script src="<c:url value="/static/contactform/contactform.js"/>"></script>

	<!-- Template Custom Javascript File -->
	<script src="<c:url value="/static/js/custom.js"/>"></script>
	
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
