<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<title>LOGIN</title>
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
	$("#loginBtn").click(function() {
		$("#loginForm").attr({
			"action" : "<c:url value = "/login"/>",
			"method" : "post"
		}).submit();
	});
	$("#joinBtn").click(function() {
		location.href = "<c:url value = "/join"/>"
	});
	$("#findPwdBtn").click(function(){
		$("#findPwdForm").attr({
			"action" : "<c:url value = "/findPwd"/>",
			"method" : "post"
		}).submit();
	});
	
	
	$("#wehave").click(function(){
	    $("li #wehave").removeClass("current");
	    location.href="<c:url value="/wehave"/>";
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
    $("#goFesta").click(function(){
	    $("li #goFesta").removeClass("current");
	    location.href="<c:url value="/main#festa"/>";
	});	
    $("#goAbout").click(function(){
	    $("li #goAbout").removeClass("current");
	    location.href="<c:url value="/main#about"/>";
	});	
	
});

</script>
<style>
.midline{
    margin: 0 auto;
    display: block;
    height: 1px;
    width: 80px;
    background: #333;
    margin-top: 10px;
    margin-bottom: 20px;
}
</style>
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
				<a class="navbar-brand" href="/jb/main#intro">JEONY</a>

			</div>
			<div id ="dropmenu" class="navigation">
				  <ul class="nav navbar-nav">
					  <li id = "goAbout"><a href="<c:url value ="/main#about"/>">About Us</a></li> 
					  <li class ="has-sub" id ="list"><a href="#services">List</a>
	                  	<ul>
	                  		<li id ="wehave"><a href="<c:url value="/wehave"/>">wehave</a></li>
	                  		<li id ="talk" style="color:black"><a href="<c:url value="/talk"/>">talk</a></li>
	                  	</ul>
	                  </li>
	                  <li id = "goFesta"><a href="/jb/main#festa">Festa</a></li>
	                  
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
	<br><br><br><br><br>
	<!-- login form -->
	<div style="margin-top: 20px;">
		<div class="col-md-4 col-md-offset-4" id="loginSection">
			<h3>&nbsplogin form</h3>
			<div class = "midline"></div>
			<form:form modelAttribute="loginForm">
				<div style="margin-bottom:5px;">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Enter Email">
				</div>
				<div style="margin-bottom:5px;">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Enter password">
				</div>
				<div style="float: right">
					<span id="joinBtn">JOIN US &nbsp&nbsp</span> 
					<input type="button" id="loginBtn" class="btn" value="LOGIN" />
				</div>
			</form:form>
		</div>
	</div>



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
