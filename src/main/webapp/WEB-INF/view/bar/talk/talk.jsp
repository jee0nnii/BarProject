<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<title>게시글 리스트</title>
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
	$("#contactBtn").click(function(){
		location.href="<c:url value="/contact"/>";
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




		<div id="main">

			<!-- Works -->
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

						<div class="section-heading">
							<h2>Talk Board</h2>
							<div class="heading-line" style="float:left">
							</div>
							<%-- <div class="container">
								<a class="btn btn-default pull-right" id="insertbtn" href="<c:url value="/write"/>">글쓰기</a>
								<a class="btn btn-default pull-right" href="<c:url value="/mypage"/>">마이페이지</a>
						
						 --%>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>번호</th>
											<th>타입</th>
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									
									<c:forEach items="${qnaList}" var="qnaList">
										<tbody>
											<tr>
												<td>${qnaList.qnaId}</td>
												<td>${qnaList.qnaType}</td>
												<td><a href="<c:url value="/qna/${qnaList.qnaId}"/>">${qnaList.qnaTitle}</a></td>
												<td>${qnaList.userVO.nickname}</td>
												<td>${qnaList.qnaRegistDate}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
						
						<%-- <div class="text-center">
								<form id ="pageForm" onsubmit="movePage('0')">
								${pageExplorer.make()}
								</form>
									<ul class="pagination">
										<li><a href="#">&laquo;</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
								</div>
								<hr /> --%>
							
							<button class="btn" style="float:right;" id ="contactBtn">contact form으로 이동</button>
							<br><br></div>
						
						</div>
					</div>
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
