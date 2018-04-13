<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* dropdown */
body {
	margin: 0px;
}

/* #dropmenu {
	padding: 0;
	margin: 0;
	border: 0;
} */

#dropmenu ul, #dropmenu li {
	list-style: none;
	margin: 0;
	padding: 0;
}

#dropmenu ul {
	position: relative;
	z-index: 597;
}

#dropmenu ul li {
	float: left;
	min-height: 1px;
	vertical-align: middle;
}

#dropmenu ul li.hover, #dropmenu ul li:hover {
	position: relative;
	z-index: 599;
	cursor: default;
}

#dropmenu ul ul {
	visibility: hidden;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 598;
	width: 100%;
}

#dropmenu ul ul li {
	float: none;
}

#dropmenu ul ul ul {
	top: 0;
	left: auto;
	right: -99.5%;
}

#dropmenu ul li:hover>ul {
	visibility: visible;
}

#dropmenu ul ul {
	bottom: 0;
	left: 0;
}

#dropmenu ul ul {
	margin-top: 0;
}

#dropmenu ul ul li {
	font-weight: normal;
}

#dropmenu a {
	display: block;
	line-height: 1em;
	text-decoration: none;
}

#dropmenu {
	background: #FE7A66;
	/*  border-bottom: 4px solid #1b9bff; */
	font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;
	font-size: 12px;
}

#dropmenu>ul {
	*display: inline-block;
}

#dropmenu:after, #dropmenu ul:after {
	content: '';
	display: block;
	clear: both;
}

#dropmenu a {
	background: #FE7A66;
	color: #fff;
	padding: 0 20px;
}

#dropmenu ul {
	text-transform: uppercase;
}

#dropmenu ul ul {
	text-transform: none;
	min-width: 190px;
}

#dropmenu ul ul a {
	background: #666;
	color: #FFF;
	/*   border: 1px solid #0082e7; */
	border-top: 0 none;
	line-height: 150%;
	padding: 16px 20px;
}

#dropmenu ul ul ul {
	border-top: 0 none;
}

#dropmenu ul ul li {
	position: relative
}

#dropmenu>ul>li>a {
	line-height: 70px;
}

/* #dropmenu ul ul li:first-child>a {
  border-top: 1px solid #333;
} */
#dropmenu ul ul li:hover>a {
	background: #FE7A66;
}

#dropmenu ul ul li.has-sub>a:after {
	content: '+';
	position: absolute;
	top: 50%;
	right: 15px;
	margin-top: -8px;
}
/* #dropmenu ul li:hover>a,
#dropmenu ul li.active>a {
  background: #333; 
  color: #333;
} */
#dropmenu ul li:hover>a {
	color: #333;
}

/* 
#dropmenu ul li.has-sub>a:after {
  content: '+';
  margin-left: 5px;
}

#dropmenu ul li.last ul {
  left: auto;
  right: 0;
}

#dropmenu ul li.last ul ul {
  left: auto;
  right: 99.5%;
} 
*/
</style>
</head>
<body>

	<!-- dropdown chk -->
	<div id='dropmenu'>

		<ul>
			<li class='active'><a href='index.html'>Home</a></li>
			<li class='has-sub '><a href='#'>Products</a>
				<ul>
					<li class='has-sub '><a href='#'>Product 1</a>
						<ul>
							<li><a href='#'>Sub Item</a></li>
							<li><a href='#'>Sub Item</a></li>
						</ul></li>
					<li class='has-sub '><a href='#'>Product 2</a>
						<ul>
							<li><a href='#'>Sub Item</a></li>
							<li><a href='#'>Sub Item</a></li>
						</ul></li>
				</ul></li>
			<li><a href='#'>About</a></li>
			<li><a href='#'>Contact</a></li>
		</ul>
	</div>
</body>
</html>