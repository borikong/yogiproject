<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageNo = request.getParameter("pageNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../Board.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function deleteSave(){
	if(document.delForm.pass.value=""){
		alert("비밀번호를 입력해주세요.");
		document.delForm.pass.focus;
	return false;
	}
}
</script>
</head>
<body>
<div class="board_wrap" style="position: relative; z-index: 1;">			<!-- 전체를 감싸고 있는 div 생성 -->
		<div class="board_title">		<!-- 보드의 타이틀(ex. 문의게시판) -->
			<strong>문의게시판</strong>
			<p>궁금하신 문의 내용을 작성해 주시면 최대한 빠르게 답변드리도록 노력하겠습니다.</p>
		</div>
		<form action="Inquiry_Board_Delete.jsp?pageNo=<%=pageNo %>" method="post" name="delForm" onsubmit="return deleteSave()">
		
		<div class="board_write_wrap">	<!-- 타이틀 아래 영역(리스트, 페이지, 버튼) -->
			<div class="board_write">	<!-- 문의게시판 전체 영역 -->
				<div class="title">
					<dl>
						<dt>비밀번호 : </dt>
						<dd>
							<input type="password" placeholder="비밀번호 입력" name="pass">
						</dd>
					</dl>
				</div>
			</div>
			<div class="bt_wrap">		<!-- 버튼 영역 -->
				<input type="submit" value="삭제" class="on">
				<input type="button" value="취소" onclick="document.location.href='Inquiry_Board_List.jsp?pageNo=<%=pageNo %>'">
			</div>
		</div>
		</form>
</div>
	
</body>
</html>