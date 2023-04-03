<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-작성</title>
<script type="text/javascript" src="Free_script.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Sim/Free_Board/Board.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"></jsp:include>

	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>자유게시판</strong>
			<p>자유롭게 이용가능한 게시판입니다.</p>
		</div>
		<form action="Free_Board/Free_Board.do?free=writeProc" method="post" name="writeForm" onsubmit="return writeSave()">
		
		<input type="hidden" name="no" value="${no }">
		<input type="hidden" name="ref" value="${ref }">
		<input type="hidden" name="step" value="${step }">
		<input type="hidden" name="depth" value="${depth }">
		
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write">	<!-- 문의게시판 전체 영역 -->
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
						<c:if test="${no==0 }">
							<input type="text" placeholder="제목 입력" name="title" >
						</c:if>
						<c:if test="${no!=0 }">
							<input type="text" placeholder="제목 입력" name="title" value="[답변] " >
						</c:if>
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd><input type="text" placeholder="작성자 입력" name="writer" ></dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd><input type="password" placeholder="비밀번호 입력" name="pass"></dd>
					</dl>
				</div>
				<div class="cont">
					<textarea placeholder="내용 입력" name="content" ></textarea>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="submit" value="등록" class="on">
				<input type="button" value="취소" onclick="javascript:window.location='?free=list'">
			</div>
		</div>
		</form>
	</div>
</body>
</html>