<%@page import="study.database.LoginVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="study.database.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>jstl1.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>JSTL(Java Standard Tag Library)</h2>
	<table class="table">
		<tr>
			<th>라이브러리명</th>
			<th>주소(URL)</th>
			<th>접두어</th>
			<th>문법</th>
		</tr>
		<tr>
			<th>Core</th>
			<th>http://java.sun.com/jsp/jstl/core</th>
			<th>c</th>
			<th>< c : 태그 ...></th>
		</tr>
		<tr>
			<th>Function</th>
			<th>http://java.sun.com/jsp/jstl/function</th>
			<th>fn</th>
			<th>$ {fn : 태그 ...}</th>
		</tr>
		<tr>
			<th>Formatting</th>
			<th>http://java.sun.com/jsp/jstl/fmt</th>
			<th>fmt</th>
			<th>< fmt : 태그 ...></th>
		</tr>
		<tr>
			<th>SQL</th>
			<th>http://java.sun.com/jsp/jstl/sql</th>
			<th>sql</th>
			<th>< sql : 태그 ...></th>
		</tr>
	</table>
	<hr/>
	<h4>Core라이브러리 : 변수제어(선언/할당), 제어문(조건,반목문)안에서의 변수</h4>
	<p>변수 선언 : < c : set var="변수명" value="값" /></p>
	<p>변수(값) 출력 : < c : out value="변수명(el표기법)" /></p>
	<p>변수 제거 : < c : remove var="변수명" /> 설정한 변수를 메모리에서 제거시킨다.(JVM이 닫히면 자동제거)</p>
	<p>예외 처리 : < c : catch 문장.... /></p>
	<hr/>
	su1변수 선언 및 값 할당? <c:set var="su1" value="100"/><br/>
	su1변수의 값을 출력? <c:out value="${su1}"/> == ${su1}<br/>

	<hr/>
	<h3>JSTL 제어문(core라이브러리를 사용)</h3>
	<h4>(조건문 : 참일때 수행할 내용만 있음. 즉 else 문장이 없다.)</h4>
	<p>문법 : < c : if test="$ {조건식} "> 참일때 수할할 내용 < /c : if ></p>
	<p>일반 비교연산 수행시는 '문자'로 비교처리한다. 숫자로 변형하려면 변수명 뒤에 '+0'을 붙인다.</p>
	<p>조건이 참일때만 수행..!</p>
	<c:set var="su1" value="500"/>
	<c:set var="su2" value="1000"/>
	su1 = ${su1}, su2 = ${su2}<br>
	1_1. su1 == su2 : <c:if test="${su1 == su2}">su1과 su2는 같다.</c:if><br/>
	1_2. su1 != su2 : <c:if test="${su1 != su2}">su1과 su2는 다르다.</c:if><br/>

	2_1. su1 >= su2 : <c:if test="${su1 >= su2}">su1이 su2보다 크거나 같다.</c:if><br/>
	2_2. su1 < su2 : <c:if test="${su1 < su2}">su1이 su2보다 크지 않다.</c:if><br/>

	3_1. su1 >= su2 : <c:if test="${su1+0 >= su2}">su1이 su2보다 크거나 같다.</c:if><br/>
	3_2. su1 < su2 : <c:if test="${su1+0 < su2}">su1이 su2보다 크지 않다.</c:if><br/>
	
	<hr/>
	<p>점수 할당후 비교(학점구하기)? <c:set var="jumsu" value="85"/></p>
	<c:if test="${jumsu >= 90}"><c:set var="grade" value="A"/></c:if>
	<c:if test="${jumsu >= 80}"><c:set var="grade" value="B"/></c:if>
	<c:if test="${jumsu >= 70}"><c:set var="grade" value="C"/></c:if>
	<c:if test="${jumsu >= 60}"><c:set var="grade" value="D"/></c:if>
	<c:if test="${jumsu < 60}"><c:set var="grade" value="F"/></c:if>
	<p>1. 입력된 점수? ${jumsu} , 학점? ${grade}</p>
	<p>앞과 같을경우는 정확한 값이 출력되지 않기에, 조건의 순서를 바꿔서 적어주어야 한다.</p>
	<hr/>
	<p>다중조건의 비교?(choose ~ when ~ otherwise)</p>
	<c:choose>
		<c:when test="${jumsu >= 90}"><c:set var="grade" value="A"/></c:when>
		<c:when test="${jumsu >= 80}"><c:set var="grade" value="B"/></c:when>
		<c:when test="${jumsu >= 70}"><c:set var="grade" value="C"/></c:when>
		<c:when test="${jumsu >= 60}"><c:set var="grade" value="D"/></c:when>
		<c:otherwise><c:set var="grade" value="F"/></c:otherwise>
	</c:choose>
	<p>2. 입력된 점수? ${jumsu} , 학점? ${grade}</p>
	<hr/>
	<h3>반복문(forEach문)</h3>
	<p>문법1 : < c :forEach var="변수" items="$ {배열/객체}">
				수행할내용
			  < /c :forEach></p>
	
	<p>문법2 : < c :forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="인자">
				수행할내용
			  < /c :forEach></p>
	
	<p>1.반복문 예</p>
	<c:forEach var="no" begin="5" end="10" step="1" varStatus="st">
		${no}.안녕 / ${st.first} <!--시작인자 인가? 맞으면 true  --> / ${st.last} <!--마지막인자 인가? 맞으면 true  --> 
		/ ${st.index} / ${st.count}<!-- st.index는 시작인덱스번호-no라고 생각해도됨. / st.count 는 수행횟수. 수행 1번 할때마다 1씩 증가 --> <br>
	</c:forEach>
	<br><br>
<%
	LoginDAO dao = new LoginDAO();

	ArrayList<LoginVO> vos = dao.getLoginList();
	pageContext.setAttribute("vos", vos);
%>
<%-- 	<c:forEach var="vo" items="${vos}" varStatus="st">
		아이디 : ${vo.mid} , 비밀번호 : ${vo.pwd} , 성명 : ${vo.name} <br>
	</c:forEach> --%>
	
	<c:forEach var="atom" items="${vos}" varStatus="st">
		${st.index}(${st.count}). 아이디 : ${atom.mid} , 비밀번호 : ${atom.pwd} , 성명 : ${atom.name} <br>
	</c:forEach>
	<hr/>
	<br>
	<p>회원중 홀수번째 가입한 회원만 출력하시오.</p>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<c:if test="${st.count % 2 != 0}">
		${st.index+1}(${st.count}). 아이디 : ${vo.mid} , 비밀번호 : ${vo.pwd} , 성명 : ${vo.name} <br>
		</c:if>
	</c:forEach>
	<hr>
	<br>
	<p>이중 반복문을 이용한 출력(구구단 3단 ~ 5단)</p>
	<c:forEach var="i" begin="3" end="5">
		<c:forEach var="j" begin="1" end="9">
			${i} * ${j} = ${i * j}<br>
		</c:forEach>
		------------<br>
	</c:forEach>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>