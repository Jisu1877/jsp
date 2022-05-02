<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginJoin.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	.container {
    		width: 500px;
    		margin : 0px auto;
    		text-align : center;
    	}
    </style>
    <script>
    	'use strict';
    	function fCheck() {
    		//Front체크 후 전송한다..
			myForm.submit();
		}
    </script>
</head>
<body>
<p><br/><p>
<p><br/><p>
<div class="container">
	<h2>회 원 가 입</h2>
	<form name="myForm" method="post" action="${ctp}/loginJoin">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" autofocus class="form-control" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" class="form-control"/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
				<input type="button" value="회원가입" class="btn btn-primary" onclick="fCheck();"/> &nbsp;
				<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='login.jsp';"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/><p>
</body>
</html>