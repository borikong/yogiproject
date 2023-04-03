<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더라인 -->

<script src="${pageContext.request.contextPath}/common/Header.js" defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/Header.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Kiwi+Maru&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Kiwi+Maru&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/3e7bdacc74.js"
	crossorigin="anonymous"></script>

<!-- 헤더 -->
<% 
	String id = null; 
	if(session.getAttribute("loginID")!=null){
		id = (String)session.getAttribute("loginID");
	}
%>
	<div class="nav_menu" style="position: relative; z-index: 3;">
		<ul style="list-style-type: none">
		<%
			if(id==null){
		%>
			<li style="display: inline"><a href="${pageContext.request.contextPath}/mem/login.jsp">로그인</a></li>
			<li style="display: inline"><a href="${pageContext.request.contextPath}/mem/mem.me?cmd=regForm">회원가입</a></li>
		<% 
			}else{
		%>
			<li style="display: inline">${loginID } 님 어서오세요</li>
			<li style="display: inline"><a href="${pageContext.request.contextPath}/mem/mem.me?cmd=mypage">마이페이지</a></li>
			<li style="display: inline"><a href="${pageContext.request.contextPath}/mem/mem.me?cmd=logout">로그아웃</a></li>
		<%} %>
		</ul>
	</div>
	<nav class="navbar_yogi">			<!-- 헤드바  -->
		<div class="navbar_logo">							<!-- 로고 -->
			<i class="bi bi-globe-central-south-asia"></i>	<!-- 로고 아이콘 -->
			<a href="${pageContext.request.contextPath}/Sim/All/YOGIZOGI.jsp">요기조기</a>							<!-- 로고 눌렀을 때 사이트로 이동 -->
		</div>
	
<!-- 		<div class="search_box">	검색창 -->
<!-- 			<input class="search_txt" type="text" name="" placeholder="검색...">	text형식으로 비어있을 땐 검색...보이게 설정 -->
<!-- 			<a class="search_btn" href="#"> -->
<!-- 				<i class="bi bi-search"></i> -->
<!-- 			</a> -->
<!-- 		</div> -->
	
		<ul class="navbar_menu">	<!-- 메뉴 -->
			<li><a href="${pageContext.request.contextPath}/search_main/index.jsp">여행지탐색</a></li>
			<li><a href="${pageContext.request.contextPath}/Sim/Free_Board/Free_Board_List.do?free=list">요기커뮤니티</a></li>
			<li>
				<a href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/공지사항/Notice_Board_List.jsp">고객센터</a>
					<ul class="drop_menu3">
						<li><a class="nav_a" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/공지사항/Notice_Board_List.jsp">공지사항</a></li>
						<li><a class="nav_a" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/자주묻는질문/FAQ_Board.jsp">자주묻는질문</a></li>
						<li><a class="nav_a" href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/문의게시판/Inquiry_Board_List.jsp">문의게시판</a></li>
					</ul>
				
			</li>
		</ul>
		
		<a href="#" class="navbar_toggleBtn"> <!-- 화면 작을 때의 토글바 --> <!-- href에 #을 넣지 않으면 계속 창이 다시 열리게되니 주의 -->
			<i class="bi bi-list"></i>
		</a>
	</nav>
	