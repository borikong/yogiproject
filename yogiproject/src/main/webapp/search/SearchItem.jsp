<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include 하는 페이지 기준으로 경로를 설정해 주어야 함!! -->
<link rel="stylesheet" href="search/css/style2.css">
<link rel="stylesheet" href="search/css/animate.css">
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
			onMouseout="this.style.color='black';" style="cursor: pointer"
			id="dest_name">
			<span class="rgyBadge"
				style="font-size: 1.1rem">일본</span>&nbsp;후지산&nbsp;&nbsp;<span
				class="date" id="name_eng">Mountain Fuji</span>
		</h2>

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

<script src="search/js/jquery.min.js"></script>
<script src="search/js/jquery-migrate-3.0.1.min.js"></script>
<script src="search/js/popper.min.js"></script>
<script src="search/js/bootstrap.min.js"></script>
<script src="search/js/jquery.easing.1.3.js"></script>
<script src="search/js/jquery.waypoints.min.js"></script>
<script src="search/js/jquery.stellar.min.js"></script>
<script src="search/js/owl.carousel.min.js"></script>
<script src="search/js/jquery.magnific-popup.min.js"></script>
<script src="search/js/aos.js"></script>
<script src="search/js/jquery.animateNumber.min.js"></script>
<script src="search/js/scrollax.min.js"></script>
<script src="search/js/main.js"></script>