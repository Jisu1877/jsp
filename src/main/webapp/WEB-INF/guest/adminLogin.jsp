<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adminLogin.jsp</title>
     <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<form name="myForm" method="post" action="<%=request.getContextPath()%>/adminLoginOk.gu">
		<table class="table table-bordered text-center">
			<tr>
				<td colspan="2"><h3>관리자 로그인</h3></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">아이디</td>
				<td><input type="text" name="mid" autofocus class="form-control"/></td>
			</tr>
			<tr>
				<td class="bg-secondary text-white">비밀번호</td>
				<td><input type="password" name="pwd" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-success">관리자 로그인</button>&nbsp;&nbsp;
					<button type="reset" class="btn btn-success">다시입력</button>
					<button type="button" class="btn btn-success" onclick="location.href='${ctp}/guestList.gu';">방명록 목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>