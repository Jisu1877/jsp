<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungjuk3.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>성적 입력</h2><br/>
<%-- 	<form name="myForm" method="post" action="<%=request.getContextPath()%>/sungjukOk3"> --%>
	<!-- <form name="myForm" method="post" action="sungjukOk3.jsp"> -->
	<!-- <form name="myForm" method="post" action="sungjukOk3_2.jsp"> -->
	<form name="myForm" method="post" action="sungjukOk3_3.jsp">
		<p><b>성명</b> : &nbsp;<input type="text" name="name" value="홍길동" autofocus/></p>
		<p><b>성별</b> : &nbsp;
			<input type="radio" name="gender" value="남자" checked/>남자&nbsp;
			<input type="radio" name="gender" value="여자" />여자
		</p>
		<p><b>학생번호</b> : &nbsp;<input type="number" value="20220420" name="no"/></p>
		<p><b>학년</b> : &nbsp;
			<select name="hakyun">
				<option value="">학년을 선택하세요.</option>
				<option value="1">1학년</option>
				<option value="2" selected>2학년</option>
				<option value="3">3학년</option>
			</select>
			기타 : <input type="number" name="hakyunOption" value="4" min="4" max="6"/>
		</p>
		<p><b>국어점수</b> : &nbsp;<input type="number" value="80" name="kor" min="0" max="100"/></p>
		<p><b>영어점수</b> : &nbsp;<input type="number" value="90" name="eng" min="0" max="100"/></p>
		<p><b>수학점수</b> : &nbsp;<input type="number" value="70" name="mat" min="0" max="100"/></p>
		<p>
			<input type="submit" value="전송"/>
			<input type="reset" value="취소" />
		</p>
	</form>
</div>
<p><br/><p>
</body>
</html>