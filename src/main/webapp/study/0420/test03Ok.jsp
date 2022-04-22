<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] products = request.getParameterValues("product");
	String[] strProducts = request.getParameterValues("product"); //원본출력을 위해 한번 더 가져오기.
	
	String[] prices = request.getParameterValues("price"); 
	int[] intPrices = new int[6];
	String flag= request.getParameter("flag");
	
	//정수배열로 전환(가격비교를 위해서..)
	for(int i=0; i<prices.length; i++) {
		intPrices[i] = Integer.parseInt(prices[i]);
	}
	
	//자료 정렬
	int temp = 0;
	String strTemp = "";
	for(int i=1; i<=5; i++) {
		for(int j=i+1; j<=6; j++) {
			if(flag.equals("asc")) {
				if(intPrices[i-1] > intPrices[j-1]) {
					strTemp = products[i-1]; products[i-1] = products[j-1]; products[j-1] = strTemp;
					temp = intPrices[i-1]; intPrices[i-1] = intPrices[j-1]; intPrices[j-1] = temp;
				}
			}
			else {
				if(intPrices[i-1] < intPrices[j-1]) {
					strTemp = products[i-1]; products[i-1] = products[j-1]; products[j-1] = strTemp;
					temp = intPrices[i-1]; intPrices[i-1] = intPrices[j-1]; intPrices[j-1] = temp;
				}
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test03Ok.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
   		height : 600px;
   		background-color: beige;
   	}
   	#button {
   		clear: both; 
   	}
    </style>
</head>
<body>
<div class="container">
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
		 <div id="origin">
			 <br/>
			 <h5>등록한 상품(원본 출력) : </h5>
			 <br/>
			 <%	for(int i=0; i<strProducts.length; i++) { %>
			 	<p><b>상품명</b> : <%= strProducts[i] %>   <b>가격</b> : <%=prices[i] %></p>
			 <% } %>
		 </div>	
		 <br/>
		 	 <% if(flag.equals("asc")) {%>
		 	 <h5>등록한 상품(오름차순 출력) : </h5>
		 	 <% } else if(flag.equals("desc")) {%>
		 	 <h5>등록한 상품(내림차순 출력) : </h5>
		 	 <% } %> 
		 	 <%	for(int i=0; i<strProducts.length; i++) { %>
			 	<p><b>상품명</b> : <%= products[i] %>   <b>가격</b> : <%=intPrices[i] %></p>
			 <% } %>
		 <div id="button">
		 	<form>
	 			<input type="button" value="돌아가기" class="btn btn-primary" onclick="location.href='test3.jsp';" />
		 	</form>
		 </div>
	 </section>
</div>
</body>
</html>