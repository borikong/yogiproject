<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/myhistory.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/myhistory.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>
<title>history</title>
</head>
<body>


	<div class="header">
		<div class="htitlebox">
			<a href="${pageContext.request.contextPath}/index.jsp"
				class="textdeco">
				<div class="htitletxt">
					<p>
						닥터멍<br>Dr.Meong
					</p>
				</div>
			</a>
		</div>


		<!--<div class="mask"></div>-->

		<div class="top-right">
			<%
				if (session.getAttribute("id") != null) {
			%>


			<div class="userid">
				<p id="userid"><%=session.getAttribute("id").toString() + "님"%>&nbsp;&nbsp;
				</p>
			</div>

			<div class="row">
				<div class="col three">
					<form action="MemberLogoutAction.me" method="post">
						<input type="submit" value="로그아웃" class="btn btn-sunflower" />
					</form>
				</div>
			</div>




			<%
				} else {
			%>


			<div class="userid"></div>

			<div class="row">
				<div class="col three">

					<a href="member/login_form.jsp" class="btn btn-sunflower">로그인</a>
				</div>
			</div>


			<%
				}
			%>

			<div class="menu">
				<div id="sidebar-toggle">
					<img src="${pageContext.request.contextPath}/image/menu.png"
						width="36" height="25" alt="" />
				</div>
			</div>
		</div>




	</div>

	<!-- End of header -->


	<div id="sidebar">

		<div class="inner-cover">
			<div class="sideimg">
				<img src="${pageContext.request.contextPath}/image/sidebar.png"
					width="318" height="479" alt="" usemap="#menu1" />
			</div>
			<div class="button">
				<div class="logout">

					<a href='#' class="log btn-logout">로그아웃</a>
				</div>
			</div>

		</div>

		<div class="sidebar-inner">

			<div id="sidebar-close"></div>
		</div>

	</div>

	<div id="container">
		<ul class="tabs">
			<li class="active" rel="tab1">병명 조회</li>
			<li rel="tab2">약품 조회</li>
			<li rel="tab3">공지사항</li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<ul>
					<li><a href="#">이것은 두 번째 탭의</a></li>
					<li><a href="#">이것은 두 번째 탭의</a></li>
					<li><a href="#">이것은 두 번째 탭의</a></li>
					<li><a href="#">이것은 두 번째 탭의</a></li>
					<li><a href="#">이것은 두 번째 탭의</a></li>
				</ul>
			</div>
			<!-- #tab1 -->
			<div id="tab2" class="tab_content">2222Mortal Kombat returns
				after a lengthy hiatus and puts players back into the Tournament for
				2D fighting with gruesome combat.</div>
			<!-- #tab2 -->
			<div id="tab3" class="tab_content">3333Halo: Reach is the
				culmination of the superlative combat, sensational multiplayer, and
				seamless online integration that are the hallmarks of this superb
				series.</div>
			<!-- #tab3 -->
		</div>
		<!-- .tab_container -->
	</div>
	<!-- #container -->

	<div class="cover"></div>
	<!-- end of Cover -->

	<map name="menu1">
		<area shape="rect" coords="100,240,233,275" href="chat.jsp">
		<!-- 채팅 -->
		<area shape="rect" coords="100,320,233,355"
			href="${pageContext.request.contextPath}/sidebar/myhistory/myhistory.jsp">
		<!-- 상담내역 -->
		<area shape="rect" coords="100,380,233,410"
			href="${pageContext.request.contextPath}/sidebar/mypage/mypage.jsp">
		<!-- 마이페이지 -->
		<area shape="rect" coords="100,430,233,465"
			href="${pageContext.request.contextPath}/sidebar/setting/setting.jsp">
		<!-- 세팅 -->
	</map>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/myhistory.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>
</html>