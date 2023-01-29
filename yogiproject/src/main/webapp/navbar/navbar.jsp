<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더라인 -->
<link rel="stylesheet" href="css/Header.css" />
<script src="js/Header.js" defer></script>
<link rel="stylesheet" href="../css/Header.css" />
<script src="../js/Header.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js" crossorigin="anonymous"></script>

<!-- 헤더 -->
<!-- nav_menu로 이름 수정하고 a태그에 nav_a 클래스 추가, css파일변경 -->
	<div class="nav_menu">
		<ul style="list-style-type: none">
			<li style="display: inline"><a class="nav_a" href="">로그인</a></li>
			<li style="display: inline"><a class="nav_a" href="">회원가입</a></li>
			<li style="display: inline"><a class="nav_a" href="">마이페이지</a></li>
		</ul>
	</div>
	<nav class="navbar_yogi">			<!-- 헤드바  -->
		<div class="navbar_logo">							<!-- 로고 -->
			<i class="bi bi-globe-central-south-asia"></i>	<!-- 로고 아이콘 -->
			<a href="">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
		</div>
	
		<div class="search_box">	<!-- 검색창 -->
			<input class="search_txt" type="text" name="" placeholder="검색...">	<!-- text형식으로 비어있을 땐 검색...보이게 설정 -->
			<a class="search_btn" href="#">
				<i class="bi bi-search"></i>
			</a>
		</div>
	
		<ul class="navbar_menu">	<!-- 메뉴 -->
			<li><a class="nav_a" href="">요기커뮤니티</a></li>
			<li><a class="nav_a" href="">여행지탐색</a></li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>