<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>여행지 조회</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<jsp:include page="/navbar/navbar.jsp"></jsp:include>
	<div class="container">
		<br>
	</div>
	<div class="container">
		<span class="search_head">키워드로 검색</span>&nbsp;
		<form action="" method="GET" class=search_form>
			<input class="form-control" type="text" placeholder="검색어 입력"
				aria-label="default input example"
				style="width: 75%; display: inline;">
			&nbsp;<button class="btn btn-outline-dark" type="submit" id="button-addon2" style="font-size : 1.0rem">검색</button>
		</form>
		<br>
		<span class="search_head">우선순위로 검색</span> <br>
		<form class="search_form">
			<span class="search_sub">비용</span> <select class="form-select"
				style="width: auto; display: inline;">
				<option selected>-</option>
				<option value="1">1순위</option>
				<option value="2">2순위</option>
				<option value="3">3순위</option>
			</select> <span class="search_sub">경치</span> <select class="form-select"
				style="width: auto; display: inline;">
				<option selected>-</option>
				<option value="1">1순위</option>
				<option value="2">2순위</option>
				<option value="3">3순위</option>
			</select> <span class="search_sub">재미</span> <select class="form-select"
				style="width: auto; display: inline;">
				<option selected>-</option>
				<option value="1">1순위</option>
				<option value="2">2순위</option>
				<option value="3">3순위</option>
			</select>
			&nbsp;<button class="btn btn-outline-dark" type="submit" style="font-size : 1.0rem">검색</button>
		</form>
	</div>


	<section class="ftco-section ftco-no-pb goto-here" id="post-section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div id="page-1" class="page one">
						<h2 class="heading">Tourist Attractions</h2>
						<jsp:include page="/search/SearchItem.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

</body>
</html>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
