<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Welcome To JeonyBar</title>
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
$().ready(function(){
	$("#wehave").click(function(){
	    $("li #wehave").removeClass("current");
	    location.href="<c:url value="/wehave"/>";
	});
	$("#goWeHave").click(function(){
	    location.href="<c:url value="/wehave"/>";
	});
	$("#goTalk").click(function(){
	    location.href="<c:url value="/talk"/>";
	});
	$("#talk").click(function(){
	    $("li #talk").removeClass("current");
	    location.href="<c:url value="/talk"/>";
	});
	
	$("#login").click(function(){
	    $("li #login").removeClass("current");
	    location.href="<c:url value="/login"/>";
	});
	
    $("#join").click(function(){
	    $("li #join").removeClass("current");
	    location.href="<c:url value="/join"/>";
	});	
    
    $("#logout").click(function(){
	    $("li #logout").removeClass("current");
	    location.href="<c:url value="/logout"/>";
	});
	
    $("#mypage").click(function(){
	    $("li #mypage").removeClass("current");
	    location.href="<c:url value="/mypage"/>";
	});	
	$("#adminPage").click(function(){
	    $("li #adminPage").removeClass("current");
	    location.href="<c:url value="/admin"/>";
	});	
	
});

</script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle nav</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<!-- Logo text or image -->
				<a class="navbar-brand" href="#intro">JEONY</a>

			</div>
			<div id ="dropmenu" class="navigation">
				  <ul class="nav navbar-nav">
					  <li><a href="#about">About Us</a></li> 
					  <li class ="has-sub" id ="list"><a href="#services">List</a>
	                  	<ul>
	                  		<li id ="wehave"><a href="<c:url value="/wehave"/>">wehave</a></li>
	                  		<li id ="talk" style="color:black"><a href="<c:url value="/talk"/>">talk</a></li>
	                  	</ul>
	                  </li>
	                  <li><a href="#festa">Festa</a></li>
	                  
	                  <li>
	                  		<c:if test="${empty sessionScope.__USER__}">
	                  		<a id ="login" href="<c:url value="/login"/>">LOGIN</a>
	                  		</c:if>
	                  		<c:if test="${not empty sessionScope.__USER__ }">
								<a id ="logout" href="<c:url value="/logout"/>">LOGOUT</a>
							</c:if>
	                  </li>
	                  <li>
                  		<c:if test="${empty sessionScope.__USER__}">
                  		<a id ="join" href="<c:url value="/join"/>">JOIN</a>
                  		</c:if>
                  		<c:if test="${not empty sessionScope.__USER__ && sessionScope.__USER__.email != 'admin'}">
							<a id ="mypage" href="<c:url value="/mypage"/>">MYPAGE</a>
						</c:if>
                  		<c:if test="${sessionScope.__USER__.email == 'admin' }">
							<a id ="adminPage" href="<c:url value="/admin"/>">ADMIN PAGE</a>
						</c:if>
                  		</li>
	              </ul>
			</div>
		</div>
	</nav>					
	<!-- intro -->
	<div id="intro">
		<div class="intro-text">
			<!--  style="display:inline-block;" -->
			<div class="container">
				<div class="col-md-12">
					<div id="rotator">
						<h1>
							<span class="1strotate">금주하게, 그만먹게, 술 끊게</span>
						</h1>
						<div class="line-spacer"></div>
						<p>
							<span class="2ndrotate">sub1, sub2, sub3</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About -->
	<section id="about" class="home-section bg-white">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>About us</h2>
						<div class="heading-line"></div>
						<p>we are</p>
					</div>
				</div>
			</div>
			<div class="row wow fadeInUp">
				<div class="col-md-6 about-img">
					<img src="static/img/about-img.jpg" alt="">
				</div>

				<div class="col-md-6 content">
					<h2>Hang overrrr</h2>
					<h3>ㅋㅋㅋ</h3>
					<p>always</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Parallax 1 -->
	<section id="parallax1" class="home-section parallax"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="color-light">
						<h2 class="wow bounceInDown" data-wow-delay="0.5s">적셔~~~~~</h2>
						<p class="lead wow bounceInUp" data-wow-delay="1s"></p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Services -->
	<section id="services" class="home-section bg-white">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>List + </h2>
						<div class="heading-line"></div>
						<p>WHAT WE OFFER</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="carousel-service" class="service carousel slide">
						<!-- slides -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div class="col-sm-12 col-md-offset-1 col-md-6">
										<div class="wow bounceInLeft">
											<h4>WeHave</h4>
											<p>Beers on our stocks</p>
											<input type ="button" id = "goWeHave" class="btn" value="more"/>
										</div>
									</div>
									<div class="col-sm-12 col-md-5">
										<div class="screenshot wow bounceInRight">
											<img src="static/img/screenshots/beer3.jpg"
												class="img-responsive" alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-sm-12 col-md-offset-1 col-md-6">
										<div class="wow bounceInLeft">
											<h4>Talk</h4>
											<p>ask about curious things</p>
											<input type ="button" id = "goTalk" class="btn" value="more"/>
										</div>
									</div>
									<div class="col-sm-12 col-md-5">
										<div class="screenshot wow bounceInRight">
											<img src="static/img/screenshots/relax.jpg"
												class="img-responsive" alt="" />
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="item">
								<div class="row">
									<div class="col-sm-12 col-md-offset-1 col-md-6">
										<div class="wow bounceInLeft">
											<h4>Web & Mobile Apps</h4>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna.</p>
										</div>
									</div>
									<div class="col-sm-12 col-md-5">
										<div class="screenshot wow bounceInRight">
											<img src="static/img/screenshots/3.png"
												class="img-responsive" alt="" />
										</div>
									</div>
								</div>
							</div> -->
						</div>

						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-service" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-service" data-slide-to="1"></li>
							<li data-target="#carousel-service" data-slide-to="2"></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Works -->
	<section id="festa" class="home-section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>FESTA</h2>
						<div class="heading-line"></div>
						<p>Upcoming Beer Festival</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-10">

					<ul id="og-grid" class="og-grid">
					<c:forEach items="${festa }" var="festa">
						<li><a href="<c:url value="${festa.festaLink}"/>" data-largesrc="<c:url value="${festa.festaImg }"/>"
							data-title="${festa.festaName }"
							data-description="${festa.festaDesc }">
								<img style="width:200px;height:200px"src="${festa.festaImg }" alt="" />
						</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- Parallax 2 -->
	<section id="parallax2" class="home-section parallax"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="clients">
						<li class="wow fadeInDown" data-wow-delay="0.3s"><a href="#"><img
								src="static/img/clients/1.png" alt="" /></a></li>
						<li class="wow fadeInDown" data-wow-delay="0.6s"><a href="#"><img
								src="static/img/clients/2.png" alt="" /></a></li>
						<li class="wow fadeInDown" data-wow-delay="0.9s"><a href="#"><img
								src="static/img/clients/3.png" alt="" /></a></li>
						<li class="wow fadeInDown" data-wow-delay="1.1s"><a href="#"><img
								src="static/img/clients/4.png" alt="" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>


	<!-- Bottom widget -->
	<section id="bottom-widget" class="home-section bg-white">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="contact-widget wow bounceInLeft">
						<i class="fa fa-map-marker fa-4x"></i>
						<h5>Location</h5>
						<p>
						 	GangNam-gu<br />Seoul
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="contact-widget wow bounceInUp">
						<i class="fa fa-phone fa-4x"></i>
						<h5>Call</h5>
						<p>
							620 719 8447
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="contact-widget wow bounceInRight">
						<i class="fa fa-envelope fa-4x"></i>
						<h5>Email us</h5>
						<p>
							admin@jeony.bar
						</p>
					</div>
				</div>
			</div>
			<div class="row mar-top30">
				<div class="col-md-12">
					<h5>We're on social networks</h5>
					<ul class="social-network">
						<li><a href="#"> <span class="fa-stack fa-2x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-facebook fa-stack-1x fa-inverse"></i>
							</span></a></li>
						<li><a href="#"> <span class="fa-stack fa-2x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-dribbble fa-stack-1x fa-inverse"></i>
							</span></a></li>
						<li><a href="#"> <span class="fa-stack fa-2x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-twitter fa-stack-1x fa-inverse"></i>
							</span></a></li>
						<li><a href="#"> <span class="fa-stack fa-2x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-pinterest fa-stack-1x fa-inverse"></i>
							</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p>Copyright &copy; Alstar. All rights reserved.</p>
					<div class="credits">
						<!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Alstar
            -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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

</body>
</html>
