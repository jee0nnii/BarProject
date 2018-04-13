<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>맥주상세페이지</title>
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

<script type="text/javascript">
	$().ready(function() {
		function loadEvals(scrollTop) {
		$.get("<c:url value="/api/evalRead/${desc.beerId}"/>",
				{}, function(response) {
				for ( var i in response) {
					appendEvals(response[i]);
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
			var nickname = eval.userVO.nickname;/*  + "(" + eval.userVO.email + ")" */

			var top = $("<span class = 'writer'>" + nickname
					+ "</span><span class = 'regist-date'>"
					+ eval.evalRegistDate + "</span>")
			evalDiv.append(top);

			var body = $("<div class = 'body'>"
					+ eval.beerEvalTalk + "</div>");
			evalDiv.append(body);

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
</style>
</head>

<body>
	<div class="wrapper">
		<!-- Works -->
		<div class="container bg-white">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>BeerDesc</h2>
						<div class="heading-line"></div>
						<p>상세 페이지</p>
					</div>
				</div>
			</div>
		</div>

		<!-- detail  -->
		<div class="row">
			<div class="col-md-offset-1 col-md-4">
				<img src="<c:url value="${desc.beerImg }"/>" />
			</div>
			<div class="col-md-4">
				<h4>${desc.beerNameKor }</h4>
				<hr />
				<p>${desc.beerNameEng }</p>
				제조국가 : <span>${desc.beerCountry }</span><br> 타입 : <span>${desc.beerType }</span><br>
				맛 : <span>${desc.beerTaste }</span><br> 도수 : <span>${desc.beerVolume }</span><br>
				적정온도 : <span>${desc.beerTemp }</span> <br>
			</div>
		</div>
		<!-- detail -->
		<!-- evaluation -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<h4>맥주 평가 부분</h4>
				<hr>
				<div id="beerEval">
					<c:forEach items="${beerEval }" var="beerEval">
						<div class='eval'>
							<span class='writer'>${beerEval.userVO.nickname }</span> <span
								class='regist-date'>${beerEval.evalRegistDate }</span>
							<div class='body'>${beerEval.beerEvalTalk }</div>
						</div>
					</c:forEach>
				</div>
				
				<div id="createEvalDiv">
					<div id="createEval">
						<div class='rating-widget'>
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
									<textarea id="beerEvalTalk" name="beerEvalTalk"></textarea>
								</div>
								<div>
									<input type="button" class="btn" id="writeEvalBtn" value="등록" />
								</div>
							</div>
						</form>
					</div>
					<!-- evaluation -->

				</div>
			</div>
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


</body>
</html>
