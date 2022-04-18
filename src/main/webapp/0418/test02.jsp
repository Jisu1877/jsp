<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test02.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>JSP 주석</h2>
	<!-- 이곳은 HTML 주석입니다. -->
	<%-- 이곳은 jsp 주석입니다.(일반사용자에게 보이지 않음/페이지소스보기로 보이지 않음) --%>
	
	<%	 //이곳은 스크립틀릿(scriptlet) 입니다. - 자바코드를 작성할 수 있는 공간입니다.
		 // 자바 한줄 주석입니다.   jsp는 뷰이기때문에 코드를 바꿔도 톰캣을 다시 시작할 필요 없다. 브라우저에서 f5누르면 된다.
		/*
			자바 여러줄 주석입니다.  java 코드를 바꾸면 톰캣이 알아서 리스타트한다. 하지만 바로 다시시작하고 싶으면 ctrl+f11
		*/
		
		System.out.println("이곳은 JSP에서 콘솔로 출력하고 있습니다."); //개발중간에 확인용도로 결과를 보려면 System.out.println 사용(콘솔출력).
		out.println("1.이곳은 jsp에서 출력하고 있습니다.<br/>");  //번역을 HTML로 하기 때문에 태그를 넣어주는 것.
		out.println("<p>2.이곳은 jsp에서 출력하고 있습니다.</p>");//out이란 객체는 내장객체이다. 자바에있는 외장객체를 사용하려면 import가 필요하다.
	%>
	<hr/>
	
	<%--<%="이곳은 표현식(expression)으로 출력된 곳입니다.<br/>"  이렇게 쓴건 jsp에서 줄바꿈태그를 추가해서 번역되도록 한 것.--%>
	<%--<%="이곳은 표현식으로 출력된 곳입니다."<br/> 이렇게 밖으로 빼서 태그를 쓴건 그냥 HTML을 적은 것.  --%>
	<%="<font size='5' color='blue'>이곳은 표현식으로 출력된 곳입니다.</font>" %>
	
	<hr/>
	<h2>이곳은 jsp 본문의 마지막입니다.</h2>
</div>
<p><br/><p>
</body>
</html>