<%@ include file="/include/memberCheck.jsp" %>
<%@ page import="study.database.LoginVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	ArrayList<LoginVO> vos = (ArrayList) request.getAttribute("vos");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginList.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container text-center">
	<h2>전체 회원 리스트</h2>
	<p></p>
	<table class="table table-hover">
		<tr>
			<th>번호</th><th>아이디</th><th>비밀번호</th><th>성명</th><th>포인트</th><th>최종접속일</th><th>방문횟수</th>
		</tr>
	<%	
		LoginVO vo = new LoginVO();
		for(int i=0; i<vos.size(); i++) { 
			vo = vos.get(i);
	%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getMid() %></td>
				<td><%=vo.getPwd() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getPoint() %></td>
				<td><%=vo.getLastDate() %></td>
				<td><%=vo.getvCount() %></td>
			</tr>
	<% }%>
	</table>
	<p></br></p>
<%-- 	<p><a href="${ctp}/study/database/loginMain.jsp" class="btn btn-secondary">돌아가기</a> --%>
	<p><a href="${ctp}/loginMain" class="btn btn-secondary">돌아가기</a>
</div>
<p><br/><p>
</body>
</html>