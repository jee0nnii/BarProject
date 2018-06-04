<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 등록 페이지</title>
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
	//navbar	
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
    //등록
    $("#addBeerBtn").click(function(){
		var addBeerForm = $("#addBeerForm");
		addBeerForm.attr({
			"method" : "post",
			"action" : "<c:url value = "/admin/beer/add"/>"
		});
		addBeerForm.submit();
	});
    
    $("#beerTypeId").click(function(){
    	var typeId = $(this).val();
    	var typeIdName;
    	if(typeId == 1){typeIdName = "IPA";}
    	else if(typeId == 2){typeIdName = "라거";}
    	else if(typeId == 3){typeIdName = "에일";}
    	else if(typeId == 4){typeIdName = "스타우트";}
    	else if(typeId == 5){typeIdName = "과일맥주";}
    	else if(typeId == 6){typeIdName = "두벨";}
    	else if(typeId == 7){typeIdName = "바이젠";}
    	else if(typeId == 8){typeIdName = "복";}
    	else if(typeId == 9){typeIdName = "쾰쉬";}
    	else if(typeId == 10){typeIdName = "쿼드러플";}
    	else if(typeId == 11){typeIdName = "트리펠";}
    	else if(typeId == 12){typeIdName = "포터";}
    	else if(typeId == 13){typeIdName = "필스너";}
    	else if(typeId == 14){typeIdName = "OTHER";}
    	$("#beerTypeName").val(typeIdName);
    });
    
    
	$("#addFestaBtn").click(function(){
		var addFestaForm = $("#addFestaForm");
		addFestaForm.attr({
			"method" : "post",
			"action" : "<c:url value = "/admin/festa/add"/>"
		});
		addFestaForm.submit();
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
input {
	margin-bottom: 5px;
}
input.invalid{
	background-color: #ff8040;
	color: #ce4300;
}

input.valid{
	background-color: #8080ff;
	color: #8000ff;
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
	
	<!-- 등록 form -->
	<div style="margin-top: 20px;">
		<div class="col-md-4 col-md-offset-1" id="addBeerSection">
			<h3>등록폼</h3>
			<form:form modelAttribute="addBeerForm">	
				<input class ="form-control" type="text" id="beerNameKor" name="beerNameKor" placeholder="맥주한글이름"/>
				<input class ="form-control" type="text" id="beerNameEng" name="beerNameEng" placeholder="맥주영문이름"/>
				<input class ="form-control" type="text" id="beerCountry" name="beerCountry" placeholder="맥주제조국가"/>
				<select class ="form-control" id="beerTypeId" name="beerTypeId">
				<!-- <input class ="form-control" type="text" id="beerType" name="beerTypeId" placeholder="맥주타입아이디"/> -->
				<option>1~14 까지 있는 거 중에 고르면 그에 맞게 아래 이름 값이 자동으로 등록</option>
				<option value = "1">IPA</option>
				<option value = "2">라거</option>
				<option value = "3">에일</option>
				<option value = "4">스타우트</option>
				<option value = "5">과일맥주</option>
				<option value = "6">두벨</option>
				<option value = "7">바이젠</option>
				<option value = "8">복</option>
				<option value = "9">쾰쉬</option>
				<option value = "10">쿼드러플</option>
				<option value = "11">트리펠</option>
				<option value = "12">포터</option>
				<option value = "13">필스너</option>
				<option value = "14">OTHER</option>
				</select>
				<input class ="form-control" type="text" id="beerTypeName" name="beerTypeName" placeholder="맥주타입이름"/>
				
				<p style="text-align:left"> ~~ ~~ 라거 형식</p>
				<input class ="form-control" type="text" id="beerTypeFullname" name="beerTypeFullname" placeholder="맥주타입전체이름"/>
				<p style="text-align:left">1.고소 2.과일 3.달콤 4.깔끔 5.새콤 6.씁쓸 :: 숫자로 입력</p>
				<input class ="form-control" type="text" id="beerTasteId" name="beerTasteId" placeholder="맥주맛아이디"/>
				<input class ="form-control" type="text" id="beerVolume" name="beerVolume" placeholder="맥주도수">
				<input class ="form-control" type="text" id="beerTemp" name="beerTemp" placeholder="맥주적정온도"/>
				<input class ="form-control" type="text" id="beerImg" name="beerImg" placeholder="맥주이미지링크"/>
				<div><input type="submit" id ="addBeerBtn" class="btn" value ="신규등록"/></div>
			</form:form>
			
		</div>
		<div class="col-md-4 col-md-offset-2" id="addFestaSection">	
			<h3>행사등록폼</h3>
			<form:form modelAttribute="addFestaForm">
				<input class ="form-control" type="text" id="festaName" name="festaName" placeholder="행사이름"/>
				<input class ="form-control" type="text" id="festaDate" name="festaDate" placeholder="행사날짜">
				<input class ="form-control" type="text" id="festaPlace" name="festaPlace" placeholder="행사장소"/>
				<input class ="form-control" type="text" id="festaImg" name="festaImg" placeholder="행사이미지"/>
				<input class ="form-control" type="text" id="festaLink" name="festaLink" placeholder="행사링크"/>
				<textarea class ="form-control" id="festaDesc" name="festaDesc" placeholder="행사설명"></textarea>
				<div><input type="submit" id ="addFestaBtn" class="btn" value ="행사등록"/></div>
			</form:form>
						
			
		</div>
	</div>

			
				<!-- <div class ="form-control"  style="margin-bottom:5px;">
					<input type="checkbox" id="goso" name ="userFavTasteVO.beerTasteIdList" value="1"/>
					<label for ="taste1"><span>고소</span></label>
					<input type="checkbox" id="fruit" name ="userFavTasteVO.beerTasteIdList" value="2"/>
					<label for ="taste2"><span>과일</span></label>
					<input type="checkbox" id="sweet" name ="userFavTasteVO.beerTasteIdList" value="3"/>
					<label for ="taste3"><span>달콤</span></label>
					<input type="checkbox" id="clean" name ="userFavTasteVO.beerTasteIdList" value="4"/>
					<label for ="taste4"><span>깔끔</span></label>
					<input type="checkbox" id="sour" name ="userFavTasteVO.beerTasteIdList" value="5"/>
					<label for ="taste5"><span>새콤</span></label>
					<input type="checkbox" id="bitter" name ="userFavTasteVO.beerTasteIdList" value="6"/>
					<label for ="taste6"><span>씁쓸</span></label>	
					<span style="float: right">선호하는 맥주 맛</span>
				</div>
				<div class ="form-control"  style="margin-bottom:5px;">
					<input type="checkbox" id="ipa" name ="userFavTypeVO.beerTypeIdList" value="1"/>
					<label for ="type1"><span>IPA</span></label>
					<input type="checkbox" id="lager" name ="userFavTypeVO.beerTypeIdList" value="2"/>
					<label for ="type2"><span>라거</span></label>
					<input type="checkbox" id="ale" name ="userFavTypeVO.beerTypeIdList" value="3"/>
					<label for ="type3"><span>에일</span></label>
					<input type="checkbox" id="sta" name ="userFavTypeVO.beerTypeIdList" value="4"/>
					<label for ="type4"><span>스타우트</span></label>
					
					<input type="checkbox" id="fruitBeer" name ="userFavTypeVO.beerTypeIdList" value="5"/>
					<label for ="type1"><span>과일맥주</span></label>
					<input type="checkbox" id="do" name ="userFavTypeVO.beerTypeIdList" value="6"/>
					<label for ="type2"><span>두벨</span></label>
					<input type="checkbox" id="ba" name ="userFavTypeVO.beerTypeIdList" value="7"/>
					<label for ="type3"><span>바이젠</span></label>
					<input type="checkbox" id="bok" name ="userFavTypeVO.beerTypeIdList" value="8"/>
					<label for ="type4"><span>복</span></label>
					
					<input type="checkbox" id="qul" name ="userFavTypeVO.beerTypeIdList" value="9"/>
					<label for ="type1"><span>쾰쉬</span></label>
					<input type="checkbox" id="quad" name ="userFavTypeVO.beerTypeIdList" value="10"/>
					<label for ="type2"><span>쿼드러플</span></label>
					<input type="checkbox" id="tri" name ="userFavTypeVO.beerTypeIdList" value="11"/>
					<label for ="type3"><span>트리펠</span></label>
					<input type="checkbox" id="por" name ="userFavTypeVO.beerTypeIdList" value="12"/>
					<label for ="type4"><span>포터</span></label>
					
					<input type="checkbox" id="pil" name ="userFavTypeVO.beerTypeIdList" value="13"/>
					<label for ="type1"><span>필스너</span></label>
					<input type="checkbox" id="other" name ="userFavTypeVO.beerTypeIdList" value="14"/>
					<label for ="type2"><span>OTHER</span></label>
					
					<span style="float: right">선호하는 맥주타입</span>	
				</div>
				 -->
	

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
