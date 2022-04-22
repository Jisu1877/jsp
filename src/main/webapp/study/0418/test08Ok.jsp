<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- response 환경설정  -->

<!-- test08.jsp -->

<%
	request.setCharacterEncoding("utf-8"); /* 한글을 사용할땐 request 환경설정 필요.  */

	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
%>

<p>아이디 : <%=mid %> </p>
<p>비밀번호 : <%=pwd %> </p>
<p>성명 : <%=name %> </p>
<p><a href="test08.jsp">돌아가기</a></p>
