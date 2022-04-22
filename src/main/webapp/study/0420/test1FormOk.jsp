<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test1FormOk.jsp -->
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int price = request.getParameter("price") == null ? 0 : Integer.parseInt(request.getParameter("price"));
%>
<h2>test1FormOk.jsp</h2>
<p>성명 : <%=name %></p>
<p>가격 : <%=price %></p>
<p><a href="test1Form.jsp">돌아가기</a></p>
<%
	//get방식으로 그냥 보내버리기. jsp명령어라서 위 코드보다 먼저 실행된다.
	//test1Form.jsp에서 넘겨준 값(연습이/5000)은 response.sendRedirect하면 날라간다.(이유 : sendRedirect는 스스로 다시 시작한다는 개념.)
	//새로값을 넘겨줘야한다.
	/* response.sendRedirect("test1FormResult.jsp?name=김말숙&price=1500");  */
%>
<!-- jsp:forward는 test1Form.jsp에서 넘겨준 값(연습이/5000)이 그대로 잘 넘어간다. -->
<% if(name.equals("admin")) {%>
	<jsp:forward page="test1FormAdmin.jsp">
		<jsp:param name="adminSw" value="OK" />  <!-- forward로 보낼때 값을 추가로 보내는 방법 -->
	</jsp:forward>
<% } else { %>
	<jsp:forward page="test1FormResult.jsp"></jsp:forward>
<% } %>

<!-- 
디렉티브(지시자)
스크립틀릿(jsp안에서 java코드를 사용)
익스프레션(표현식)
디크렐레이션(선언문)
jsp액션태그
-->