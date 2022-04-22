<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test11.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	'use strict'
    	function fCheck() {
	    	let name = myForm.name.value;
	    	let gender = myForm.gender.value;
	    	let no = myForm.no.value;
	    	let hakyun = myForm.hakyun.value;
	    	let kor = myForm.kor.value;
	    	let eng = myForm.eng.value;
	    	let mat = myForm.mat.value;
	    	let sports = myForm.sports.value;
	    	let otherSports = myForm.otherSports.value;
	    	/* alert(sports); */
    	
	    	if(name == "") {
	    		alert("성명을 입력하세요!");
	    		myForm.name.focus();
	    	}
	    	else if(no == "") {
	    		alert("학생 번호를 입력하세요!");
	    		myForm.no.focus();
	    	}
	    	else if(sports == "") {
	    		alert("좋아하는 스포츠를 1개이상 선택하세요!");
	    	}
			else if(sports == "기타" && otherSports == "") {
				alert("기타란에 스포츠를 입력하세요.");			
	    		myForm.otherSports.focus();
	    	} 
	    	/*
			else if(hakyun == "") {
	    		alert("학년을 입력하세요!");
	    		myForm.hakyunOption.focus();
	    	}
	    	 */
	    	else {
	    		myForm.submit();
	    	}
    	}
    	function  sportsCheck() {
			let sports = myForm.sports.value;
			if(sports == '기타') {
				myForm.otherSports.focus();
			}
		}
    	
    </script>
</head>
<body>
<p><br/><p>
<div class="container">
	<!-- 
		문제 : 성적평가표 만들기
		입력사항 : 성명(name : text), 성별(gender : radio), 학생번호(no : number), 학년(hakyun : 콤보상자),
				 국어(kor : number), 영어(eng : number), 수학(mat : number), 전송버튼(button), 취소(reset)
		자바스크립트를 이용한 유효성체크(공백)
		전송받을 주소? /T11Ok (컨트롤러 어노테이션 이용)
		
		출력사항 : 입력사항 모두 + 총점/평균/학점
	 -->
	
	<h2>성적 입력</h2><br/>
	<form name="myForm" method="get" action="../T11Ok">
		<p><b>성명</b> : &nbsp;<input type="text" name="name" autofocus/></p>
		<p><b>성별</b> : &nbsp;
			<input type="radio" name="gender" value="남자" checked/>남자&nbsp;
			<input type="radio" name="gender" value="여자" />여자
		</p>
		<p><b>사용가능 컴퓨터언어</b> : &nbsp;
			<input type="checkbox" name="language" value="JAVA"/>JAVA &nbsp;
			<input type="checkbox" name="language" value="Database"/>Database &nbsp;
			<input type="checkbox" name="language" value="HTML5"/>HTML5 &nbsp;
			<input type="checkbox" name="language" value="CSS3"/>CSS3 &nbsp;
			<input type="checkbox" name="language" value="Javascript"/>Javascript &nbsp;
			<input type="checkbox" name="language" value="jQuery"/>jQuery &nbsp;
			<input type="checkbox" name="language" value="JSP"/>JSP &nbsp;
			<input type="checkbox" name="language" value="aJax"/>aJax &nbsp;
			<input type="checkbox" name="language" value="SpringFramework"/>SpringFramework
		</p>
		<p><b>학생번호</b> : &nbsp;<input type="number" name="no"/></p>
		<p><b>학년</b> : &nbsp;
			<select name="hakyun">
				<option value="">학년을 선택하세요.</option>
				<option value="1학년">1학년</option>
				<option value="2학년">2학년</option>
				<option value="3학년">3학년</option>
			</select>
			기타 : <input type="number" name="hakyunOption" value="4" min="4" max="6"/>
		</p>
		<p><b>국어점수</b> : &nbsp;<input type="number" name="kor" min="0" max="100"/></p>
		<p><b>영어점수</b> : &nbsp;<input type="number" name="eng" min="0" max="100"/></p>
		<p><b>수학점수</b> : &nbsp;<input type="number" name="mat" min="0" max="100"/></p>
		<p>
			<b>좋아하는 스포츠 : </b>
			<select name="sports" size="5" multiple onchange="sportsCheck()">
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="농구">농구</option>
				<option value="탁구">탁구</option>
				<option value="배구">배구</option>
				<option value="수영">수영</option>
				<option value="마라톤">마라톤</option>
				<option value="태권도">태권도</option>
				<option value="루지">루지</option>
				<option value="가라테">가라테</option>
				<option value="기타">기타</option>
			</select> &nbsp;&nbsp;
			기타 : <input type="text" name="otherSports"/>
		</p>
		<p>
			<input type="button" value="전송" onclick="fCheck()"/>
			<input type="reset" value="취소" />
		</p>
	</form>
</div>
<p><br/><p>
</body>
</html>