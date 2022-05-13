<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@page import="guest.GuestVO"%>
<%@page import="guest.GuestDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberVO"%>
<%
	//회원 정보 가져오기
	MemberDAO memDao = new MemberDAO();
	ArrayList<MemberVO> memVos = memDao.getMemList(99);
	
	//게시판 정보 가져오기(5개만)
	BoardDAO boDao = new BoardDAO();
	ArrayList<BoardVO> boVos = boDao.getBoListHome();
	
	//방명록 정보 가져오기(5개만)
	GuestDAO guestDao = new GuestDAO();
	ArrayList<GuestVO> guestVos = guestDao.getGuestListHome();
	
	pageContext.setAttribute("memVos", memVos);
	pageContext.setAttribute("boVos", boVos);
	pageContext.setAttribute("guestVos", guestVos);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>javagreenJ프로젝트(이지수)</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/include/bs4.jsp" %>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
  .tableStyle {
  	background: coral;
  }
  
  a:hover {
  	color : burlywood;
  	text-decoration: none;
  }
  </style>
</head>
<body>

<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>

<!-- 본문영역  -->
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h3>신규회원</h3>
      <p>환영합니다!🙌</p>
      <div>
      	<table class="table table-hover text-center">
	      	<tr class="w3-amber">
				<th>번호</th>
				<th>아이디</th>
				<th>별명</th>
			</tr>
			<c:set var="sw" value="0"/>
	      	<c:forEach var="vo" items="${memVos}" varStatus="st"> 
	      		<c:if test="${sw == 0}">
	      		<tr>
	      			<td>${st.count}</td>
					<td>
					<c:choose>
		      			<c:when test="${empty sMid}">
							<a href="${ctp}/memMessage.mem?messageFlag=main">${vo.mid}</a>
		      			</c:when>
		      			<c:otherwise>                                                                                                                                                                                                                                                                                                                                                                                                                                      
							<a href="${ctp}/memInforOk.mem?mid=${vo.mid}">${vo.mid}</a>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${vo.nickName}</td>
					<c:if test="${st.count == 3}">
					<c:set var="sw" value="1"></c:set>
					</c:if>
				</tr>
				</c:if>
	      	</c:forEach>
			<tr><td colspan="6" class="p-0"></td></tr>
      	</table>
      	<div class="text-right">
      	<c:choose>
   			<c:when test="${empty sMid}">
				<a href="${ctp}/memMessage.mem?messageFlag=main">more👉</a>
   			</c:when>
   			<c:otherwise>                                                                                                                                                                                                                                                                                                                                                                                                                                      
				<a href="${ctp}/memList.mem">more👉</a>
			</c:otherwise>
		</c:choose>
      	</div>
      </div>
      <p></p>
      <p>❤️기분좋은 하루 보내세요❤️</p>
      <img src="images/4.jpg" width="340px"/>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
    	<h3>GUEST</h3>
      <p>방명록을 남겨주세요😊</p>
      <div>
      	<table class="table table-hover text-center">
	      	<tr class="w3-light-blue">
				<th>이름</th>
				<th>내용</th>
				<th>작성일자</th>
			</tr>
			<c:set var="sw" value="0"/>
	      	<c:forEach var="vo" items="${guestVos}" varStatus="st"> 
	      		<tr>
	      			<td>${vo.name}</td>
					<td>
						${fn:substring(vo.content, 0, 10)}<c:if test="${fn:length(vo.content) > 9}">...</c:if>
					</td>
					<td>${fn:substring(vo.vDate, 0, 10)}</td>
				</tr>
	      	</c:forEach>
	      	<tr><td colspan="6" class="p-0"></td></tr>
      	</table>
	      <div class="text-right">
				<a href="${ctp}/guestList.gu">방명록 쓰러가기👉</a>
	      </div>
    </div>
    <div class="col-sm-12" id="board">
      <h3>BOARD</h3>
      <p>게시판 글을 확인해보세요</p>
         <table class="table table-hover text-center">
	      	<tr class="w3-theme-d1">
				<th>이름</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
			<c:set var="sw" value="0"/>
	      	<c:forEach var="vo" items="${boVos}" varStatus="st"> 
	      		<tr>
	      			<td>${vo.nickName}</td>
					<td>
						${fn:substring(vo.title, 0, 10)}<c:if test="${fn:length(vo.content) > 9}">...</c:if>
					</td>
					<td>${fn:substring(vo.wDate, 0, 10)}</td>
				</tr>
	      	</c:forEach>
	      	<tr><td colspan="6" class="p-0"></td></tr>
      	</table>
    </div>
  </div>
</div>
</div>
</body>
<%@ include file="/include/footer.jsp" %>
</html>
