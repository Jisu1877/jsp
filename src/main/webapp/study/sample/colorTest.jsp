<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <%@ include file="/include/bs4.jsp" %>
    
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<div class="btnw3-indigo" style="width:300px; heiht:150px;">
		이곳은 색상 연습입니다.(Indigo)
	</div>
	<div>
		<input type="button" value="버튼컬러" class="btn w3-amber w3-hover-red"/>
		<input type="button" value="버튼컬러" class="btn w3-purple w3-hover-green"/>
		<input type="button" value="버튼컬러" class="btn w3-indigo w3-hover-lime"/>
		<input type="button" value="버튼컬러" class="btn w3-light blue w3-hover-khaki"/>
		<input type="button" value="버튼컬러" class="btn w3-aqua w3-hover-deep-orange"/>
		<input type="button" value="버튼컬러" class="btn w3-brown w3-hover-blue"/>
		<input type="button" value="버튼컬러" class="btn w3-teal w3-hover-cyan"/>
		<input type="button" value="버튼컬러" class="btn w3-theme-d1 w3-hover-deep-purple"/>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>