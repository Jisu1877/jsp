<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 외부라이브러리 세팅 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8");%>

<c:set var="kor" value="${param.kor}"/>
<c:set var="eng" value="${param.eng}"/>
<c:set var="mat" value="${param.mat}"/>
<c:set var="tot" value="${kor + eng + mat}"/>
<c:set var="avg" value="${tot / 3.0}"/>
<c:set var="grade" value="A"/>

<!-- 자바 클래스를 사용할 경우는 jsp 액션태그(useBean)을 사용한다.  
id에는 클래스 변수명 / class에는 클래스이름을 적는다.(패키지명과 함께 적는다)-->
<jsp:useBean id="vo" class="t0420.SungjukVO3"></jsp:useBean>

<!-- 앞(sungjuk3.jsp)에서 넘어온 변수의 값을 vo객체에 저장하려면?  jsp 액션태그(setProperty)-->
<!-- name:값을 저장할 클래스변수명(id), property:Form태그에서 넘어온 변수명  -->
<jsp:setProperty name="vo" property="name"/>
<jsp:setProperty name="vo" property="gender"/>
<jsp:setProperty name="vo" property="no"/>
<jsp:setProperty name="vo" property="hakyun"/>
<jsp:setProperty name="vo" property="kor"/>
<jsp:setProperty name="vo" property="eng"/>
<!-- 이 아래 3가지는 위에서 변수선언하고 계산한 것들..! -->
<jsp:setProperty name="vo" property="tot" value="${tot}"/>
<jsp:setProperty name="vo" property="avg" value="${avg}"/>
<jsp:setProperty name="vo" property="grade" value="${grade}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungjukOk3_2.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h3>개별 학생 성적표</h3>
	<table class="table table-hover text-center">
		<tr>
			<th>학번</th><td><jsp:getProperty name="vo" property="no"/></td>
		</tr>	
		<tr>
			<th>성명</th><td><jsp:getProperty name="vo" property="name"/></td>
		</tr>	
		<tr>
			<th>성별</th><td><jsp:getProperty name="vo" property="gender"/></td>
		</tr>	
		<tr>
			<th>학년</th><td><jsp:getProperty name="vo" property="hakyun"/></td>
		</tr>	
		<tr>
			<th>국어점수</th><td><jsp:getProperty name="vo" property="kor"/></td>
		</tr>	
		<tr>
			<th>영어점수</th><td><jsp:getProperty name="vo" property="eng"/></td>
		</tr>	
		<tr>
			<th>수학점수</th><td><jsp:getProperty name="vo" property="mat"/></td>
		</tr>	
		<tr>
			<th>총점</th><td><jsp:getProperty name="vo" property="tot"/></td>
		</tr>	
		<tr>
			<th>평균</th><td><jsp:getProperty name="vo" property="avg"/></td>
		</tr>	
		<tr>
			<th>학점</th><td><jsp:getProperty name="vo" property="grade"/></td>
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