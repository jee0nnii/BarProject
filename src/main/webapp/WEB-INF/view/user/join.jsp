<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<title>JOIN US</title>
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
	// 이메일 정규표현식
	function email_check( email ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email)); 
	}
	$("#email").blur(function(){
		var inputEmail = $(this).val();
		if(inputEmail == '' || inputEmail == 'undefined')
			return;
		if(!email_check(inputEmail)){
			$("#email-check").text('이메일 형식이 아닙니다.');
			$(this).focus();
			return false;			
		}
		else{
			$("#email-check").text('')
		}
		
		//중복체크
		if(inputEmail != ""){
		$.post("<c:url value="/api/duplicate/email"/>",{
			email: inputEmail
		},function(response){
			console.log(response.respEmail);
			if(response.respEmail){
					$("#email").removeClass("valid");
					$("#email").addClass("invalid");
			}
			else{
				$("#email").removeClass("invalid");
				$("#email").addClass("valid");
			}
		});
		}else{
			$(this).removeClass("valid");
			$(this).addClass("invalid");
		}
		
		//중복,,,,,ㅠ
		if($("#email").hasClass("invalid")){
			$("#email-check").text('');
			$("#
ck").html('작성한 이메일은 사용할 수 없습니다.');
			
			$("#email").focus();
			return false;
		}
		else{
			$.post("<c:url value="/api/duplicate/email"/>",{
					email: $("#email").val()
				},function(response){
					
					//비동기내에서 동기로 동작할 코드 : 아이디를 사용할 수 있을 때
					if(response.respEmail){
						//alert("작성한 이메일은 사용할 수 없습니다.")
						$("#email").focus();
						return false;
					}
					
			});
		}
		///중옵고곱
					
		
	});
	
			/* 비밀번호랑 비밀번호 재입력 부분 동일한지 체크 */
			$("#password").keyup(function(){
				var userPwd = $(this).val();
				var pwdConfirm = $("#password-confirm").val();
				
				if(userPwd != pwdConfirm){
					$(this).removeClass("valid");
					$(this).addClass("invalid");
					$("#password-confirm").removeClass("valid");
					$("#password-confirm").addClass("invalid");
					
				}else{
					$(this).remove("invalid");
					$(this).addClass("valid");
					$("#password-confirm").remove("invalid");
					$("#password-confirm").addClass("valid");
				}
				
			});
			
			$("#password-confirm").keyup(function(){
				var userPwd = $("#password").val();
				var pwdConfirm = $(this).val();
				
				if(userPwd != pwdConfirm){
					$(this).removeClass("valid");
					$(this).addClass("invalid");
					$("#password").removeClass("valid");
					$("#password").addClass("invalid");
					$("#pwdChk").text('');
					$("#pwdChk").html('비밀번호가 다릅니다.');
					
				}else{
					$(this).removeClass("invalid");
					$(this).addClass("valid");
					$("#password").removeClass("invalid");
					$("#password").addClass("valid");
					$("#pwdChk").text('');
					//$("#pwdChk").html('비밀번호가 같습니다.');
				}
			});

			//0404 :: 생년월일 부분
			setMonth("#birthMonth");
			setDate("#birthDay");
			
			function setMonth(elementId) {
				for (var i = 1; i < 13; i++) {
					var value = (i < 10) ? "0" + i : i;
					$(elementId).append($("<option>", {
						value : value,
						text : value
					}));
				}
			}
			function setDate(elementId) {
				for (var i = 1; i <= 31; i++) {
					var value = (i < 10) ? "0" + i : i;
					$(elementId).append($("<option>", {
						value : value,
						text : value
					}));
				}
			}
			
			//폼에 들어온 값 처리 이벤트 시작
			$("#joinBtn").click(function() {
				if ($("#name").val() == "") {
					alert("이름을 입력하세요!");
					$("#name").focus();
					return false;
				}
				
				if ($("#email").val() == "") {
					alert("이메일을 입력하세요!");
					$("#email").focus();
					return false;
				}
				
				
				if ($("#password").val() == "") {
					alert("비밀번호를 입력하세요!");
					$("#password").focus();
					return false;
				}
				if ($(".sex").is(":checked")) {
					
				}else{
					alert("성별을 입력하세요!");
					return false;
				}
				
				if ($(".btaste").is(":checked")) {					
				}else{
					alert("맛을 선택하세요!");
					return false;
				}
				if ($(".btype").is(":checked")) {
				}else{
					alert("타입을 선택하세요!");
					return false;
				}
				
				$("#joinForm").attr({
					"action" : "<c:url value = "/join"/>",
					"method" : "post"
				}).submit();
			});
			//폼 처리 이벤트 끝
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
	border:1px solid red;
}

input.valid{
	border:1px solid #ccc;
}
/* midline */
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
	<!-- join form -->
	<div style="margin-top: 20px;">
		<div class="col-md-4 col-md-offset-4" id="joinSection">
			<h3>&nbspjoin form</h3>
			<div class = "midline"></div>
			<form:form modelAttribute="joinForm">
				<div>
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름입력">
				</div><form:errors path="name"/>
				<div>
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일입력" value = "${joinForm.email}">
				</div><form:errors path="email"/>
				<div id="email-check" style="float:left;color:red">
				</div>
				<div>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="비밀번호입력">
				</div><form:errors path="password"/>
				<div>
					<input type="password" class="form-control" id="password-confirm"
						placeholder="비밀번호재입력">
				</div>
				<div id ="pwdChk" style="float:left;color:red"></div>
				<div>
					<input type="text" class="form-control" id="nickname"
						name="nickname" placeholder="닉네임입력">
				</div>
				
				<div class ="form-control" style="margin-bottom:5px;text-align:left;">
					<input class = "sex" type="checkbox" id="female" name ="sex" value="F"/>
					<label for ="female"><span>여자</span></label>
					<input class = "sex" type="checkbox" id="male" name ="sex" value = "M"/>
					<label for ="male"><span>남자</span></label>
					<span style="float: right">성별</span>
				</div>
				
				<div class ="form-control" style="margin-bottom:5px;text-align:left;">
					<select id ="birthYear" name = "birthYear">
					<c:forEach var = "i" begin = "${currentYear-50 }" varStatus="loop" end="${currentYear-19 }" step="1">
					<option value=${loop.end-loop.count+1}>${loop.end-loop.count+1 }</option>
					</c:forEach>
					</select>
					-<select id ="birthMonth" name = "birthMonth"></select>
					-<select id ="birthDay" name = "birthDay"></select>
					<span style="float: right">생년월일 입력</span>
				</div>
				<div class ="form-control"  style="margin-bottom:5px;text-align:left;">
					<input class="btaste" type="checkbox" id="goso" name ="userFavTasteVO.beerTasteIdList" value="1"/>
					<label for ="taste1"><span>고소</span></label>
					<input class="btaste" type="checkbox" id="fruit" name ="userFavTasteVO.beerTasteIdList" value="2"/>
					<label for ="taste2"><span>과일</span></label>
					<input class="btaste" type="checkbox" id="sweet" name ="userFavTasteVO.beerTasteIdList" value="3"/>
					<label for ="taste3"><span>달콤</span></label>
					<input class="btaste" type="checkbox" id="clean" name ="userFavTasteVO.beerTasteIdList" value="4"/>
					<label for ="taste4"><span>깔끔</span></label>
					<input class="btaste" type="checkbox" id="sour" name ="userFavTasteVO.beerTasteIdList" value="5"/>
					<label for ="taste5"><span>새콤</span></label>
					<input class="btaste" type="checkbox" id="bitter" name ="userFavTasteVO.beerTasteIdList" value="6"/>
					<label for ="taste6"><span>씁쓸</span></label>	
					<span style="float: right">선호하는 맥주 맛</span>
				</div>
				<div class ="form-control" style="margin-bottom:5px;height:auto;text-align:left;">
					<input class="btype" type="checkbox" id="ipa" name ="userFavTypeVO.beerTypeIdList" value="1"/>
					<label for ="type1"><span>IPA</span></label>
					<input class="btype" type="checkbox" id="lager" name ="userFavTypeVO.beerTypeIdList" value="2"/>
					<label for ="type2"><span>라거</span></label>
					<input class="btype" type="checkbox" id="ale" name ="userFavTypeVO.beerTypeIdList" value="3"/>
					<label for ="type3"><span>에일</span></label>
					<input class="btype" type="checkbox" id="sta" name ="userFavTypeVO.beerTypeIdList" value="4"/>
					<label for ="type4"><span>스타우트</span></label>
					
					<input class="btype" type="checkbox" id="fruitBeer" name ="userFavTypeVO.beerTypeIdList" value="5"/>
					<label for ="type1"><span>과일맥주</span></label><br>
					<input class="btype" type="checkbox" id="do" name ="userFavTypeVO.beerTypeIdList" value="6"/>
					<label for ="type2"><span>두벨</span></label>
					<input class="btype" type="checkbox" id="ba" name ="userFavTypeVO.beerTypeIdList" value="7"/>
					<label for ="type3"><span>바이젠</span></label>
					<input class="btype" type="checkbox" id="bok" name ="userFavTypeVO.beerTypeIdList" value="8"/>
					<label for ="type4"><span>복</span></label>
					
					<input class="btype" type="checkbox" id="qul" name ="userFavTypeVO.beerTypeIdList" value="9"/>
					<label for ="type1"><span>쾰쉬</span></label>
					<input class="btype" type="checkbox" id="quad" name ="userFavTypeVO.beerTypeIdList" value="10"/>
					<label for ="type2"><span>쿼드러플</span></label><br>
					<input class="btype" type="checkbox" id="tri" name ="userFavTypeVO.beerTypeIdList" value="11"/>
					<label for ="type3"><span>트리펠</span></label>
					<input class="btype" type="checkbox" id="por" name ="userFavTypeVO.beerTypeIdList" value="12"/>
					<label for ="type4"><span>포터</span></label>
					
					<input class="btype" type="checkbox" id="pil" name ="userFavTypeVO.beerTypeIdList" value="13"/>
					<label for ="type1"><span>필스너</span></label>
					<input class="btype" type="checkbox" id="other" name ="userFavTypeVO.beerTypeIdList" value="14"/>
					<label for ="type2"><span>OTHER</span></label>
					
					<span style="float: right">선호하는 맥주타입</span>	
				</div>
				
				<div style="float:right">
					<input type="button" id="joinBtn" class="btn" value="JOIN US" />
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
