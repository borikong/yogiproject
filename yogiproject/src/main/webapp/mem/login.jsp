<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginID" value='<%=(String)session.getAttribute("loginID")%>'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="ect_style.css" rel="stylesheet" type="text/css">

</head>
<body>

<c:choose>
<c:when test="${loginID ne null}">
	<div class="loginok">
	<c:out value="${loginID}"/>님 환영합니다.<br><br>
<%-- 	<jsp:forward page="/index"/>  추후 수정--%>

		<a href="mem.do?cmd=logout" class="button">로그아웃</a>
		<a href="mem.do?cmd=mypage" class="button">마이페이지</a>
		<a href="../search_main/Index.de" class="button">여행지 조회</a>		
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

<form action="mem.do?cmd=loginProc" method="post">
<div class="loginDiv">로그인</div>
<div class="loginDivForm">
	
	<div>
		<input type="text" name="id" value="" placeholder="아이디를 입력해주세요">
	</div>
	
	<div>
		<input type="password" name="pass" value="" placeholder="비밀번호를 입력해주세요">
	</div>
	
	<div class="idpw">
		<a>아이디 찾기</a>
		<span class="spanBorder">|</span>
		<a>비밀번호 찾기</a>
	</div>
	
	<div>
		<input class="bt1" type="submit" value="로그인">
	</div>
	
	<div>
		<input class="bt2" type="button" value="회원가입" onclick="javascript:window.location='?cmd=regForm'">
	</div>
		
</div>

</form>
</c:otherwise>
</c:choose>

</body>
</html>