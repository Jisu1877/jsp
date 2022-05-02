<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>el2.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>Form값을 전달받아 출력해본다.</h3>
	아이디 : ${param.mid}<br/>
	비밀번호 : ${param.pwd}<br/>
	성명 : ${param.name}<br/>
	idx : ${param.idx}<br/>
	취미 : ${param.hobby}<br/><br/>
	- 앞의 문장중 '취미'는 같은 변수명을 사용해서 여러개를 넘기므로 배열처리해야 한다.<br/>
	- 만약 배열의 값을 직접 받아 출력하고자 한다면? paramValues 를 사용한다.<br/>
	hobby[0] : ${paramValues.hobby[0]}<br/>
	hobby[1] : ${paramValues.hobby[1]}<br/>
	hobby[2] : ${paramValues.hobby[2]}<br/>
	<hr/>
<% 
	int[] num1 = new int[5]; 
	for(int i=0; i<num1.length; i++) {
		num1[i] = (i+1) * 10;
	}
	int[] num2 = {10,2,3,4,50};
	
	pageContext.setAttribute("num1", num1);
	pageContext.setAttribute("num2", num2);
%>
	<h3>배열에 저장된 값 출력</h3>
	num1 : ${num1} => 배열의 주소가 찍힘 <br/>
	num1[0] : ${num1[0]}<br/>
	num1[4] : ${num1[4]}<br/>
	num1[5] : ${num1[5]}  => 배열의 크기를 넘어서면 값이 나오지않는다.(에러는 나지 않음)<br/>
	
	<h4>관계/논리 연산자</h4>
	num1[0] : ${num1[0]} / num2[0] : ${num2[0]}
	
	num1[0] == num2[0] : ${num1[0] == num2[0]}<br/>
	num1[0] eq num2[0] : ${num1[0] eq num2[0]}<br/>
	<br/>
	num1[0] != num2[0] : ${num1[0] != num2[0]}<br/>
	num1[0] ne num2[0] : ${num1[0] ne num2[0]}<br/>
	<br/>
	num1[0] > num2[0] : ${num1[0] > num2[0]}<br/>
	num1[0] gt num2[0] : ${num1[0] gt num2[0]} => gt : 부등호 '크다'<br/>
	<br/>
	num1[0] < num2[0] : ${num1[0] < num2[0]}<br/>
	num1[0] lt num2[0] : ${num1[0] lt num2[0]} => gt : 부등호 '작다'<br/>
	<br/>
	num1[0] >= num2[0] : ${num1[0] >= num2[0]}<br/>
	num1[0] ge num2[0] : ${num1[0] ge num2[0]}<br/>
	<br/>
	num1[0] <= num2[0] : ${num1[0] <= num2[0]}<br/>
	num1[0] le num2[0] : ${num1[0] le num2[0]}<br/>
	
	<hr/>
<%
	ArrayList<String> arrVos = new ArrayList<String>();
	arrVos.add("홍길동");
	arrVos.add("김말숙");
	arrVos.add("이기자");
	arrVos.add("오하늘");
	
	pageContext.setAttribute("arrVos", arrVos);
%>	

	<h3>EL표기법으로 객체(ArrayList)를 출력(표현)하기</h3>
	arrVos : ${arrVos}<br/>
	arrVos[0] : ${arrVos[0]}<br/>
	arrVos[1] : ${arrVos[1]}<br/>
	arrVos[2] : ${arrVos[2]}<br/>
	arrVos[3] : ${arrVos[3]}<br/>
	
<%
	HashMap<String, String> mapVos = new HashMap<>();
	mapVos.put("성명", "길순이");
	mapVos.put("나이", "3쨜");
	mapVos.put("요일", "금요일");
	mapVos.put("가장 원하는 것", "울오빠랑 놀러가고싶댜");
	
	pageContext.setAttribute("mapVos", mapVos);
%>
	<h3>EL표기법으로 객체(HashMap)를 출력(표현)하기</h3>
	arrVos : ${mapVos}<br/>
	mapVos["성명"(키값을 적기)] : ${mapVos["성명"]}<br/>
	mapVos["나이"] : ${mapVos["나이"]}<br/>
	mapVos["요일"] : ${mapVos["요일"]}<br/>
	mapVos["가장 원하는 것"] : ${mapVos["가장 원하는 것"]}<br/>
	<hr/>
	
<%
	pageContext.setAttribute("var1", "문자");
	pageContext.setAttribute("var2", "");
	pageContext.setAttribute("var3", null);
%>

	<h4>Null값처리</h4>
	var1 : ${var1}<br/>
	var2 : ${var2}<br/>
	var3 : ${var3}<br/>
	null이 들어있어도 화면에는 안보인다.. var3이 현재 null이다.<br/>
	== 비교 : ${var1 == ""}<br/>
	== 비교 : ${var2 == ""}<br/>
	== 비교 : ${var3 == ""}<br/>
	<br/>
	null 비교 : ${var1 == null}<br/>
	null 비교 : ${var2 == null}<br/>
	null 비교 : ${var3 == null}<br/>
	연산자 : empty - EL에서는 null 과 ""(공백)을 동시에 비교할 수 있다.<br/>
	var1 == null || var1 == ""    --> EL에서는? ${empty var1}<br/>
	var2 == null || var2 == ""    --> EL에서는? ${empty var2}<br/>
	var3 == null || var4 == ""    --> EL에서는? ${empty var3}<br/>
	
	문제 : var1 == null || var1 == "" 인가????  ${empty var1 ? "OK" : var1}<br/>
	문제 : var3 == null || var3 == "" 인가????  ${empty var3 ? "OK" : var3}
	<p><a href="el.st" class="btn btn-secondary">돌아가기</a></p>
	<hr><hr>
	
	<!-- forEach연습하기 -->
<%
	String[] hobbys = request.getParameterValues("hobby");
	pageContext.setAttribute("hobbys", hobbys);
%>
	전송된 취미는? &nbsp;
	<c:forEach var="hobby" items="${hobbys}" varStatus="st">
		${st.count}. ${hobby}
		<c:set var="cnt" value="${st.count}"></c:set>
	</c:forEach>
	전체 선택한 취미의 건수는? ${cnt}
	<hr/>
<%
	String hobbys2 = "등산/낚시/바둑/영화감상/수영";
	request.setAttribute("hobbys2", hobbys2);
%>
	<p>토근(특정 기호(Token)값)을 이용한 분리 : forTokens</p>
	취미 : 
	<c:forTokens var="hobby" items="${hobbys2}" delims="/">
		${hobby} , &nbsp;
	</c:forTokens>
	<br/><br/>
	<p>문제 : 앞의 선택된 취미중, '바둑'은 '빨강색', '수영'은 '파랑색'으로 출력(나머지는 검정)</p>
	<c:forEach var="hobby" items="${hobbys}" varStatus="st">
		<c:choose>
			<c:when test="${hobby eq '바둑'}"><font color="red"><b>${hobby}</b></font></c:when>
			<c:when test="${hobby eq '수영'}"><font color="blue"><b>${hobby}</b></font></c:when>
			<c:otherwise>${hobby}</c:otherwise>	
		</c:choose>
	</c:forEach>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>