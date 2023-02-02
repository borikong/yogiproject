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
			<div>


				<div>

					<a href="javascript:;" class="icon2 heart"
						style="background-color: rgba(255, 255, 255, 0.8); position: absolute; top: 220px; left: 150px; border-radius: 15px;">&nbsp;&nbsp;<img
						src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
						alt="찜하기">&nbsp;&nbsp;
					</a>

				</div>

			</div>
			<p class="col-md-8 fs-4" id="dest_intro">Using a series of
				utilities, you can create this jumbotron, just like the one in
				previous versions of Bootstrap. Check out the examples below for how
				you can remix and restyle it to your liking.</p>
			<h3 class="view_lable">
				여행지 평점&nbsp;<span class="tooltip_custom">?<span
					class="tooltip-content_custom">사용자 리뷰를 분석하여 예측한 평점입니다. </span></span>
			</h3>
			<jsp:include page="/search/pgbar.jsp"></jsp:include>

			<br>
			<h3 class="view_lable">
				여행지 태그&nbsp;<span class="tooltip_custom">?<span
					class="tooltip-content_custom">사용자 리뷰에서 자동으로 추출한 태그입니다. </span></span>
			</h3>
			<p class="col-md-8 fs-4">#가족 #깔끔하다 #신비하다 #녹지 #소나무</p>
		</div>


	</div>



</body>
</html>
<script>
	$(function() {
		var $likeBtn = $('.icon2.heart');

		$likeBtn
				.click(function() {
					$likeBtn.toggleClass('active');

					if ($likeBtn.hasClass('active')) {
						$(this)
								.find('img')
								.attr(
										{
											'src' : 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
											alt : '찜하기 완료'
										});

					} else {
						$(this).find('i').removeClass('fas').addClass('far')
						$(this)
								.find('img')
								.attr(
										{
											'src' : 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
											alt : "찜하기"
										})
					}
				})
	})
</script>