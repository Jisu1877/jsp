<%@page import="t0420.SungjukVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	System.out.println("이곳은 sungjukView3.jsp입니다.");
	request.setCharacterEncoding("utf-8");
	
	String strVo = request.getParameter("vo");
	System.out.println("strVO : " + strVo);
	
	/* 	SungjukVO vo = (SungjukVO)request.getParameter("vo"); */
	
	/* SungjukVO vo = (SungjukVO)request.getAttribute("vo"); */
	
	/* System.out.println("Vo : " + vo); */
%>
<%--
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungjukView.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h3>개별 학생 성적표</h3>
	<table class="table table-hover text-center">
		<tr>
			<th>학번</th><td><%=vo.getNo()%></td>
		</tr>	
		<tr>
			<th>성명</th><td><%=vo.getName()%></td>
		</tr>	
		<tr>
			<th>성별</th><td><%=vo.getGender()%></td>
		</tr>	
		<tr>
			<th>학년</th><td><%=vo.getHakyun()%></td>
		</tr>	
		<tr>
			<th>국어점수</th><td><%=vo.getKor()%></td>
		</tr>	
		<tr>
			<th>영어점수</th><td><%=vo.getEng()%></td>
		</tr>	
		<tr>
			<th>수학점수</th><td><%=vo.getMat()%></td>
		</tr>	
		<tr>
			<th>총점</th><td><%=vo.getTot()%></td>
		</tr>	
		<tr>
			<th>평균</th><td><%=vo.getAvg()%></td>
		</tr>	
		<tr>
			<th>학점</th><td><%=vo.getGrade()%></td>
		</tr>	
		<tr>
			<th>좋아하는 스포츠</th><td><%=vo.getStrSports()%></td>
		</tr>	
		<tr>
			<th>사용가능 언어</th><td><%=vo.getStrlanguage()%></td>
		</tr>	
		<tr>
			<td colspan="2">
				<input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/0420/sungjuk.jsp'" class="btn btn-info form-control"/>
			</td>
		</tr>	
	</table>
</div>
<p><br/><p>
</body>
</html>
 --%>