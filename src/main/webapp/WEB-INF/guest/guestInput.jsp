<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>guestInput.jsp</title>
    <script type="text/javascript">
    	'ues strict';
    	function fCheckEmail() {
	    	let regEmail = /^[a-zA-Z0-9_+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+/g;    
	    	let email = document.getElementById("email").value;

	    	 if(!regEmail.test(email)) {
	                alert("이메일 형식에 맞지 않습니다.");
	                document.getElementById("email").value = '';
	                return false;
	         }

		}
    	
    	function fCheckName() {
    		let regName = /^[가-힣a-zA-Z]{2,19}$/g;
	    	let name = document.getElementById("name").value;

	    	if(!regName.test(name)) {
                alert("성명은 한글과 영문자만 입력 가능합니다.");
                document.getElementById("name").value = '';
                return false;
	    	}
		}
    </script>
    <%@ include file="/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<form name="myForm" method="post" action="${ctp}/guestInputOk.gu" class="was-validated">
		<h2>방명록 글쓰기</h2>
		<div class="form-group" >
	      <label for="name">성명:</label>
	      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" onblur="fCheckName();" required autofocus>
	      <div class="valid-feedback">입력성공.</div>
	      <div class="invalid-feedback">성명은 필수 입력사항입니다.</div>
	    </div>
		<div class="form-group" >
	      <label for="email">E-mail:</label>
	      <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요." name="email" onblur="fCheckEmail();">
	      <div class="invalid-feedback">이메일은 선택 입력사항입니다.</div>
	    </div>
		<div class="form-group" >
	      <label for="homepage">Homepage:</label>
<!-- 	      <input type="text" class="form-control" id="homepage" placeholder="homepage를 입력하세요." name="homepage"> -->
	      <input type="text" class="form-control" id="homepage" value="http://" name="homepage">
	      <div class="invalid-feedback">홈페이지는 선택 입력사항입니다.</div>
	    </div>
	    <div class="form-group">
	      <label for="content">방문소감:</label>
	      <textarea rows="5" class="form-control" id="content" placeholder="방문소감을 입력하세요." name="content" required></textarea>
	      <div class="valid-feedback">입력성공.</div>
	      <div class="invalid-feedback">방문소감은 필수 입력사항입니다.</div>
	    </div>
	    <div class="form-group">
		<button type="submit" class="btn btn-secondary">방명록 등록</button> &nbsp;&nbsp;		
		<button type="reset" class="btn btn-secondary">방명록 다시작성</button>	&nbsp;&nbsp;			
		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/guestList.gu';">돌아가기</button>		
		</div>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>">
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>