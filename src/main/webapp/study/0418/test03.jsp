<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test03.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>선언문학습(구구단...)</h2>
	<%-- 지시자(디렉티브) : <%@ %> --%>
	<p>1. 이곳은 jsp 선언문입니다.</p>
	<%!		//jsp 선언문은 ! 를 기입한다.
		int tot = 0;  //선언문에서 선언한 변수는 전역변수(웹에서도 사용하겠다..)
		
		public String strLower(String str) {
			String res = str.toLowerCase();
			return res;
		}
	%>
	<p>2. 이곳에서 선언부에 있는 메소드를 호출합니다.</p>
	<%=strLower("SeOul") %><br/>
	<%
		int kor=100, eng=90, mat=80;  //지역변수..
		tot = kor + eng + mat;
	%>
	tot : <%=tot %><br/> <!-- 스크립틀릿(scriptlet)에서 작성하는 out.println(); 과 표현식은 동일한 것이다. -->
	<p>3. 이곳에서 Java를 이용한 구구단을 출력합니다.</p>
	<%
		int tot = 0;	//선언문에 있는 tot와 상관없다. 이 스크립틀릿 안에서만 사용하는 지역변수.
		for(int i=1; i<10; i++) {
			tot = 2 * i;
			out.println("2 * "+i+"= "+tot+" <br/>");
		}
		
	%>
	<p>4. 이곳은 본문의 마지막입니다.</p>
</div>
<p><br/><p>
</body>
</html>