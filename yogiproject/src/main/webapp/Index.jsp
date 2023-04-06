<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행은 요기조기-메인페이지</title>
<!-- 헤더라인 -->


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap"
	rel="stylesheet">

<script src="https://kit.fontawesome.com/3e7bdacc74.js"
	crossorigin="anonymous"></script>


<!-- 배너라인 -->
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Sim/Banner/Banner.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>


</head>
<body>
	<jsp:include page="/common/navbar.jsp"></jsp:include>

	<!-- 배너 -->
	<div class="carousel" style="position: relative; z-index: 1;"
		data-flickity='{"autoPlay": 5000, "wrapAround": true, "selectedAttraction": 0.01, "friction": 0.15 }'>
		<!-- 스크립트 불러와서 그 안에 있는 값 사용(자동재생 5초에 1회, 반복 true) -->
		<div class="carousel-cell"
			style="background-image: url(${pageContext.request.contextPath}/Sim/Banner/Banner_pic/00001.png)"></div>
		<div class="carousel-cell"
			style="background-image: url(${pageContext.request.contextPath}/Sim/Banner/Banner_pic/00002.png)"></div>
		<div class="carousel-cell"
			style="background-image: url(${pageContext.request.contextPath}/Sim/Banner/Banner_pic/00003.png)"></div>
	</div>


<br><br><br><br><br>

<div align="center">
<div>
	
	<jsp:include page="/common/popular_sub.jsp" />
	</div>
</div>
<br><br><br><br><br>
<jsp:include page="/common/footer.jsp"></jsp:include>


</body>
</html>