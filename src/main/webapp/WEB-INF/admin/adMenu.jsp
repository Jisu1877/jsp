<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adMenu.jsp(관리자메뉴)</title>
    <%@ include file="/include/bs4.jsp" %>
    <frameset cols="150px, *">
    	<frame src="${ctp}/adLeft.ad" name="adLeft" frameborder="0"/>
    	<frame src="${ctp}/adContent.ad" name="adContent" frameborder="0"/>
    </frameset>
</head>
<body>

</body>
</html>