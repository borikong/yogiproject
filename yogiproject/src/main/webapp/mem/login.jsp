<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/ect_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<jsp:include page="/common/navbar.jsp"></jsp:include>
	<c:choose>
		<c:when test="${loginID ne null}">
			<div class="loginok">
				<h2>♥ ${loginID}님 환영합니다. ♥</h2>
				<br> <br> <a
					href="${pageContext.request.contextPath}/Index.de" class="button">메인
					페이지로 이동</a>
			</div>
		</c:when>

		<c:otherwise>
			<c:if test="${requestScope.check eq 0}">
				<script type="text/javascript">
					alert('비밀번호가 틀렸습니다.');
				</script>
			</c:if>

			<c:if test="${requestScope.check eq -1}">
				<script type="text/javascript">
					alert('아이디가 존재하지 않습니다.')
				</script>
			</c:if>

			<form action="mem.me?cmd=loginProc" method="post">
				<div class="loginDiv">로그인</div>
				<div class="loginDivForm">

					<div>
						<input type="text" name="id" value="" placeholder="아이디를 입력해주세요">
					</div>

					<div>
						<input type="password" name="pass" value=""
							placeholder="비밀번호를 입력해주세요">
					</div>

					<div class="idpw">
						<a class="searchdeco" href="" onclick="searchIdPrompt();">아이디
							찾기</a> <span class="spanBorder">|</span> <a class="searchdeco"
							href="" onclick="searchPwPrompt();">비밀번호 찾기</a>
					</div>

					<div>
						<input class="bt1" type="submit" value="로그인">
					</div>

					<div>
						<input class="bt2" type="button" value="회원가입"
							onclick="javascript:window.location='member.me?cmd=regForm'">
					</div>

				</div>

			</form>
		</c:otherwise>
	</c:choose>

</body>
</html>