<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="mem.model.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<c:set var="result" value="${result}"/>

<div align="center">
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>

성공적으로 회원탈퇴 되었습니다. <br><br>
<a href="mem.do?cmd=login">로그인 페이지로 이동</a>
</div>
	

</body>
</html>