<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>message.jsp</title>
    <script>
    	'use strict';
    	
    	let msg = '<%=msg%>';
    	let url = '<%=url%>';
    	let val = '${val}';
    	
    	if(msg == "loginJoinOk") msg = "회원에 가입되었습니다.";
    	else if(msg == "loginJoinNo") msg = "회원가입 실패.";
    	else if(msg == "loginDeleteOk") msg = "회원 삭제(탈퇴) 처리가 완료되었습니다.";
    	else if(msg == "loginDeleteNo") msg = "회원 삭제(탈퇴) 실패.";
    	else if(msg == "loginIdCheckNo") msg = "이미 존재하는 아이디입니다. 새로 입력해주세요.";
    	else if(msg == "loginUpdateOk") msg = "회원정보가 수정되었습니다.";
    	else if(msg == "loginUpdateNo") msg = "회원정보 수정 실패.";
    	else if(msg == "guestInputOk") msg = "방명록 등록이 완료되었습니다.";
    	else if(msg == "guestInputNo") msg = "방명록 등록에 실패하였습니다.";
    	else if(msg == "adminOk") msg = "관리자 인증이 확인되었습니다.";
    	else if(msg == "adminNo") msg = "관리자 인증에 실패하였습니다. 아이디와 비밀번호를 확인하세요.";
    	else if(msg == "adminLogOutOk") msg = "관리자 로그아웃 되었습니다.";
    	else if(msg == "guestDeleteOk") msg = "방명록 삭제가 완료되었습니다.";
    	else if(msg == "guestDeleteNo") msg = "방명록 삭제에 실패했습니다. 다시 시도해주세요.";
    	else if(msg == "memJoinOk") msg = "회원가입이 완료되었습니다.";
    	else if(msg == "memJoinNo") msg = "회원가입에 실패했습니다.";
    	else if(msg == "idCheckNo") msg = "중복된 아이디입니다.";
    	else if(msg == "nickCheckNo") msg = "중복된 닉네임입니다.";
    	else if(msg == "loginNo") msg = "로그인 실패. 입력하신 아이디와 비밀번호를 확인하세요.";
    	else if(msg == "loginOk") msg = '${sMid}'+"님 로그인 완료되었습니다.";
    	else if(msg == "memLogOutOk") msg = val+"님 로그아웃되었습니다.";
    	
    	alert(msg);
    	if(url != "") location.href = url;
    </script>
</head>
<body>
</body>
</html>