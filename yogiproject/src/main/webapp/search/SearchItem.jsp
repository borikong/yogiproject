<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include 하는 페이지 기준으로 경로를 설정해 주어야 함!! -->
<!-- <link rel="stylesheet" href="search/css/style2.css"> -->
<!-- <link rel="stylesheet" href="search/css/animate.css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<%
for (int i = 0; i < 5; i++) {
%>


<div class="resume-wrap d-flex ftco-animate">
	<div class="text pl-3">
		<img src="search/img/mountfuji.jpg" class="rounded float-start"
			alt="fugi" id="dest_img">
		<h2 onclick="location.href='search/TravelView.jsp'"
			onMouseover="this.style.color='#3e64ff';"
			onMouseout="this.style.color='black';" style="cursor: pointer;"
			id="dest_name">
			<span class="rgyBadge" style="font-size: 1.1rem">일본</span>&nbsp;후지산&nbsp;&nbsp;<span
				class="date" id="name_eng">Mountain Fuji</span>
		</h2>


		<div>
			<span class="position" id="country">찜</span> 
			
			
			<a href="javascript:;"
				class="icon2 heart" style="background-color: rgba(255, 255, 255, 0.8);   position: absolute; top: 15px; left : 32px; border-radius : 15px;">&nbsp;&nbsp;<img
				src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
				alt="찜하기">&nbsp;&nbsp;</a>
	
	
	
	
		</div>

		<jsp:include page="/search/pgbar.jsp"></jsp:include>
		<p id="content_preview">Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.</p>
	</div>
</div>


<%
}
%>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="js/main.js"></script>
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

