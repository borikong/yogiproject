<%@page import="net.dest.db.DestVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link href="css/search_main.css" rel="stylesheet">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="css/animate.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<title>여행지 추천</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<jsp:include page="/navbar/navbar.jsp"></jsp:include>

	<div class="container">

		<h2>
			<Strong>♥ ${loginID}님을 위한 여행지 추천 리스트! ♥</Strong>
		</h2>
		<p class="fs-5">▶ ${loginID}님과 비슷한 사용자 데이터를 토대로 추천해 드려요</p>

		<c:if test="${mode eq 0}">
			<c:forEach var="vo" items="${volist }">
				<form action="GetDestDetailView.de" method="post"
					id="viewForm${vo.getDEST_NAME()}">
					<input type="hidden" name="dest_name" value="${vo.getDEST_NAME()}">
					<div class="card"
						onclick="document.getElementById('viewForm${vo.getDEST_NAME()}').submit()">
						<div class="card-body">
							<img src="${vo.getDEST_IMG()}" class="card-img-top float-start"
								id="recommand_img" alt="${vo.getDEST_COUNTRY()}">
							<h5 class="card-title">
								<span class="rgyBadge">${vo.getDEST_COUNTRY()}</span>&nbsp;&nbsp;<strong>${vo.getDEST_NAME()}</strong>
							</h5>
							<p class="card-text">${vo.getDEST_SUMMARY()}...</p>
							<div>
								<span class="position">비용</span>
								<progress value="${vo.getDEST_MONEY() * 100}" max="100" id="pg"></progress>
							</div>
							<div>
								<span class="position">경치</span>
								<progress value="${vo.getDEST_LANDSCAPE() * 100}" max="100"
									id="pg"></progress>
							</div>
							<div>
								<span class="position">재미</span>
								<progress value="${vo.getDEST_FUN() * 100}" max="100" id="pg"></progress>
							</div>
							<!-- 				<a href="#" class="btn btn-primary">Show Details</a> -->
						</div>
					</div>
				</form>

				<br>
			</c:forEach>

		</c:if>

		<!-- 	로그인 필요 -->
		<c:if test="${mode eq 1}">
			<p>Login이 필요한 서비스입니다.</p>
			<a href="#">로그인 페이지로 이동</a>
		</c:if>

		<!-- 	찜한 리스트 없음 -->
		<c:if test="${mode eq 2}">
			<p>찜한 리스트가 없습니다. 최소 5개 이상의 찜 리스트를 만들어 주세요.</p>
		</c:if>
	</div>



</body>
</html>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>