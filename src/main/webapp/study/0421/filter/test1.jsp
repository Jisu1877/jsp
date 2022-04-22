<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test1.jsp(/0421/filter/test1.jsp)</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>회원 정보</h2><br/>
<%-- 	<form name="myForm" method="post" action="<%=request.getContextPath()%>/sungjukOk3"> --%>
	<!-- <form name="myForm" method="post" action="sungjukOk3.jsp"> -->
	<!-- <form name="myForm" method="post" action="sungjukOk3_2.jsp"> -->
	<form name="myForm" method="post" action="<%=request.getContextPath()%>/filter/test1">
		<p><b>성명</b> : &nbsp;<input type="text" name="name" value="홍길동" autofocus/></p>
		<p><b>성별</b> : &nbsp;
			<input type="radio" name="gender" value="남자" checked/>남자&nbsp;
			<input type="radio" name="gender" value="여자" />여자
		</p>
		<p><b>나이</b> : &nbsp;<input type="number" value="20" name="age"/></p>
		<p>
			<input type="submit" value="전송"/>
			<input type="reset" value="취소" />
		</p>
	</form>
</div>
<p><br/><p>
</body>
</html>