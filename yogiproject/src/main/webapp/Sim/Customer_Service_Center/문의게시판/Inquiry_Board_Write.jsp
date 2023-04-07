<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-문의작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/Board.css">
<script type="text/javascript" src="Inquiry_script.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	int no=0, ref=1, step=0, depth=0;
	try{
		if(request.getParameter("no")!=null){
			no	= Integer.parseInt(request.getParameter("no"));
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			depth = Integer.parseInt(request.getParameter("depth"));
		}	
%>

<jsp:include page="/common/navbar.jsp"></jsp:include>
	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>문의게시판</strong>
			<p>궁금하신 문의 내용을 작성해 주시면 최대한 빠르게 답변드리도록 노력하겠습니다.</p>
		</div>
		<form action="Inquiry_Board_Form.jsp" method="post" name="writeForm" onsubmit="return writeSave()">
		
		<input type="hidden" name="no" value="${free.no }">
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="step" value="<%=step %>">
		<input type="hidden" name="dept" value="<%=depth %>">
		
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write">	<!-- 문의게시판 전체 영역 -->
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
						<% if(request.getParameter("no")==null) {%>
							<input type="text" placeholder="제목 입력" name="title" >
						<%}else{ %>
							<input type="text" placeholder="제목 입력" name="title" value="[<%=request.getParameter("titlep")%>의 글에 대한 답변]  " >
						<%} %>
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd><input type="text" placeholder="작성자 입력" name="writer"  value="${loginID eq null?'':loginID }"></dd>
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
				<input type="button" value="취소" onclick="javascript:window.location='Inquiry_Board_List.jsp'">
			</div>
		</div>
		</form>
	</div>
	<%}catch(Exception e){} %>
</body>
</html>