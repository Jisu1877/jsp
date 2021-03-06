<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>memList.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2 class="text-center">전체 회원 리스트</h2>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${curScrStartNo}</td>
				<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}">${vo.mid}</a></td>
				<td>${vo.nickName}</td>
				<td>${vo.name}</td>
				<td>${vo.gender}</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"></c:set>
		</c:forEach>	
		<tr><td colspan="5"></td></tr>
	</table>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>