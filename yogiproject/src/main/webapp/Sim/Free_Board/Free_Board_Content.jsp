<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-내용</title>
<link rel="stylesheet" href="Board.css">
<script type="text/javascript" src="Free_script.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/common/navbar.jsp"></jsp:include>
<!-- 본문 -->
	<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 공지사항) -->
			<strong>자유게시판</strong>
			<p>자유롭게 이용가능한 게시판입니다.</p>
		</div>
		<div class="board_view_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_view">	<!-- 공지글 전체 영역 -->
				<div class="title">		<!-- 글 타이틀 -->
					${free.title }
				</div>
				<div class="info">		<!-- 글 정보 -->
					<dl>
						<dt>번호</dt>
						<dd>${free.no }</dd>
					</dl>
					<input type="hidden" name="no" value="${free.no }">
					<dl>
						<dt>작성자</dt>
						<dd>${free.writer }</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${free.regdate }</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${free.readcount }</dd>
					</dl>
					<dl>
						<dd><input type="image" src="trash_pic/쓰레기통.png" width="15" alt="쓰레기통" align="right" onclick="document.location.href='Free_Board.do?free=delete&no=${no}&pageNo=${pageNo }'"></dd>
					</dl>
				</div>
				<div class="cont">		<!-- 글 내용 -->
					<pre>${free.content }</pre>
				</div> 
				<table>
					<tr>
						<th colspan="2">댓글 목록</th>
					</tr>
					<c:choose>
						<c:when test="${message!=null }">
							<tr>
								<td></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="free" items="replyList">
								<tr>
									<td><font size="3.5"><b>${loginID }</b>
									${ctime }
									</font>
									 <br>${free}
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<form action="Free_Board/Free_Board.do?free=reply" method="post">
				<c:if test="${loginID==null }">
					<div class="comment">
						<p class="comment_cmt">[${free.writer }님의 글에 댓글달기]</p>
							<textarea placeholder="로그인 후 댓글을 작성할 수 있습니다." rows="5" cols="135" name="c_content" readonly></textarea>
					</div>
				</c:if>
				<c:if test="${loginID!=null }">
					<input type="hidden" name="id" value="${loginID }">
					<input type="hidden" name="fno" value="${free.no }">
					<input type="hidden" name="pno" value="${param.no }">
					<div class="comment">
						<p class="comment_cmt">[${free.writer }님의 글에 댓글달기]</p>
							<textarea placeholder="댓글을 입력해주세요." rows="5" cols="135" name="c_content"></textarea>
							<input type="submit" value="댓글달기">
							<p></p>
							<p style="margin-bottom: 10px"></p>
					</div>
				</c:if>
				</form>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="button" class="on" value="목록" onclick="document.location.href='Free_Board.do?free=list'">
				<input type="button" value="수정" onclick="document.location.href='Free_Board.do?free=update&no=${no}&pageNo=${pageNo }'">
			</div>
		</div>
	</div>
</body>
</html>