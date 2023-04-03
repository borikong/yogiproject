<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-문의내용</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/Board.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/common/navbar.jsp"></jsp:include>
<!-- 본문 -->
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	
	try{
		Inquiry_BoardDAO inquiry_dbPro = Inquiry_BoardDAO.getInstance();
		Inquiry_BoardVO inquiry_board = inquiry_dbPro.getInquiryBoard(no);
		
		int ref = inquiry_board.getRef();
		int step = inquiry_board.getStep();
		int depth = inquiry_board.getDepth();
%>
	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 공지사항) -->
			<strong>문의게시판</strong>
			<p>궁금하신 문의 내용을 작성해 주시면 최대한 빠르게 답변드리도록 노력하겠습니다.</p>
		</div>
		<div class="board_view_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_view">	<!-- 공지글 전체 영역 -->
				<div class="title">		<!-- 글 타이틀 -->
					<%=inquiry_board.getTitle() %>
				</div>
				<div class="info">		<!-- 글 정보 -->
					<dl>
						<dt>번호</dt>
						<dd><%=inquiry_board.getNo() %></dd>
					</dl>
					<dl>
						<dt>작성자</dt>
						<dd><%=inquiry_board.getWriter() %></dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd><%=sdf.format(inquiry_board.getRegdate()) %></dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd><%=inquiry_board.getReadcount() %></dd>
					</dl>
					<dl>
						<dd><input type="image" src="trash_pic/쓰레기통.png" width="15" alt="쓰레기통" align="right" onclick="document.location.href='Inquiry_Board_Delete.jsp?no=<%=inquiry_board.getNo() %>&pageNo=<%=pageNo %>'"></dd>
					</dl>
				</div>
				<div class="cont">		<!-- 글 내용 -->
					<pre><%=inquiry_board.getContent() %></pre>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="button" class="on" value="목록" onclick="document.location.href='Inquiry_Board_List.jsp?pageNo=<%=pageNo %>'">
				<input type="button" value="수정" onclick="document.location.href='Inquiry_Board_Update.jsp?no=<%=inquiry_board.getNo() %>&pageNo=<%=pageNo %>'">
				<input type="button" value="답변" onclick="document.location.href='Inquiry_Board_Write.jsp?no=<%=inquiry_board.getNo() %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">
			</div>
		</div>
		<%}catch(Exception e) {} %>
	</div>
</body>
</html>