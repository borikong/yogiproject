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
<link href="${pageContext.request.contextPath}/search_main/css/search_main.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/search_main/css/style2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/search_main/css/animate.css">

<title>여행지 조회</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<a name="header"></a>
	<jsp:include page="/common/navbar.jsp"></jsp:include>
	<br>
	<br>
	<div class="container">
		<span class="search_head">키워드로 검색</span>&nbsp;

		<form action="GetDestinationList.de" method="post" class="search_form">
			<select class="form-select"
				name="condition" style="width: auto; display: inline;">
				<option value="관광지" ${condition eq '관광지' ?"selected='selected'":'null'}>관광지</option>
				<option value="나라" ${condition eq '나라' ?"selected='selected'":'null'}>나라</option>
			</select>
		
			<input class="form-control" type="text" name="keyword"
				placeholder="검색어 입력" aria-label="default input example"
				style="width: 75%; display: inline;"> &nbsp; <input
				class="btn btn-outline-dark" type="submit" id="button-addon2"
				value="검색">
				<input
				class="btn btn-outline-dark" type="submit" id="button-addon2"
				value="전체">
				
		</form>


		<br> <span class="search_head">우선순위로 검색&nbsp;<span
			class="tooltip_custom">?<span class="tooltip-content_custom">각
					속성의 우선순위에 따라 가중치를 반영하여 검색합니다. </span></span></span> <br>

		<form action="GetPriorityList.de" method="get" class="search_form" name="priorityform">
			<span class="search_sub">비용</span> <select class="form-select"
				name="money" style="width: auto; display: inline;">
				<option ${money_pri eq 0 ?"selected='selected'":'null'}>-</option>
				<option value="1" ${money_pri eq 1 ?"selected='selected'":'null'}>1순위</option>
				<option value="2" ${money_pri eq 2 ?"selected='selected'":'null'}>2순위</option>
				<option value="3" ${money_pri eq 3 ?"selected='selected'":'null'}>3순위</option>
			</select> <span class="search_sub">경치</span> <select class="form-select"
				name="landscape" style="width: auto; display: inline;">
				<option ${land_pri eq 0 ?"selected='selected'":'null'}>-</option>
				<option value="1" ${land_pri eq 1 ?"selected='selected'":'null'}>1순위</option>
				<option value="2" ${land_pri eq 2 ?"selected='selected'":'null'}>2순위</option>
				<option value="3" ${land_pri eq 3 ?"selected='selected'":'null'}>3순위</option>
			</select> <span class="search_sub">재미</span> <select class="form-select"
				name="fun" style="width: auto; display: inline;">
				<option ${fun_pri eq 0 ?"selected='selected'":'null'}>-</option>
				<option value="1" ${fun_pri eq 1 ?"selected='selected'":'null'}>1순위</option>
				<option value="2" ${fun_pri eq 2 ?"selected='selected'":'null'}>2순위</option>
				<option value="3" ${fun_pri eq 3 ?"selected='selected'":'null'}>3순위</option>
			</select> &nbsp;
			<button class="btn btn-outline-dark" type="submit">검색</button>
		</form>

		<br> <span class="search_head">나만의 추천 여행지 리스트!&nbsp;<span
			class="tooltip_custom">?<span class="tooltip-content_custom">
					비슷한 사용자 데이터를 토대로 여행지를 추천해드립니다. </span></span></span> <br>
					
		
		<form action="RecommandList.de" method="get" class="search_form">
			<button class="btn btn-outline-dark" type="submit">추천 리스트 보기</button>
		</form>
		
		
	</div>
	<br>
	<br>

	<div class="container">
		<h2 class="heading">Tourist Attractions</h2>
		<jsp:include page="/search_main/search/SearchItem.jsp"></jsp:include>
	</div>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" /> 
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /> 
		</svg>
	</div>
	
	<jsp:include page="/common/footer.jsp"></jsp:include>

	<div style="position:fixed; bottom:50px; right:100px;">
		<a href="#header"><img src="pic/top.png" width="64px"></a>
	</div>
</body>
</html>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous" />

