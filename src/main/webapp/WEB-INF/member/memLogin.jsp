<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>memLogin.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
<!--     <style>
    	.container {
    		width: 500px;
    		margin : 0px auto;
    	}
    </style> -->
    <script>
    	'use strict';
    	function fCheck() {
    		let mid = document.getElementById("mid").value;
    		let pwd = document.getElementById("pwd").value;
    		
    	/* 	let regMid = /^[a-z0-9_]{4,20}$/;
    		let regPwd = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,24}/; */
			
    		if(mid == "") {
    			alert("아이디를 입력하세요");
    			myForm.mid.focus();
    		}
    		else if(pwd == "") {
    			alert("비밀번호를 입력하세요");
    			myForm.pwd.focus();
    		}
    		else {
	    		myForm.submit();
    		}
		}
    </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container p-3 border">
				<form name="myForm" method="post" action="${ctp}/memLoginOk.mem" class="was-validated">
					<h2 class="text-center">회원 로그인</h2>
					<p class="text-center">회원 아이디와 비밀번호를 입력해주세요.</p>
					<div class="form-group">
				      <label for="mid">회원 아이디 :</label>
				      <input type="text" class="form-control" id="mid" value="${mid}" placeholder="아이디를 입력하세요." name="mid" required autofocus>
				      <div class="valid-feedback">입력성공.</div>
				      <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
				    </div>
					<div class="form-group" >
				      <label for="pwd">비밀번호 :</label>
				      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required>
				      <div class="valid-feedback">입력성공.</div>
				      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
				    </div>
				    <div class="form-group text-center">
					<button type="button" class="btn btn-primary btn-sm" onclick="fCheck()">로그인</button> &nbsp;&nbsp;		
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>	&nbsp;&nbsp;			
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${ctp}/';">돌아가기</button>&nbsp;&nbsp;			
					<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${ctp}/memJoin.mem';">회원가입</button>
					</div>
					<div class="row" style="font-size:12px">
						<span class="col"><input type="checkbox" name="idCheck" checked />&nbsp;아이디 저장</span>
						<span class="col"><a href="#">아이디 찾기</a> / <a href="#">비밀번호 찾기</a></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>