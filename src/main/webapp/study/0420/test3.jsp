<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test3.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	body {
			margin : 0px;
			padding : 0px;
    	}
    	.container {
    		width : 1000px;
    	}
    	.section {
    		background-color: beige;
    	}
    </style>
    <script>
    	function fCheck(flag) {
/* 			if(flag == 'asc') {
				myForm.flag.value = flag;
			}
			else {
				myForm.flag.value = flag;
			} */
			myForm.flag.value = flag;
			myForm.submit();
		}
    </script>
</head>
<body>
<div class="container">
	<!-- 
		폼을 통해서 상품명과 상품 가격을 6개 입력받아서 가격순으로 오름차순/내림차순 정렬처리후 출력하시오.
		구현 파일 : jsp
		파일명 : test03Ok.jsp
		폼태그의 내용은 미리 value값에 저장시켜놓는다.
		버튼 : '오름차순'/'내림차순'/'돌아가기'
		출력시에는 원본자료와 정렬된 자료를 모두 출력시켜주시오.
		완성 후 화면을 예쁘게 꾸며보세요.(bs4사용...)
	  -->
	  <header class="header">
	  <nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
            <a class="navbar-brand" href="#">상품 등록 페이지</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="test3.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
	  </header>
	  <section class="section">
	  	<br/>
	  	<div class="w3-container">
 		 	<h3>등록할 상품을 입력해주세요.</h3>
		</div>
		<form name="myForm" method="post" action="test03Ok.jsp">
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 1 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="냉장고">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="number" name="price" placeholder="price" value="1300000">
  			</div>
		</div>
		<br/>
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 2 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="식기세척기">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="number" name="price" placeholder="price" value="270000">
  			</div>
		</div>
  		<br/>
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 3 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="전자레인지">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="text" name="price" placeholder="price" value="240000">
  			</div>
		</div>
  		<br/>
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 4 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="청소기">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="number" name="price" placeholder="price" value="170000">
  			</div>
		</div>
  		<br/>
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 5 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="세탁기">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="number" name="price" placeholder="price" value="2200000">
  			</div>
		</div>
  		<br/>
		<div class="w3-row-padding">
  			<div class="w3-half">
    			<label>상품 이름 6 :</label>
    			<input class="w3-input w3-border" type="text" name="product" placeholder="product" value="오디오">
  			</div>
 			 <div class="w3-half">
    			<label>가격 : </label>
    			<input class="w3-input w3-border" type="number" name="price" placeholder="price" value="500000">
  			</div>
		</div>
		<br/>
			<div style="text-align : center;">
				<input type="button" value="오름차순 출력" class="btn btn-primary" onclick="fCheck('asc')"/>&nbsp;&nbsp;
	 			<input type="button" value="내림차순 출력" class="btn btn-primary" onclick="fCheck('desc')"/>&nbsp;&nbsp;
				<input type="reset" value="다시 작성" class="btn btn-primary"/>
			</div>
			<input type="hidden" name="flag"/>
		<br/>
<!-- 		</form> -->
	  </section>
</div>
</body>
</html>