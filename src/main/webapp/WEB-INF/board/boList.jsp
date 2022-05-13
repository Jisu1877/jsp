<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>boList.jsp</title>
    <%@ include file="/include/bs4.jsp" %>
    <style type="text/css">
    	tr {
    		text-align : center;
    	}
    </style>
    <script type="text/javascript">
    	'use strict';
    	function pageCheck() {
			let pageSize = $("#pageSize").val();
			location.href="boList.bo?pag=${pag}&pageSize="+pageSize;
		}
    	
    	//검색기 처리
    	function searchCheck() {
			let searchString = $("#searchString").val();
			
			if(searchString.trim() == "") {
				alert("검색어를 입력하세요.");
				searchForm.searchString.focus();
			}
			else {
				searchForm.submit();
			}
		}
    </script>
</head>
<body>
<%@ include file="/include/header_home.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h2 class="text-center">게 시 판 리 스 트</h2>
	<br>
	<table class="table table-borderless">
		<tr>
			<td class="text-left p-0">
				<a href="boInput.bo" class="btn btn-secondary">글작성</a>
			</td>
			<td class="text-right">
				<select name="pageSize" id="pageSize" onchange="pageCheck()">
					<option value="5" ${pageSize == 5 ? 'selected' : '' }>5건</option>
					<option value="10" ${pageSize == 10 ? 'selected' : '' }>10건</option>
					<option value="15" ${pageSize == 15 ? 'selected' : '' }>15건</option>
					<option value="20" ${pageSize == 20 ? 'selected' : '' }>20건</option>
				</select>
			</td>
		</tr>
	</table>
	<table class="table table-hover">
		<tr class="table-dark text-dark">
			<th>글번호</th>
			<th class="text-left">글제목</th>
			<th>글쓴이</th>
			<th>글쓴날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${curScrStartNo}</td>
				<td class="text-left"><a href="boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
					<c:if test="${vo.replyCount != 0}">
					[${vo.replyCount}]
					</c:if>
					<c:if test="${vo.wNdate <= 24}"><img src="images/new.gif"></c:if>
				</td>
				<td>${vo.nickName}</td>
				<td>
					<c:if test="${vo.wNdate <= 24}">${fn:substring(vo.wDate, 11, 19)}</c:if>
					<c:if test="${vo.wNdate > 24}">${fn:substring(vo.wDate, 0, 10)}</c:if>
				</td>
				<td>${vo.readNum}</td>
				<td>${vo.good}</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		</c:forEach>
		<tr><td colspan="6" class="p-0"></td></tr>
	</table>
</div>
<br>
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
	<ul class="pagination justify-content-center pagination-sm">
	  <c:if test="${pag > 1}">
	  	<li class="page-item"><a class="page-link text-secondary" href="boList.bo?pag=1&pageSize=${pageSize}">◁◁</a></li>
	  </c:if>
	  <c:if test="${curBlock > 0}">
	  	<li class="page-item"><a class="page-link text-secondary" href="boList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
	    <c:if test="${i <= totPage && i == pag}">
	      <li class="page-item active"><a class="page-link text-light border-secondary bg-secondary" href="boList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= totPage && i != pag}">
	      <li class="page-item"><a class="page-link text-secondary" href='boList.bo?pag=${i}&pageSize=${pageSize}'>${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}">
	     <li class="page-item"><a class="page-link text-secondary" href="boList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&pageSize=${pageSize}">▶</a></li>
	  </c:if>
	  <c:if test="${pag != totPage}">
		 <li class="page-item"><a class="page-link text-secondary" href="boList.bo?pag=${totPage}&pageSize=${pageSize}">▷▷</a></li>
	  </c:if>
	 </ul>
</div>
<!-- 블록 페이징 처리 끝 -->

<br>
<!-- 검색기 처리 시작  -->
<div class="container text-center">
	<form name="searchForm" method="post" action="boSearch.bo">
		<b>검색 : </b>
		<select name="search" onchange="searchChange()">
			<option value="title">글제목</option>
			<option value="nickName">글쓴이</option>
			<option value="content">글내용</option>
		</select>
		<input type="text" name="searchString" id="searchString"/>
		<input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
	</form>
</div>
<!-- 검색기 처리 끝  -->
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>