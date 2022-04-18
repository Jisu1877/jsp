<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test05_2.jsp</title> <!-- 코드가 모두 html 태그라서 HTML로 작성해도 문제없다. -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>JSP Form Tag 연습(POST방식)</h2> <!-- POST방식은 주소에서 변수를 확인할 수 없다. -->
	<form name="myForm" method="post" action="test05Ok.jsp"> <!-- 데이터를 받아주는 쪽은 jsp파일이어야 한다. -->
		<p>아이디 : <input type="text" name="mid" autofocus/></p>
		<p>비밀번호 : <input type="password" name="pwd" /></p>
		<p>
			<input type="submit" value="전송"/>
			<input type="reset" value="다시입력"/>
		</p>
	</form>
</div>
<p><br/><p>
</body>
</html>