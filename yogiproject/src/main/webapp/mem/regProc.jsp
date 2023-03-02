<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>

<c:set var="flag" value="${flag}"/>

<br>
<div align="center">
<c:choose>
	<c:when test="${flag}">
		<b>회원가입을 진심으로 축하 드립니다.</b>
		<a href='member.do?cmd=login'>로그인</a>
	</c:when>
	
	<c:otherwise>
		<b>다시 입력하여 주십시요.</b>
		<a href='member.do?cmd=regForm'>다시 가입</a>
	</c:otherwise>
</c:choose>
</div>

</body>
</html>