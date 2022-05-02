<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LogOut.jsp -->
<%
	//String mid = (String)session.getAttribute("sMid");
	pageContext.setAttribute("mid", session.getAttribute("sMid"));
	
	//세션끊기
	session.invalidate();
%>
<script>
	alert("${mid}님 로그아웃 되셨습니다."); /* 세션을 끊을거라 mid변수로 받아야한다. EL표기법은 안된다. EL표기법으로 하려면 5번라인처럼 pageContext에 저장시켜놓으면 가능하다.  */
	location.href="t2_Login.jsp";
</script>