<%@page import="net.dest.db.DestVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<Strong>홍길동 님을 위한 여행지 추천 리스트!</Strong>
		</h2>
		<p class="fs-5">[사용자명]님과 비슷한 사용자 데이터를 토대로 추천해 드려요</p>

		<%
		Vector<DestVO> volist=(Vector<DestVO>)request.getAttribute("volist");
		for (int j = 0; j < volist.size(); j++) {
			DestVO vo=volist.get(j);
		%>

		<div class="card">
			<div class="card-body">
				<img src="<%=vo.getDEST_IMG()%>" class="card-img-top float-start" id="detail_img" alt="...">
				<h5 class="card-title">
					<span class="rgyBadge" ><%=vo.getDEST_COUNTRY() %></span>&nbsp;&nbsp;<strong><%=vo.getDEST_NAME() %></strong>
				</h5>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
				<div>
					<span class="position">비용</span>
					<progress value="<%=vo.getDEST_MONEY() * 100%>" max="100" id="pg"></progress>
				</div>
				<div>
					<span class="position">경치</span>
					<progress value="<%=vo.getDEST_LANDSCAPE() * 100%>" max="100"
						id="pg"></progress>
				</div>
				<div>
					<span class="position">재미</span>
					<progress value="<%=vo.getDEST_FUN() * 100%>" max="100" id="pg"></progress>
				</div>
<!-- 				<a href="#" class="btn btn-primary">Show Details</a> -->
			</div>
		</div>

		<br>
		<%
		}
		%>
	</div>

</body>
</html>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
