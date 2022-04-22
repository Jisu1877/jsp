<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main2.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	body {
    		width : 1000px;
    		margin : 0px auto;
    		padding : 0px;
    	}
    	#header {
    		background-color: beige;
    		text-align : center;
    		height : 120px;
    	}
    	#content {
    		background-color: beige;
    		text-align : center;
    		height : 600px;
    	}
    	#footer {
    		background-color: lightgray;
    		text-align : center;
    		height : 70px;
    	}
    </style>
</head>
<body>
<div class="container">
	<div id="header">
		<!-- 이곳은 헤더 영역입니다.  -->
		<br/>
		<%@ include file="menuEx2.jsp" %>
	</div>
	<div id="content">
		<!-- 이곳은 본문영역입니다. -->
		<% if(flag.equals("guest2")) {%>
		<%@ include file="guest.jsp" %>
		<% }else if(flag.equals("board2")) {%>
		<%@ include file="board.jsp" %>
		<% }else if(flag.equals("photo2")) {%>
		<%@ include file="photo.jsp" %>
		<% }else if(flag.equals("kor5")) {%>
		<%@ include file="kor5.jsp" %>
		<% }else if(flag.equals("kor4")) {%>
		<%@ include file="kor4.jsp" %>
		<% }else if(flag.equals("kor3")) {%>
		<%@ include file="kor3.jsp" %>
		<% }else if(flag.equals("for5")) {%>
		<%@ include file="for5.jsp" %>
		<% }else if(flag.equals("for4")) {%>
		<%@ include file="for4.jsp" %>
		<% }else if(flag.equals("for3")) {%>
		<%@ include file="for3.jsp" %>
		<% } else { %>
		<!-- 아래는 메인 구역입니다. -->
		<p><br/></p>
		<br/>
		<h2>Welcome!</h2>
		<p style="text-align:center">
        책을 사랑하는 모든 분들을 환영합니다.<br/>
    	</p>
    	<p><img src="../images/222.jpg" width="300px"/></p>
		<p style="text-align:center">
        위 메뉴에서 원하는 정보를 선택하세요.<br/>
    	</p>
    	<% } %>
	</div>
	<div id="footer">
		<!-- 이곳은 푸터 영역입니다.  -->
		<%@ include file="footerEx2.jsp" %>
	</div>
</div>
</body>
</html>