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
    <title>urlMappingList.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
    <script>
    	'use strict';
    	function delCheck(mid) {
    		let ans = confirm("정말 삭제(탈퇴) 처리 하시겠습니까?");
    		if(ans) {
    			location.href = "${ctp}/urlMappingDelete.um?mid="+mid;
    		}
			
		}
    </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container text-center">
	<h2 class="text-center">전체 회원 리스트</h2>
	<p></p>
	<table class="table table-hover">
		<tr>
			<th>번호</th><th>아이디</th><th>성명</th><th>포인트</th><th>최종접속일</th><th>방문횟수</th><th>비고</th>
		</tr>
	<%	
		LoginVO vo = new LoginVO();
		for(int i=0; i<vos.size(); i++) { 
			vo = vos.get(i);
	%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getMid() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getPoint() %></td>
				<td><%=vo.getLastDate() %></td>
				<td><%=vo.getvCount() %></td>
				<td>
					<a href="${ctp}/urlMappingUpdate.um?mid=<%=vo.getMid()%>" class="btn btn-warning btn-sm">수정</a> &nbsp;
					<a href="javascript:delCheck('<%=vo.getMid()%>');" class="btn btn-danger btn-sm">삭제</a> &nbsp;
				</td>
			</tr>
	<% }%>
	<tr><td colspan="7" class="p-0"></td></tr>
	</table>
	<p></br></p>
	<%-- <p><a href="${ctp}/study1/urlMapping" class="btn btn-secondary text-center">돌아가기</a> --%>
	<p><a href="${ctp}/urlMapping.um" class="btn btn-secondary text-center">돌아가기</a>   <!--  -->
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>