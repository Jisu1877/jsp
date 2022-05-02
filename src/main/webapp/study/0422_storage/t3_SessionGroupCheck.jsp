<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
	String nickName = session.getAttribute("sNickName") == null ? "" : (String) session.getAttribute("sNickName");
	int age = session.getAttribute("sAge") == null ? 0 : (int) session.getAttribute("sAge");
%> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>t3_SessionCheck.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h2>세션 그룹 확인</h2>
	<hr/>
	<table class="table table-hover">
		<tr class="table table-dark">
			<th>번호</th><th>세션명</th><th>세션값</th>
		</tr>
	<%
	//세션 그룹은 열거형으로 데이터를 받아올 수 있다.
	Enumeration	names = session.getAttributeNames();
	int cnt = 0;
	
	while(names.hasMoreElements()) {  //자료가 있으면 참이 된다.hasMoreElements()  끝에 EOF를 만나면 false가 된다.
		String name = (String) names.nextElement(); //첫줄은BOF니까 그 다음줄을 보여달라는 명령어.nextElement()
		String value;
		if(name.equals("sAge")) {
			int intValue = (int) session.getAttribute(name);
			value = intValue + "";
		}
		else {
			value = (String) session.getAttribute(name);
		}
		cnt++;
		out.println("<tr>");
		out.println("<td>"+cnt+"</td>");
		out.println("<td>"+name+"</td>"); 
		out.println("<td>"+value+"</td>"); 
		out.println("</tr>");
	}
	%>
	</table>
	<br/>
	<div><a href="t3_SessionMain.jsp" class="btn btn-success form-control m-1">돌아가기</a></div>
	<!-- history.back(); 를 쓰면 안된다. 세션에 저장된 정보가 적용되지 않는다. -->
	<div><button type="button" onclick= "location.href='t3_SessionMain.jsp'" class="btn btn-success form-control m-1">돌아가기</button></div>
</div>
<p><br/><p>
</body>
</html>