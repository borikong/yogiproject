<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginID" value='<%=(String)session.getAttribute("loginID")%>'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="mypage.css" rel="stylesheet" type="text/css">
<link href="ect_style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function begin() {
	document.myForm.pass.focus();
}

function checkIt(){
	if(!document.myForm.pass.value){
		alert("비밀번호를 입력하지 않았습니다.");
		document.myForm.pass.focus();
		return false;
	}
}
</script>
</head>
<body onload="begin()">
<jsp:include page="../search_main/navbar/navbar.jsp" />

<c:choose>
<c:when test="${loginID ne null}">

	<div class="mp-in">
		<c:out value="${loginID}"/>님 환영합니다.
		<a href="mem.do?cmd=logout">로그아웃</a>
	</div>

<div class="mypage">

		<div class="mp_left">
			<div class="left-header">마이페이지</div>
			<ul>
				<li>
					<a class="mp-a" href="mem.do?cmd=mypage">찜리스트<span class="mp_span">&gt;</span></a>
				</li>

				<li>
					<a class="mp-a" href="mem.do?cmd=modifyForm">정보수정<span class="mp_span">&gt;</span></a>
				</li>

				<li>
					<a class="active mp-a" href="deleteForm.jsp">회원탈퇴<span class="mp_span">&gt;</span></a>
				</li>
			</ul>

			<a class="left-a" href="#">
				<div class="left-bottom">
					<span>도움이 필요하신가요 ?</span>
					<span class="left-s">문의하기</span>
				</div>
			</a>
		</div>
		
		<div class="mp_right">
			<div class="right-header">
				<h2>회원탈퇴</h2>
			</div>

			<div class="r-border"></div>
			<br><br><br>
			<!-- 탈퇴 -->
			<form action="member.do?cmd=deleteProc" name="myForm" method="post"
				onsubmit="return checkIt()">


				<div class="loginDivForm">

					<div>
						<input type="text" name="pass" value="" placeholder="비밀번호를 입력해주세요">
					</div>


					<div>
						<input class="bt3" type="submit" value="회원탈퇴"> <input
							class="bt3" type="button" value="취소"
							onclick="javascript:window.location.href='member.do?cmd=login'">
					</div>

				</div>

			</form>

		</div>

	</div>

</c:when>
</c:choose>
</body>
</html>