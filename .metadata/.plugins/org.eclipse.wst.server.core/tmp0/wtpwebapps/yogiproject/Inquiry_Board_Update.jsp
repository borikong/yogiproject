<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-문의작성</title>

</head>
<body>
<%int no=1; %>

		<form action="Inquiry_Board_Update_Form.jsp?pageNo=1" method="post" name="writeForm" >
		<input type="hidden" name="no" value="<%=no%>" />
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write">	<!-- 문의게시판 전체 영역 -->
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" placeholder="제목 입력" name="title">
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>test</dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd><input type="password" placeholder="비밀번호 입력" name="pass"></dd>
					</dl>
				</div>
				<div class="cont">
					<textarea placeholder="내용 입력" name="content"></textarea>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="submit" value="등록" class="on">
				<input type="button" value="취소" onclick="document.location.href='Inquiry_Board_List.jsp?pageNo=1'">
			</div>
		</div>
		</form>
	</div>
</body>
</html>