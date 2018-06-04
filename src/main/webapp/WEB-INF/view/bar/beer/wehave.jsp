<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>맥주리스트</title>
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
/* 페이징 */
.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}

.pagination b.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

/* 캡션 */
.captioncontain {
    width: 200px;
    margin: 0 auto;
    display:inline-block;
}
 
h3 {
    font-size: 1.5em;
    padding-bottom: 10px;
    text-transform: uppercase;
    color:#fff;
}
.captioncontain figure {
	margin: 0;
    position: relative;
    background-color: #000;
    display:inline-block;
}
 
.captioncontain figure img {
    max-width: 100%;
    display: block;
    position: relative;
}
.captioncontain figcaption {
    position: absolute;
    top: 25%;
    left: 0;
    width: 100%;
    text-align: center;
    opacity: 0;
    color: #fff;
}
.captioncontain figure:hover img {
    opacity: 0.25;
    -webkit-transition: all .8s ease;
    -moz-transition: all .8s ease;
    transition: all .8s ease;
}
 
.captioncontain figure:hover  figcaption{
    opacity: 1;
    -webkit-transition: all .8s ease;
    -moz-transition: all .8s ease;
    transition: all .8s ease;
}
/* Button */
a.morebtn {
    color: #fff;
    text-decoration: none;
    border: 1px solid #fff;
    padding: 10px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
}
 
a.morebtn:hover {
    background-color: #fff;
    color: #666666;
}
#searchKey{
	text-align:left;
	margin-bottom:20px;
}
#searchKey a{
	padding-left :9px;	
}
#searchKey a{
	color : #333;
	font-size :1.1em;	
}
#searchKey a:hover{
	font-size :1.2em;
	font-weight:bold;
	text-decoration: none;	
}
#searchKey a:acitve{
	font-size :1.2em;
	font-weight:bold;
	color :blue;
	text-decoration: none;	
}

</style>
<script type="text/javascript">
$().ready(function(){
	$(".pagebtn").click(function(){
		$(this).addClass("active");
	});
	
	$(".search-input").keyup(function(){
		if(event.key == "Enter"){
			
		}
	});
	
	
});

/* search js */
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
			<a href="<c:url value ="/main"/>"><i class="fa fa-home" style="font-size:24px"></i>&nbsp;&nbsp;MAIN</a>
			<a href="#" class = "active">WE HAVE</a> 
			<a href="<c:url value ="/talk"/>"><i class="fa fa-comments" style="font-size:24px"></i>&nbsp;&nbsp;TALK</a>
		</div>

		<div id="main">

			<!-- 로그인 상태 확인-->
			<div class="container bg-white">
				<div class="row">
					<div class="col-md-offset-1 col-md-10" style="text-align: left">
						<span id ="opennav" style="font-size: 25px; cursor: pointer" onclick="openNav()">&#9776;&nbsp;open</span>
						<div id="statusChk" style="display: inline-block; float: right;">
							
							<c:if test="${empty sessionScope.__USER__ }">
								<span id="goLogin"><a href="<c:url value="/join"/>">JOIN</a></span>
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
							<h2>WeHave</h2>
							<!-- search -->
							<form id="searchForm" onsubmit="submitFn(this, event);">
								<div class="search-wrapper">
									<div class="input-holder">
									<!-- searchKeyword 입력 -->
										<input type="text" class="search-input" value = "${search.searchKeyword}" name ="searchKeyword" placeholder="Type to Search" />
										<button class="search-icon"	onclick="searchToggle(this, event);">
											<span></span>
										</button>
									</div>
									<span class="close" onclick="searchToggle(this, event);"></span>
									<div class="result-container"></div>
								</div>
							</form>

							<div class="heading-line" style="float:left"></div>
							
						</div>
					</div>
				</div>
			</div>





			<!-- <!--  -->
			<div class="row">
				
					
						<div id = "searchKey" class="col-md-offset-2 col-md-6"> <!-- 맛별 -->
							<a  href="<c:url value="/wehave"/>" style="padding-left:30px;font-weight:bold">전체</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/1"/>">고소한맛</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/2"/>">과일맛</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/3"/>">달콤한맛</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/4"/>">깔끔한맛</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/5"/>">새콤한맛</a>
							<a class="beerTaste" href="<c:url value="/wehave/taste/6"/>">씁쓸한맛</a>
						</div>
						<div id = "searchKey" class="col-md-offset-2 col-md-8"> <!-- 타입별 -->
							<a href="<c:url value="/wehave/type/1"/>" style="padding-left:30px;">IPA</a>
							<a href="<c:url value="/wehave/type/2"/>">라거</a>
							<a href="<c:url value="/wehave/type/3"/>">에일</a>
							<a href="<c:url value="/wehave/type/4"/>">스타우트</a>
							<a href="<c:url value="/wehave/type/5"/>">과일맥주</a>
							<a href="<c:url value="/wehave/type/6"/>">두벨</a>
							<a href="<c:url value="/wehave/type/7"/>">바이젠</a>
							<a href="<c:url value="/wehave/type/8"/>">복</a>
							<a href="<c:url value="/wehave/type/9"/>">쾰쉬</a>
							<a href="<c:url value="/wehave/type/10"/>">쿼드러플</a>
							<a href="<c:url value="/wehave/type/11"/>">트리펠</a>
							<a href="<c:url value="/wehave/type/12"/>">포터</a>
							<a href="<c:url value="/wehave/type/13"/>">필스너</a>
							<a href="<c:url value="/wehave/type/14"/>">OTHER</a>
						</div>
						<div class="heading-line" style="float:left"></div>
				</div>
				<div class="col-lg-12">	
				<div class="col-md-offset-1 col-md-10 flex">
				<div id = "tasteName"></div>
					<c:forEach items="${beerTaste}" var="beerTaste">
						<div class="captioncontain">
							<figure>
								<img src="<c:url value="${beerTaste.beerImg }"/>" 
									style="width: 220px; height: 220px; display: inline-block;" alt="img01" />
								<figcaption>
									<h3>${beerTaste.beerNameKor}</h3>
									<a href="<c:url value="/beer/desc/${beerTaste.beerId }"/>" class="morebtn">more</a>
								</figcaption>
							</figure>
						</div>
					</c:forEach>
				</div>
				
				
				<div class="col-md-offset-1 col-md-10 flex">
					<c:forEach items="${beerType}" var="beerType">
						<div class="captioncontain">
							<figure>
								<img src="<c:url value="${beerType.beerImg }"/>" 
									style="width: 220px; height: 220px; display: inline-block;" alt="img01" />
								<figcaption>
									<h3>${beerType.beerNameKor}</h3>
									<a href="<c:url value="/beer/desc/${beerType.beerId }"/>" class="morebtn">more</a>
								</figcaption>
							</figure>
						</div>
					</c:forEach>
				</div>
				
				<div>${pageExplorer.totalCount }</div>
					<div class="col-md-offset-1 col-md-10 flex">
					
					
						<c:forEach items="${pageExplorer.list}" var="beerList">
							<div class="captioncontain">
								<figure>
								<img src="<c:url value="${beerList.beerImg}"/>"
									style="width: 220px; height: 220px; display: inline-block;"
									alt="img01" />
								<figcaption>
								<h3>${beerList.beerNameKor}</h3>
								<a href="<c:url value="/beer/desc/${beerList.beerId }"/>" class="morebtn">more</a>
								</figcaption>
								</figure>
							</div>
						</c:forEach>
					
					</div>

				</div>
				<form id="pageForm" class="pagination" onsubmit="movePage('0')">${pageExplorer.make() }</form>
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

	<script>
	/* sidebar  */
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
