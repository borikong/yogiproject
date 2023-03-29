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
	border-radius: 3px; text-align : center; overflow : hidden; width :
	50px; color : rgb( 255, 255, 255); background-color : #2EA26B;
	border: 1px solid #2EA26B;
	text-align: center;
	overflow: hidden;
	width: 50px;
	color: rgb(255, 255, 255);
	background-color: #2EA26B;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<div align="center">
		<br> <b>${id}</b>
		<c:if test="${check eq true}">
		는 이미 존재하는 ID입니다.
	</c:if>

		<c:if test="${check ne true}">
		는 사용가능합니다.
	</c:if>
		<br> <br>

	<c:if test="${check eq true}">
		<a href="#" onclick="checkclose();">
			<button class="bt1">확인</button>
		</a>
	</c:if>

	<c:if test="${check ne true}">
		<a href="#" onclick="javascript:window.close();">
				<button class="bt1">확인</button>
		</a>
	</c:if>

	</div>

</body>
</html>
