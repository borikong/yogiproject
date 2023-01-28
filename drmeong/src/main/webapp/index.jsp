<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<title>Dr.Meong</title>
<link href="css/front.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/login.js"></script>


</head>

<body>

	<div class="header">
		<div class="htitlebox">
			<a href="index.jsp" class="textdeco">
				<div class="htitletxt">
					<p>
						닥터멍<br>Dr.Meong
					</p>
				</div>
			</a>
		</div>


		<!--<div class="mask"></div>-->

		<%!String id;%>
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
						<input type="submit" value="로그아웃" class="btn3 btn-sunflower" />
					</form>
				</div>
			</div>




			<%
				} else {
			%>


			<div class="userid"></div>

			<div class="row">
				<div class="col three">

					<a href="member/login_form.jsp" class="btn3 btn-sunflower">로그인</a>
				</div>
			</div>


			<%
				}
			%>

			<!-- google 번역

			<div id="google_translate_element"></div>
			<script type="text/javascript">
				function googleTranslateElementInit() {
					new google.translate.TranslateElement(
							{
								pageLanguage : 'ko',
								layout : google.translate.TranslateElement.InlineLayout.SIMPLE
							}, 'google_translate_element');
				}
			</script>
			<script type="text/javascript"
				src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
		
			 -->

			<div class="menu">
				<div id="sidebar-toggle">
					<img src="image/menu.png" width="36" height="25" alt="" />
				</div>
			</div>
		</div>




	</div>

	<!-- End of header -->


	<div id="sidebar">

		<div class="inner-cover">
			<div class="sideimg">
				<img src="image/sidebar.png" width="318" height="479" alt=""
					usemap="#menu1" />
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

	<div class="container">


		<div class="container-inner">

			<div class="content">

				<div class="titlebox">
					<div class="titletxt">
						<p>
							닥터멍<br>Dr.Meong
						</p>
					</div>
				</div>

				<div class="article">안녕하세요? 최초의 인공지능 반려견 질병상담 챗봇 입니다. 증상을 입력하여
					편리하게 강아지 질병을 검색할 수 있습니다. 지금닥터멍으로 인공지능 채팅을시작해 보세요!</div>

				<div class="enter">
					<a href="chat.jsp"><input type="button" value="채팅 시작하기 "
						class="btn2 btn2-sunflower" ></a>
				</div>

			</div>


		</div>


		<div class="cover"></div>

		<map name="menu1">
			<area shape="rect" coords="100,240,233,275" href="chat.jsp">
			<!-- 채팅 -->
			<area shape="rect" coords="100,320,233,355"
				href="${pageContext.request.contextPath}/sidebar/myhistory/myhistory.jsp">
			<!-- 상담내역 -->
			<area type="button" coords="100,380,233,410"
				href="${pageContext.request.contextPath}/sidebar/mypage/mypage.jsp">
			<!-- 마이페이지 -->
			<area shape="rect" coords="100,430,233,465"
				href="${pageContext.request.contextPath}/sidebar/setting/setting.jsp">
			<!-- 세팅 -->
		</map>
	
		
		
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>

</html>
