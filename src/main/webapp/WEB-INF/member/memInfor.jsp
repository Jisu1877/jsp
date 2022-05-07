<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>memInfor.jsp</title>
    <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<c:if test="${sLevel != 0}">
	<jsp:include page="/include/header_home.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
</c:if>
<p><br/><p>
<div class="container">
    <h2 class="text-center">회원 정보 상세보기</h2>
  	<br>
  	<table class="table">
  		<tr><td>아이디 : ${vo.mid}</td></tr>
  		<tr><td>닉네임 : ${vo.nickName}</td></tr>
  		<tr><td>성명 : ${vo.name}</td></tr>
  		<tr><td>성별 : ${vo.gender}</td></tr>
  		<tr><td>생일 : ${vo.birthday}</td></tr>
  		<tr><td>전화번호 : ${vo.tel}</td></tr>
  		<tr><td>주소 : ${vo.address}</td></tr>
  		<tr><td>이메일 : ${vo.email}</td></tr>
  		<tr><td>홈페이지 : ${vo.homePage}</td></tr>
  		<tr><td>직업 : ${vo.job}</td></tr>
  		<tr><td>취미 : ${vo.hobby}</td></tr>
  		<tr><td>자기소개 : ${vo.content}</td></tr>
  		<tr><td>등급 : ${vo.strLevel}</td></tr>
  		<tr><td>총 방문횟수 : ${vo.visitCnt}</td></tr>
  		<tr><td>가입일 : ${vo.startDate}</td></tr>
  		<tr><td>최종방문일 : ${vo.lastDate}</td></tr>
  		<tr><td>오늘 방문횟수 : ${vo.todayCnt}</td></tr>
  		<tr><td>사진 : <img src="data/member/${vo.photo}" width="100px"/></td></tr>
  	</table>
  	<hr>
  	<p>
  		<input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary"/>
  	</p>
</div>
	<p><br/><p>
<c:if test="${sLevel != 0}">
	<jsp:include page="/include/footer.jsp"/>
</c:if>
</body>
</html>