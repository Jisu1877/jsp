<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test2.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<!-- 
		수를 폼태그에서 입력받아 입력받은 수의 거듭제곱값을 출력하시오?(서블릿으로 구현하여 출력하시오)
		서블릿파일명 : t0420.Test2
		컨트롤러명 : tt02Ok
	 -->
	 <form name="myForm" method="post" action="<%=request.getContextPath()%>/tt02Ok">
	 	<p>거듭제곱을 계산할 수를 입력하세요 : <input type="number" name="num"/></p>
	 	<input type="submit" value="전송"/>
	 	<input type="reset" value="취소"/>
	 </form>
</div>
<p><br/><p>
</body>
</html>