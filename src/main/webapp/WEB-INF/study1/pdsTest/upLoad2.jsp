<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>upLoad1.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
    <script>
    	function fCheck() {
    		'use strict';
    		let fName = $("#file1").val();
    		let ext = fName.substring(fName.lastIndexOf(".")+1);
    		let uExt = ext.toUpperCase();
    		let maxSize = 1024 * 1024 * 10; //업로드 최대파일의 용량은 10MByte로 제한한다.
    		
    		if(fName.trim() == "") {
    			alert("업로드할 파일을 선택하세요.");
    			return false;
    		}
    		                        
    		let fileSize = document.getElementById("file1").files[0].size;
    		if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "MP4") {
    			alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/mp4' 입니다.");
    			return false;
    		}
    		else if(fileSize > maxSize) {
    			alert("업로드할 파일의 최대 용량은 10MByte 입니다.");
    			return false;
    		}    		
    		else {
				myForm.submit();
    		}
		}
    </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2>파일 업로드 테스트 1(멀티파일처리)</h2>
	<p>cos라이브러리를 이용한 파일 업로드</p>
	<hr>
	<form name="myForm" method="post" action="upLoad2Ok.st" enctype="multipart/form-data">  
	<!--enctype="multipart/form-data" 이걸 쓰는 순간 값을 받아주는 쪽에서 request.getParameter로 더이상 값을 불러올 수 없게 된다. multipartRequest로 권한을 일임하게 된다. -->
		<div class="form-group">파일명 :
			<input type="file" name="fName1" id="file1" class="form-control-file border"/>
			<input type="file" name="fName2" id="file2" class="form-control-file border"/>
			<input type="file" name="fName3" id="file3" class="form-control-file border"/>
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary"/>
		</div>
	</form>
	<hr><br>
	<p><a href="downLoad1.st" class="btn w3-lime">다운로드 폼으로 이동하기</a></p>
	<hr>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>