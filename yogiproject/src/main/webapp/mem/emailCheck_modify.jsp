<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID Check</title>
<style>
.bt1 {
	height: 30px;
	border-radius: 3px;
	text-align: center;
	overflow: hidden;
	width: 50px;
	color: rgb(255, 255, 255);
	background-color: #2EA26B;
	border: 1px solid #2EA26B;
	text-align: center;
	overflow: hidden;
	width: 50px;
	color: rgb(255, 255, 255);
	background-color: #2EA26B;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>

	<div align="center">
		<br> <b>${email}</b>
		<c:if test="${check2 eq true}">
		는 이미 존재하는 EMAIL입니다.
	</c:if>

		<c:if test="${check2 ne true}">
		는 사용가능합니다.
	</c:if>
		<br> <br>

		<c:if test="${check2 eq true}">
			<a href="#" onclick="checkclose_email_modify();">
				<button class="bt1">확인</button>
			</a>
		</c:if>

		<c:if test="${check2 ne true}">
			<a href="#" onclick="close_email_modify();">
				<button class="bt1">확인</button>
			</a>
		</c:if>

	</div>
<input type="hidden" id="emailinput" value="${email }">
<input type="hidden" id="check2input" value="${check2 }">
</body>
</html>
