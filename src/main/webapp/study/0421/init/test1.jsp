<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test1.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>특정 서블릿으로부터 초기값을 할당받는다.</h2>
	<h3>servlet에서 받은 초기값</h3>
	<p>
		아이디 : ${mid}<br/> <!-- web.xml에서 부여한 초기값이 T0421_init 파일을 통해서 request에 값을 올려주고.. 그것을 EL이 가져온 것. -->
		비밀번호 : ${pwd}<br/>
		부서명 : ${className}<br/>
	</p>
	<hr/>
	<p>
		<%--회사명 : <%=logoName%><br/> --%>
		<%-- 홈페이지 주소 : <%=homeAddress%> --%>
		<!-- EL로 불러오려고해도 1번은 저장소에 저장하는 것이 필요하다.(T0421_webinit)  -->
		회사명 : ${logoName}<br/>
		홈페이지 주소 : ${homeAddress}
	</p>
</div>
<p><br/><p>
</body>
</html>