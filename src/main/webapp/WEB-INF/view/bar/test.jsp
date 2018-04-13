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
<script type="text/javascript">
$().ready(function(){
	$("#wehave").click(function(){
	    $("li #wehave").removeClass("current");
	    location.href="<c:url value="/wehave"/>";
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
				<a class="navbar-brand" href="index.html">JEONY</a>

			</div>
			<div id ="dropmenu" class="navigation">
				  <ul class="nav navbar-nav">
                  <li><a href="#intro">Home</a></li>
                  <li><a href="#about">About Us</a></li> 
                  <li><a href="#service">Services</a></li>
                  <li class ="has-sub" id ="list">List
                  	<ul>
                  		<li id ="wehave"><a href="<c:url value="/wehave"/>">wehave</a></li>
                  		<li style="color:black"><a href="<c:url value="/wehave"/>">List</a></li>
                  		
                  	</ul>
                  </li>
                  <li><a href="#contact">Contact</a></li>
                  
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
							<span class="1strotate">para1, para2, para3</span>
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
						<h2 class="wow bounceInDown" data-wow-delay="0.5s">술은 우리의 적이다.</h2>
						<p class="lead wow bounceInUp" data-wow-delay="1s">마셔서 없애버리자</p>
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
						<h2>Services</h2>
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
											<h4>BeerPong</h4>
											<p>Lol</p>
											<h5><a href="<c:url value="/wehave"/>">wehave</a></h5>
										</div>
									</div>
									<div class="col-sm-12 col-md-5">
										<div class="screenshot wow bounceInRight">
											<img src="static/img/screenshots/1.jpg"
												class="img-responsive" alt="" />
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="item">
								<div class="row">
									<div class="col-sm-12 col-md-offset-1 col-md-6">
										<div class="wow bounceInLeft">
											<h4>Brand Identity</h4>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna.</p>
										</div>
									</div>
									<div class="col-sm-12 col-md-5">
										<div class="screenshot wow bounceInRight">
											<img src="static/img/screenshots/2.png"
												class="img-responsive" alt="" />
										</div>
									</div>
								</div>
							</div>
							<div class="item">
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
	<section id="portfolio" class="home-section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>Works</h2>
						<div class="heading-line"></div>
						<p>We’ve been building unique digital products, platforms, and
							experiences for the past 6 years.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">

					<ul id="og-grid" class="og-grid">
						<li><a href="#" data-largesrc="static/img/works/1.jpg"
							data-title="Portfolio title"
							data-description="Duo te dico volutpat, unum elit oblique per id. Ne duo mollis sapientem intellegebat. Per at augue vidisse percipit, pri vocibus assueverit interesset ut, no dolore luptatum incorrupte nec. In mentitum forensibus nec, nibh eripuit ut pri, tale illud voluptatum ut sea. Sed oratio repudiare ei, cum an magna labitur, eu atqui augue mei. Pri consul detracto eu, solet nusquam accusam ex vim, an movet interesset necessitatibus mea.">
								<img src="static/img/works/thumbs/1.jpg" alt="" />
						</a></li>
						<li><a href="#" data-largesrc="static/img/works/2.jpg"
							data-title="Portfolio title"
							data-description="Mea an eros periculis dignissim, quo mollis nostrum elaboraret et. Id quem perfecto mel, no etiam perfecto qui. No nisl legere recusabo nam, ius an tale pericula evertitur, dicat phaedrum qui in. Usu numquam legendos in, voluptaria sadipscing ut vel. Eu eum mandamus volutpat gubergren, eos ad detracto nominati, ne eum idque elitr aliquam.">
								<img src="static/img/works/thumbs/2.jpg" alt="" />
						</a></li>
						<li><a href="#" data-largesrc="static/img/works/3.jpg"
							data-title="Portfolio title"
							data-description="Vim ad persecuti appellantur. Eam ignota deterruisset eu, in omnis fierent convenire sed. Ne nulla veritus vel, liber euripidis in eos. Postea comprehensam vis in, detracto deseruisse mei ea. Ex sadipscing deterruisset concludaturque quo.">
								<img src="static/img/works/thumbs/3.jpg" alt="img01" />
						</a></li>
						<li><a href="#" data-largesrc="static/img/works/4.jpg"
							data-title="Portfolio title"
							data-description="In mentitum forensibus nec, nibh eripuit ut pri, tale illud voluptatum ut sea. Sed oratio repudiare ei, cum an magna labitur, eu atqui augue mei. Pri consul detracto eu, solet nusquam accusam ex vim, an movet interesset necessitatibus mea.">
								<img src="static/img/works/thumbs/4.jpg" alt="img01" />
						</a></li>
						<li><a href="#" data-largesrc="static/img/works/5.jpg"
							data-title="Portfolio title"
							data-description="Duo te dico volutpat, unum elit oblique per id. Ne duo mollis sapientem intellegebat. Per at augue vidisse percipit, pri vocibus assueverit interesset ut, no dolore luptatum incorrupte nec. In mentitum forensibus nec, nibh eripuit ut pri, tale illud voluptatum ut sea">
								<img src="static/img/works/thumbs/5.jpg" alt="img01" />
						</a></li>
						<li><a href="#" data-largesrc="static/img/works/6.jpg"
							data-title="Portfolio title"
							data-description="Id elit saepe pro. In atomorum constituam definitionem quo, at torquatos sadipscing eum, ut eum wisi meis mentitum. Probo feugiat ea duo. An usu platonem instructior, qui dolores inciderint ad. Te elit essent mea, vim ne atqui legimus invenire, ad dolor vitae sea.">
								<img src="static/img/works/thumbs/6.jpg" alt="img01" />
						</a></li>						
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

	<!-- Team 
	<section id="team" class="home-section bg-white">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>Our Team</h2>
						<div class="heading-line"></div>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<div class="box-team wow bounceInUp" data-wow-delay="0.1s">
						<img src="static/img/team/1.jpg" alt=""
							class="img-circle img-responsive" />
						<h4>Dominique Vroslav</h4>
						<p>Art Director</p>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"
					data-wow-delay="0.3s">
					<div class="box-team wow bounceInUp">
						<img src="static/img/team/2.jpg" alt=""
							class="img-circle img-responsive" />
						<h4>Thomas Jeffersonn</h4>
						<p>Web Designer</p>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"
					data-wow-delay="0.5s">
					<div class="box-team wow bounceInUp">
						<img src="static/img/team/3.jpg" alt=""
							class="img-circle img-responsive" />
						<h4>Nola Maurin</h4>
						<p>Illustrator</p>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"
					data-wow-delay="0.7s">
					<div class="box-team wow bounceInUp">
						<img src="static/img/team/4.jpg" alt=""
							class="img-circle img-responsive" />
						<h4>Mira Ladovic</h4>
						<p>Typographer</p>
					</div>
				</div>
			</div>
		</div>
	</section>-->

	<!-- Contact -->
	<section id="contact" class="home-section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div class="section-heading">
						<h2>Contact us</h2>
						<div class="heading-line"></div>
						<p>문의사항 등록</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<div id="sendmessage">Your message has been sent. Thank you!</div>
					<div id="errormessage"></div>

					<form action="" method="post" class="form-horizontal contactForm"
						role="form">
						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="Your Name" data-rule="minlen:4"
									data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="Your Email" data-rule="email"
									data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validation"></div>
							</div>
						</div>

						<div class="col-md-offset-2 col-md-8">
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									data-rule="required" data-msg="Please write something for us"
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
					</form>

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
						<h5>Main Office</h5>
						<p>
							109 Borough High Street,<br />London SE1 1NL
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="contact-widget wow bounceInUp">
						<i class="fa fa-phone fa-4x"></i>
						<h5>Call</h5>
						<p>
							+1 111 9998 7774<br> +1 245 4544 6855

						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="contact-widget wow bounceInRight">
						<i class="fa fa-envelope fa-4x"></i>
						<h5>Email us</h5>
						<p>
							hello@alstarstudio.com<br />sales@alstarstudio.com
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
