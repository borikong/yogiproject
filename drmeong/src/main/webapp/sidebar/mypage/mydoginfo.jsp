<%@page import="net.dog.db.DogDiseaseBean"%>
<%@page import="net.dog.db.DogDAO"%>
<%@page import="net.dog.db.DogBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="net.member.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<link href="${pageContext.request.contextPath}/css/mypage.css?ver=2"
	rel="stylesheet" type="text/css">


<title>내 강아지 맞춤 정보</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/dist/css/bootstrap.min.css?ver=1"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->

<link
	href="${pageContext.request.contextPath}/bootstrap/bootstrap-3.3.2/docs/examples/jumbotron-narrow.css"
	rel="stylesheet" type="text/css">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/bootstrap-3.3.2/docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>



	<div class="header">
		<div class="htitlebox">
			<a href="${pageContext.request.contextPath}/index.jsp"
				class="textdeco" style="text-decoration: none;">
				<div class="htitletxt">
					<p>
						닥터멍<br>Dr.Meong
					</p>
				</div>
			</a>
		</div>

		<div class="top-right">
			<%
				if (session.getAttribute("id") != null) {
			%>


			<div class="userid">
				<p id="userid"><%=session.getAttribute("id").toString() + "님"%>&nbsp;&nbsp;
				</p>
			</div>

			<div class="login_row">
				<div class="col three">
					<form action="MemberLogoutAction.me" method="post">
						<input type="submit" value="로그아웃" class="btn_log btn-sunflower" />
					</form>
				</div>
			</div>




			<%
				} else {
			%>

			<jsp:forward page="/member/login_form.jsp"></jsp:forward>

			<div class="userid"></div>

			<div class="login_row">
				<div class="col three">

					<a href="${pageContext.request.contextPath}/member/login_form.jsp"
						class="btn_log btn-sunflower">로그인</a>
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

	<div class="container">


		<nav>
		<ul class="nav nav-pills pull-left">
			<li role="presentation"><a href="mypage.jsp">보호자 정보</a></li>
			<li role="presentation"><a href="dogpage.jsp">강아지 정보</a></li>
			<li role="presentation" class="active"><a href="mydoginfo.jsp">내
					강아지 맞춤 정보</a></li>
			<li role="presentation"><a href="unregister.jsp">회원 탈퇴</a></li>
		</ul>
		</nav>

		<div class="jumbotron">


			<p class="lead">

				<%!DogDAO dogdao;
	DogDiseaseBean dto;
	String id, breed;%>


				<%
					System.out.println("member info action");

					dogdao = new DogDAO();
					dto = new DogDiseaseBean();
					id = (String) session.getAttribute("id");
					breed=dogdao.getMyDog(id);

					dto = dogdao.getMyDogInfo(id);
				%>

			<table class="doginfotable">
			
			
				<%
				System.out.println(dogdao.getMyDog(id));
					if (dogdao.getMyDog(id) != null) {
				%>
				<h3><%=breed%>
					(이)가 자주 걸리는 질병은?
					<br/>
				</h3>
				<h7>*각 질병을 클릭하면 자세한 정보를 볼 수 있습니다.</h7>
				<br/>
				<%
					} else {
				%>
				<h3>등록된 견종이 없습니다.</h3>
				<%
					}
				%>

				<%
					for (String disease : dto.getDog_diseases()) {
				%>
				<tr>
					<td><p><a href="<%=dogdao.getDiseaseURL(disease) %>"><%=disease%></a></p></td>
				</tr>
				<%
					}
				%>
			</table>



			</p>

		</div>

		<div class="row marketing">
			<div class="col-lg-6">
				<h4>질병 정보 출처</h4>
				<p>
					https://terms.naver.com/list.nhn?cid=58401&categoryId=58401<br>네이버
					강아지 질병사전
				</p>

				<h4>약품 정보 출처</h4>
				<p>
					http://anipharm.net/anidict<br> 동물양품사전 : 대한동물약품협회
				</p>

				<h4>Design</h4>
				<p>bootstrap</p>
			</div>

			<div class="col-lg-6">
				<h4>Copyright</h4>
				<p>Positive Tree All Right Reserved</p>

				<h4>TEAM MEMBER</h4>
				<p>IM JI SU</p>
				<p>CHO SOO MIN</p>
				<p>KIM DA YEONG</p>

				<h4>CONTACT</h4>
				<p>da1599@naver.com</p>
				<p>pyovly1102@duksung.ac.kr</p>
				<p>dlawltn1114@naver.com</p>
			</div>
		</div>

		<footer class="footer">
		<p>&copy; Company 2018</p>
		</footer>

	</div>


	<map name="menu1">
		<area shape="rect" coords="100,240,233,275" href="chat.jsp">
		<area shape="rect" coords="100,320,233,355"
			href="${pageContext.request.contextPath}/sidebar/myhistory/myhistory.jsp">
		<area shape="rect" coords="100,380,233,410"
			href="${pageContext.request.contextPath}/sidebar/mypage/mypage.jsp">
		<area shape="rect" coords="100,430,233,465"
			href="${pageContext.request.contextPath}/sidebar/setting/setting.jsp">
	</map>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/login.js"></script>
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

