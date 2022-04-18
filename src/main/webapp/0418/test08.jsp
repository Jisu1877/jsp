<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test08.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>test08.jsp</h2>
	<h2>JSP Form Tag 연습(GET/POST방식)</h2>
	<form name="myForm" method="post" action="test08Ok.jsp">
	<!-- <form name="myForm" method="get" action="../T08"> --> <!-- ../이라고 하면, main폴더로 올라가는 것. main폴더 아래에 T08_2 이름의 컨트롤러를 가진 파일을 찾는 것. -->
		<p>아이디 : <input type="text" name="mid" autofocus/></p>
		<p>비밀번호 : <input type="password" name="pwd" /></p>
		<p>성명 : <input type="text" name="name" /></p>
		<p>
			<input type="submit" value="전송"/>
			<input type="reset" value="다시입력"/>
		</p>
	</form>
</div>
<p><br/><p>
</body>
</html>