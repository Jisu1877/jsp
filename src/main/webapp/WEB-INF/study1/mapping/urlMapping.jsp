<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>urlMapping.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>URL Mapping 연습</h2>
	<hr/>
	<div>
		<h3>1. Directory pattern</h3>
		<h3>2. Extension pattern</h3>
	</div>
	<div>
		<a href="${ctp}/study1/urlMappingList" class="btn btn-info form-control m-1">Directory pattern으로 정보리스트 이동</a>
		<a href="${ctp}/urlMappingList.um" class="btn btn-info form-control m-1">Extension pattern으로 정보리스트 이동</a>
		<a href="${ctp}/urlMappingJoin.um" class="btn btn-info form-control m-1">Extension pattern으로 정보등록창으로 이동</a>
		<a href="${ctp}/" class="btn btn-info form-control m-1">홈으로</a>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>