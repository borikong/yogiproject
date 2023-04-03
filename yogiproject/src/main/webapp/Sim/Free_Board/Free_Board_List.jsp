<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-자유게시판</title>
<link rel="stylesheet" href="Board.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/Proprac/Sim/Free_Board/Board.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"></jsp:include>
<!-- 본문 -->	
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>자유게시판</strong>
			<p>자유롭게 이용가능한 게시판입니다.</p>
		</div>
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write1">	<!-- 리스트 영역 -->
			<c:if test="${count==0 }">
				<div align="right">
					<div class="title" align="center">&nbsp;&nbsp;&nbsp;&nbsp;게시된 글이 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${count>0 }">
				<div class="top">		<!-- 리스트제목 영역 -->
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
				<c:forEach var="free" items="${freeList }">
				<div>
					<div class="num">
						<c:out value="${number }" />
						<c:set var="number" value="${number-1 }"></c:set>
					</div>
					<div class="title"><a href="Free_Board.do?free=content&no=${free.no }&pageNo=${currentPage }">${free.title }</a></div>
					<div class="writer">${free.writer }</div>
					<div class="date">${free.regdate }</div>
					<div class="count">${free.readcount }</div>
				</div>
				</c:forEach>
			</c:if>	
			</div>
			<br>
			<form align="center" name="find_frm" method="post" action="Free_Board.do?free=list" onsubmit="return check()">
				<select name="find" size="1">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="find_box" >
				<input type="submit" value="검색">
			</form>
			<div class="board_page">	<!-- 페이지 영역 -->
			<c:if test="${count>0 }">
				<c:set var="imsi" value="${count%pageSize == 0 ? 0:1 }" />
				<c:set var="pageCount" value="${count/pageSize + imsi }" />
				<c:set var="pageBlock" value="${3 }" />
				
				<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock }" integerOnly="true"></fmt:parseNumber>
				<c:set var="startPage" value="${result * pageBlock+1 }" />
				<c:set var="endPage" value="${startPage+pageBlock-1 }" />
				
				<c:if test="${endPage>pageCount }">
					<c:set var="endPage" value="${pageCount }" />
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="${pageContext.request.contextPath}/Sim/Free_Board/Free_Board.do?free=list&pageNo=${startPage-pageBlock+2 }" onclick="frm_sub(${startPage-pageBlock})" class="bt prev"><</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="${pageContext.request.contextPath}/Sim/Free_Board/Free_Board.do?free=list&pageNo=${i }" onclick="frm_sub(${i })" class="num on">${i }</a> 
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="${pageContext.request.contextPath}/Sim/Free_Board/Free_Board.do?free=list&pageNo=${startPage+pageBlock }" onclick="frm_sub(${startPage+pageBlock})" class="bt next">></a>
				</c:if>
			</c:if>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<a href="Free_Board.do?free=write"><input type="button" class="on" value="등록"></a>
			</div>
		</div>
	</div>
</body>
</html>