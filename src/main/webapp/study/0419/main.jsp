<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	body {
    		width : 1000px;
    		margin : 0px auto;
    		padding : 0px;
    	}
    	#header {
    		background-color: skyblue;
    		text-align : center;
    		height : 90px;
    	}
    	#content {
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
		<%@ include file="menuEx.jsp" %>  <!-- contextpath 경로로 지정하면 안된다.  -->
	</div>
	<div id="content">
		<!-- 이곳은 본문 영역입니다.  -->
		<% if(flag.equals("guest")) { %>
		<%@ include file="guest.jsp" %>
		<% } else if(flag.equals("board")) { %>
		<%@ include file="board.jsp" %>
		<% } else if(flag.equals("pds")) { %> <!-- pds : 포스팅 데이터 시스템 -->
		<%@ include file="pds.jsp" %>
		<% } else if(flag.equals("photo")) { %>
		<%@ include file="photo.jsp" %>
		<% } else if(flag.equals("test1")) { %>
		<%@ include file="../0421/init/test1.jsp" %>
		<% } else {%>
		<!-- 아래는 메인 구역 -->
		<br/>
		<h2>이곳은 메인 화면 입니다.</h2>
		<hr/>
		<p><img src="../images/4.jpg" width="600px"/></p>
		<hr/>
		<p>즐거운 시간 되세요.</p>
		<% } %>
	</div>
	<div id="footer">
		<!-- 이곳은 푸터 영역입니다.  -->
		<%@ include file="footerEx.jsp" %>
	</div>
</div>
</body>
</html>