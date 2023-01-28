<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#pg {
	height: 50px
}
</style>
<img src="/search/img/fugimountain.png">

<div class="container-fluid py-5">
	<div class="container">
		<h1 class="display-5 fw-bold">
			<span class="badge text-bg-primary">Japan</span> <span id="dest_name">후지산</span>
		</h1>
		<p class="col-md-8 fs-4" id="dest_intro">Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.</p>
		<h1 class="display-5 fw-bold">여행지 평점</h1>
		<p class="col-md-8 fs-4">비용</p>
		<div>
			<progress value="50" max="100" id="pg"></progress>
		</div>
		<p class="col-md-8 fs-4">경치</p>
		<div>
			<progress value="50" max="100" id="pg"></progress>
		</div>
		<p class="col-md-8 fs-4">재미</p>
		<div>
			<progress value="50" max="100" id="pg"></progress>
		</div>

		<h1 class="display-5 fw-bold">여행지 태그</h1>
		<p class="col-md-8 fs-4">#고요 #경치 #대표 #겨울</p>
	</div>
</div>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="css/animate.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
