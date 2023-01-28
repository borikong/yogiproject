<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<title>chat</title>
<link href="css/chat_css.css?ver=2" rel="stylesheet" type="text/css">
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

				<div class="article">

					<!-- <iframe src='https://webchat.botframework.com/embed/doctormeong?s=cD1KYcS6EVI.cwA.guk.kJsEg0HZGxIySmjgySKxYVx6lcJ44cAtKP7kEkDqSLE' width='800px' height='600px'></iframe>-->
					<iframe src="${pageContext.request.contextPath}/web-chat-speech/botsample2.html" width='800px' height='600px'></iframe>

				</div>

			</div>


		</div>


		<div class="cover"></div>

		<map name="menu1">
			<area shape="rect" coords="100,240,233,275" href="chat.jsp">
			<area shape="rect" coords="100,320,233,355"
				href="${pageContext.request.contextPath}/sidebar/myhistory/myhistory.jsp">
			<area shape="rect" coords="100,380,233,410"
				href="${pageContext.request.contextPath}/sidebar/mypage/mypage.jsp">
			<area shape="rect" coords="100,430,233,465"
				href="${pageContext.request.contextPath}/sidebar/setting/setting.jsp">
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>

</html>
