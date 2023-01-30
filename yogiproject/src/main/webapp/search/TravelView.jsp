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
<link href="../css/search_main.css" rel="stylesheet">
<link rel="stylesheet" href="../css/style2.css">
<link rel="stylesheet" href="../css/animate.css">

<title>여행지 상세</title>
</head>
<body>

	<div>
		<jsp:include page="/navbar/navbar.jsp"></jsp:include>

		<hr class="deep_hr">
		<div class="container">

			<h3 class="view_lable">
				<span class="rgyBadge" style="font-size: 1.1rem">일본</span> <span
					id="dest_name">후지산</span>
			</h3>
			<img src="img/mountfuji.jpg" class="img-thumbnail" alt="...">
			<p class="col-md-8 fs-4" id="dest_intro">Using a series of
				utilities, you can create this jumbotron, just like the one in
				previous versions of Bootstrap. Check out the examples below for how
				you can remix and restyle it to your liking.</p>
			<h3 class="view_lable">
				여행지 평점&nbsp;<span class="tooltip_custom">?<span class="tooltip-content_custom">사용자 리뷰를 분석하여 예측한 평점입니다.
				</span></span>
			</h3>
			<jsp:include page="/search/pgbar.jsp"></jsp:include>

			<br>
			<h3 class="view_lable">여행지 태그&nbsp;<span class="tooltip_custom">?<span class="tooltip-content_custom">사용자 리뷰에서 자동으로 추출한 태그입니다.
				</span></span></h3>
			<p class="col-md-8 fs-4">#고요 #경치 #대표 #겨울</p>
		</div>


	</div>
	
	
	
</body>
</html>
