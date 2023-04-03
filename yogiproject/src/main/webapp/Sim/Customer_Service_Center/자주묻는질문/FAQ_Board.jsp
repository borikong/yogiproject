<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.notice.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-자주묻는질문</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/Board.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/Sim/Header/Header.js" defer></script> <!-- defer을 넣지 않으면 밑에 있는 자료들이 다 실행될 때까지 html이 브라우저에 표시되지 않음 -->
</head>
<body>
<jsp:include page="/common/navbar.jsp"></jsp:include>
	
<!-- 본문 -->	
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>자주묻는질문</strong>
			<p>자주 묻는 질문들을 확인해 보세요.</p>
		</div>
		<div class="board_write1">	<!-- 리스트 영역 --> </div>
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
				<img alt="자주묻는질문" src="${pageContext.request.contextPath}/Sim/Customer_Service_Center/자주묻는질문/pic/요기조기_자주묻는_질문.png" width="1000" height="1200">
				<div class="board_write1">	<!-- 리스트 영역 --> </div>
		</div>
	</div>
</body>
</html>