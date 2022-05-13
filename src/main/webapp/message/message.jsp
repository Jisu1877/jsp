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
    	else if(msg == "MemPwdFindOk") msg = "입력 정보 확인 완료. 비밀번호 재생성을 진행해주세요.";
    	else if(msg == "MemPwdFindNo") msg = "입력하신 정보와 일치하는 회원이 없습니다.";
    	else if(msg == "MemPwdInputNo") msg = "비밀번호 재생성에 실패했습니다.";
    	else if(msg == "MemPwdInputOk") msg = "비밀번호 재생성 완료.";
    	else if(msg == "levelChangeOk") msg = "등급이 변경되었습니다.";
    	else if(msg == "memDeleteUpdateNo") msg = "회원탈퇴에 실패했습니다.";
    	else if(msg == "memDeleteUpdateOk") msg = "회원탈퇴가 완료되었습니다.";
    	else if(msg == "UserDeleteOk") msg = "회원DB에서 삭제가 완료되었습니다.";
    	else if(msg == "UserDeleteNo") msg = "회원 삭제에 실패했습니다.";
    	else if(msg == "passwordNo") msg = "비밀번호가 일치하지 않습니다.";
    	else if(msg == "memUpdateOk") msg = "회원정보 수정이 완료되었습니다.";
    	else if(msg == "memUpdateNo") msg = "회원정보 수정에 실패했습니다.";
    	else if(msg == "boInputOk") msg = "게시글이 등록되었습니다.";
    	else if(msg == "boInputNo") msg = "게시글 등록 실패.";
    	else if(msg == "memUpdatePwdNo") msg = "현재 비밀번호가 일치하지 않습니다.";
    	else if(msg == "memUpdatePwdNoNo") msg = "비밀번호 변경 실패";
    	else if(msg == "memUpdatePwdOk") msg = "비밀번호 변경이 완료되었습니다.";
    	else if(msg == "loginRequest") msg = "로그인 후 이용해주세요.";
    	else if(msg == "boUpdateOk") msg = "게시글 수정이 완료되었습니다.";
    	else if(msg == "boUpdateNo") msg = "게시글 수정에 실패했습니다.";
    	else if(msg == "boDeleteOk") msg = "게시글이 삭제되었습니다.";
    	else if(msg == "boDeleteNo") msg = "게시글 삭제에 실패했습니다.\n댓글을 먼저 지워주세요.";
    	
    	
    	alert(msg);
    	if(url != "") location.href = url;
    </script>
</head>
<body>
</body>
</html>