<%@ page import="study.t0420.SungjukVO3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 외부라이브러리 세팅 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8");%>


<!-- core라이브러리 를 통한 변수 세팅 var 는 name -->
<%-- ${}는 jsp의 표현식 <%= %>을 좀더 간결하게 쓰기 위한 EL이다. <%= %>로 써도 된다. --%>
<c:set var="name" value="${param.name}"/>
<c:set var="gender" value="${param.gender}"/>
<c:set var="no" value="${param.no}"/>
<c:set var="hakyun" value="${param.hakyun}"/>
<c:set var="kor" value="${param.kor}"/>
<c:set var="eng" value="${param.eng}"/>
<c:set var="mat" value="${param.mat}"/>
<c:set var="tot" value="${kor + eng + mat}"/>
<c:set var="avg" value="${tot / 3.0}"/>
<c:set var="grade" value="A"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungjukOk3.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h3>개별 학생 성적표</h3>
	<table class="table table-hover text-center">
		<tr>
			<th>학번</th><td>${no}</td>
		</tr>	
		<tr>
			<th>성명</th><td>${name}</td>
		</tr>	
		<tr>
			<th>성별</th><td>${gender}</td>
		</tr>	
		<tr>
			<th>학년</th><td>${hakyun}</td>
		</tr>	
		<tr>
			<th>국어점수</th><td>${kor}</td>
		</tr>	
		<tr>
			<th>영어점수</th><td>${eng}</td>
		</tr>	
		<tr>
			<th>수학점수</th><td>${mat}</td>
		</tr>	
		<tr>
			<th>총점</th><td>${kor}</td>
		</tr>	
		<tr>
			<th>평균</th><td>${avg}</td>
		</tr>	
		<tr>
			<th>학점</th><td>${grade}</td>
		</tr>		
		<tr>
			<td colspan="2">
				<input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/0421/sungjuk.jsp'" class="btn btn-info form-control"/>
			</td>
		</tr>	
	</table>
</div>
<p><br/><p>
</body>
</html>