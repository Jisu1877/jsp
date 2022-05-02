<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JavaGreen Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
   		body {
    		background-color : rgb(250, 210, 157);
    	}
    	.message {
    		color: white;
    		font-size: 40px;
    		font-weight: bolder;
    	}
    </style>
    
    <!-- Add the slick-theme.css if you want default styling -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<!-- Add the slick-theme.css if you want default styling -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<script>
		$(function() { // 페이지 로드가 끝난 후 실행시켜라
			$(".slick-slider").slick();
		})	
		
	</script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">JavaGreen</a>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Link</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled">Disabled</a>
						</li>
					</ul>
				</div>
					<form class="d-flex">
		          		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		         		<button class="btn btn-outline-light" type="submit">Search</button>
	        		</form>
	        		<span>&nbsp;&nbsp;&nbsp;</span>
	        		<form class="d-flex" action="${ctp}/logout">
		         		<button class="btn btn-light" type="submit" >LogOut</button>
	        		</form>
			</div>
		</nav>
	</header>
	<section>
		<div class="slick-slider" data-slick='{"slidesToShow": 1, "slidesToScroll": 1}'>
			<li>
				<div class="title" style="position:absolute;"><div class="message">&nbsp;&nbsp;&nbsp;'${param.name}'님 반갑습니다:)</div></div>
				<div><img src="../../images/temp2.jpg"></div>
			</li>
			<li>
				<div class="title" style="position:absolute;"><div class="message">&nbsp;&nbsp;&nbsp;'${param.name}'님의 방문횟수 : ${param.vCount}</div></div>
				<div><img src="../../images/temp1.jpg"></div>
			</li>
			<li>
				<div class="title" style="position:absolute;"><div class="message">&nbsp;&nbsp;&nbsp;'${param.name}'님의 포인트 : ${param.point}</div></div>
				<div><img src="../../images/temp3.jpg"></div>
			</li>
		</div>
	</section>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>