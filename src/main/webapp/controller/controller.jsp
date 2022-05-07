<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>message.jsp</title>
    <script>
    	'use strict';
    	
    	let url = '<%=url%>';
    	
    	if(url != "") location.href = url;
    </script>
</head>
<body>
</body>
</html>