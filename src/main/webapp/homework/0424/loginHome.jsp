<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Cookie[] cookies = request.getCookies();
	String cMid = "";
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			String strName = cookies[i].getName();
			if(strName.equals("cMid")) {
				cMid = cookies[i].getValue();
				break;
			}
		}
	}
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="shortcut icon" href="#">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	'use strict';
    	function fCheck() {
    		let regMid = /^[a-z][a-z0-9_]+$/g;
			let mid = document.getElementById('mid').value;
			let pwd = document.getElementById('pwd').value;
			let rememberId = "none"
			if(document.getElementById('rememberId').checked) {
				rememberId = document.getElementById('rememberId').value;
			}
			
			if(mid == "") {
				alert('아이디를 입력하세요.');
				myForm.mid.focus();
			}
			else if(pwd == "") {
				alert('비밀번호를 입력하세요.');
				myForm.pwd.focus();
			}
			else if(!regMid.test(mid)) {
				alert("아이디는 영문 소문자와 숫자와 '_'만 가능합니다.(첫글자는 소문자로)");
                document.getElementById("mid").focus();
			}
			else {
				myForm.remember.value = rememberId;
				myForm.submit();
			}
		}
    
    </script>
    <style>
	body {
    	background-color : rgb(250, 250, 250);
    	}
    section {
    	width: 500px;
    	margin: 0 auto;
    	margin-top : 50px;
    }
    </style>
</head>
<body>
<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">JavaGreen</a>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${ctp}/homework/0424/loginHome.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Link</a>
					</li>
					<li class="nav-item">
						<a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<section>
    <h3 class="h3 mb-3 fw-normal">LOGIN</h3>
  <form name="myForm" method="post" action="${ctp}/loginJava">
	    <div class="form-floating">
	      <label for="floatingInput">ID</label>
	      <input type="text" class="form-control" name="mid" value="<%=cMid %>" id="mid" placeholder="ID">
	    </div>
	    <div class="form-floating">
	      <label for="floatingPassword">Password</label>
	      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
	    </div>
	    <div class="checkbox mb-3">
	      <label>
	      	<p></p>
	        <input type="checkbox" id="rememberId" value="remember"> Remember ID
	      </label>
	    </div>
	    <input type="hidden" name="remember"/>
	    <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="fCheck()">LOGIN</button>
   </form>
</section>
</body>
</html>