<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>맥주상세페이지</title>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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

<script type="text/javascript">
	$().ready(function() {
		loadEvals(0);
		function loadEvals(scrollTop) {
		$.get("<c:url value="/api/evalRead/${desc.beerId}"/>",
				{}, function(response) {
					var test = ${desc.beerId};
					console.log(test);
				for ( var i in response) {
					appendEvals(response[i]);
					console.log(response);
				}
				$(window).scrollTop(scrollTop);
				});
		}
		$("#writeEvalBtn").click(function() {
			//잘들어가는지확인
			console.log($("#writeEvalForm").serialize());
			$.post("<c:url value="/api/evalWrite/${desc.beerId}"/>",
				$("#writeEvalForm").serialize(),function(response) {
					if (response.status) {
						alert("등록됨");
					$("#beerEvalPoint").val("");
					$("#beerEvalTalk").val("");

					$("#createEval").appendTo("#createEvalDiv");

					var scrollTop = $(window).scrollTop();
					//appendEvals(response.eval);
					$("#beerEval").html("");
					loadEvals(scrollTop);
					} else {
						alert("등록 실패");
					}
				});
		});

		/* 댓글 들어갈 창*/
		function appendEvals(eval) {
			var evalDiv = $("<div class ='eval'></div>");
			var hrbar = $("<hr/>");
			evalDiv.append(hrbar);
			var nickname = eval.userVO.nickname + "[" + eval.userVO.email + "]";
			var givePoint = $("<div class = 'col-md-3 givePoint' style ='display:inline-block;'><span class = 'writer'>" + nickname+ "</span></div>")
			evalDiv.append(givePoint);
			var body = $("<div class = 'col-md-7 body' style ='display:inline-block;'>" + eval.beerEvalTalk + "</div>");
			evalDiv.append(body);
			
			var down = $("<div class = 'regist-date' style ='display:inline-block;'>"
					+ eval.evalRegistDate + "</div>")
			evalDiv.append(down);
			
			$("#beerEval").append(evalDiv);
		}

		/* star rating */
		/* 1. Visualizing things on Hover - See next part for action on click */
		$('#stars li').on('mouseover',function() {
			var onStar = parseInt(
			$(this).data('value'), 10); // The star currently mouse on

		// Now highlight all the stars that's not after the current hovered star
			$(this).parent().children('li.star').each(function(e) {
				if (e < onStar) {
					$(this).addClass('hover');
				} else {
				$(this).removeClass('hover');
				}
			});

		}).on('mouseout',function() {
			$(this).parent().children('li.star').each(function(e) {
				$(this).removeClass('hover');
			});
		});

		/* 2. Action to perform on click */
		$('#stars li').on('click',function() {
			var onStar = parseInt($(this).data('value'), 10); // The star currently selected
			var stars = $(this).parent().children('li.star');

			for (i = 0; i < stars.length; i++) {
				$(stars[i]).removeClass('selected');
			}

			for (i = 0; i < onStar; i++) {
				$(stars[i]).addClass('selected');
			}

			// JUST RESPONSE (Not needed)
			var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
			var msg = ratingValue;
			responseMessage(msg);
		});

		function responseMessage(msg) {
			$('.success-box').fadeIn(200);
			$('.success-box div.text-message').html("<span>" + msg + "</span>");
			$('input[name=beerEvalPoint]').val(msg);
		}
	});
</script>
<style>
textarea{
width:100%;
}
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
.beerInfo{
font-size: 15px;
}

.beerInfo div{
margin-bottom: 10px;
}
</style>
</head>

<body>
	<div class="wrapper">
	
	
	<!-- sidebar  -->
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="<c:url value ="/main"/>"><i class="fa fa-home" style="font-size:24px"></i>&nbsp;&nbsp;MAIN</a>
			<a href="<c:url value ="/wehave"/>">WE HAVE</a> 
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
							<h2>BEER DESC</h2>
							
							<div class="heading-line" style="float:left"></div><br>
						</div>
					</div>
				</div>
			</div>


		<!-- detail  -->
		<div class="row">
			<div class="col-md-offset-1 col-md-4">
				<img src="<c:url value="${desc.beerImg }"/>" /><br>
				
				<a href="<c:url value = "/chooseLike/${desc.beerId}"/>">
				<img src = "<c:url value="/static/img/like/like.png"/>" style ="width:30px"/>
				</a><span>${desc.beerLike }</span>
				
			</div>
			<div class="col-md-5 beerInfo">
				<h4>${desc.beerNameKor }</h4>
				<hr />
				
				<c:if test="${sessionScope.__USER__.email == 'admin' }">
				<div style="text-align:right;"><a id ="deleteBeer" href="<c:url value="/beer/delete/${desc.beerId }"/>">삭제하기</a></div>
				</c:if>
				
				<div><h5>${desc.beerNameEng }</h5></div>
				<div class="col-md-3">
				<div>제조국가</div> 
				<div>타입</div>
				<div>맛 </div>
				<div>도수</div>
				<div>적정온도</div>
				
				
				</div>
				<div>
				<div> ${desc.beerCountry }</div> 
				<div> ${desc.beerTypeFullname }</div>
				<div>${desc.beerTasteVO.beerTasteName}</div>
				<div>${desc.beerVolume }</div>
				<div>${desc.beerTemp }</div>
				</div>
			</div>
			
			
			
		</div>
		<br><br><br><br>
		<!-- detail -->
		<!-- evaluation -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<h4 style ="text-align:left;margin-left:20px;">Evaluation</h4>
				<hr>
								
				<div id="createEvalDiv" class='col-md-12'>
					<div id="createEval">
						<div class='col-md-4 rating-widget' style ="display: inline-block;position: relative;top: 11px;left: -35px;">
							<div class='rating-stars text-center'>
								<ul id='stars'>
									<li class='star' title='Poor' data-value='1'><i
										class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Fair' data-value='2'><i
										class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Good' data-value='3'><i
										class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Excellent' data-value='4'><i
										class='fa fa-star fa-fw'></i></li>
									<li class='star' title='WOW!!!' data-value='5'><i
										class='fa fa-star fa-fw'></i></li>
								</ul>
							</div>
							<div class='success-box'>
								<div class='text-message'></div>
							</div>
						</div>
							<form id="writeEvalForm">
								<div class="beerEvaluation">
									<!-- Rating Stars Box -->
									<div>
										<input type="hidden" name="beerEvalPoint" />
									</div>
									<div>
										<textarea id="beerEvalTalk" name="beerEvalTalk" cols=75></textarea>
									</div>
									<div>
										<input type="button" class="btn" id="writeEvalBtn" value="등록" style="position:relative;top:-21px;height : 50px;" />
									</div>
								</div>
							</form>
					</div>
				</div>
				
				<!-- eval result -->
				<div id="beerEval">
				<!-- 이 밑으로 쌓임  -->					
				</div>				
			</div>
		</div><br><br><br><br>
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
