<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test1Form.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<form name="myForm" method="post" action="test1FormOk.jsp"> <!-- 넘길 정보의 양이 많을 땐 post방식을 채택. 헤더에 내용을 담아서 보내기때문.. -->
		<p>성명 : <input type="text" name="name" value="홍길동"/></p>
		<p>가격 : <input type="number" name="price" value="10000"/></p>
		<!-- submit 버튼은 자신이 속한 form 태그의 모든 내용을 가지고 action에 적힌 곳으로 간다.  -->
		<p><input type="submit" value="전송(post전송)"/></p>
		<p><input type="button" value="전송2(location.href(get방식))" onclick="location.href='test1FormOk.jsp?name=연습이&price=5000'"/></p> <!-- get방식으로 넘어감. -->
	</form>
</div>
<p><br/><p>
</body>
</html>