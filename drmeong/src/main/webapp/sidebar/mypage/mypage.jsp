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

<link href="${pageContext.request.contextPath}/css/mypage.css?ver=6"
	rel="stylesheet" type="text/css">


<title>마이페이지</title>

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
			<li role="presentation" class="active"><a href="mypage.jsp">보호자
					정보</a></li>
			<li role="presentation"><a href="dogpage.jsp">강아지 정보</a></li>
			<li role="presentation"><a href="mydoginfo.jsp">내 강아지 맞춤 정보</a></li>
			<li role="presentation"><a href="unregister.jsp">회원 탈퇴</a></li>
		</ul>
		</nav>

		<div class="jumbotron" align="center">
			<h3>사용자 정보</h3>


			<p class="lead">

				<%!MemberDAO memberdao;
	MemberBean dto;
	String id;%>


				<%
					System.out.println("member info action");

					//session.getAttribute("id");
					//System.out.println(session.getAttribute("id").toString());
					memberdao = new MemberDAO();
					dto = new MemberBean();
					id = (String) session.getAttribute("id");

					dto = memberdao.getMember(id);
				%>
			
			<form action="MemberModifyAction_2.me" method="post">
				<table class="memberinfotable">
			
					<tr>
						<td width=170><p ><font size="3">보호자 아이디</font></p></td>
						<td><input type="text" name="MEMBER_ID" value="<%=dto.getMEMBER_ID()%>" class="inputdeco" disabled="disabled"></td>
					</tr>
					
					<tr>
						<td><p><font size="3">보호자 비밀번호</font></p></td>
						<td><input type="password" name="MEMBER_PW" value="" class="inputdeco"></td>
					</tr>
					<tr>
						<td colspan="2"><font size="1" color="red">*비밀번호를 입력한 후 수정하기를 누르면 보호자 정보가 업데이트 됩니다.</font></td>
					</tr>

					<tr>
						<td><p><font size="3">보호자 이름</font></p></td>
						<td><input type="text" name="MEMBER_NAME"
							value="<%=dto.getMEMBER_NAME()%>" class="inputdeco"></td>
					</tr>

					<tr>
						<td><p><font size="3">보호자 나이</font></p></td>
						<td><input type="text" name="MEMBER_AGE"
							value="<%=dto.getMEMBER_AGE()%>" class="inputdeco"></td>
					</tr>

					<tr>
						<td><p><font size="3">보호자 성별</font></p></td>
						<td><input type="text" name="MEMBER_GENDER"
							value="<%=dto.getMEMBER_GENDER()%>" class="inputdeco"></td>
					</tr>

					<tr>
						<td><p><font size="3">보호자 이메일</font></p></td>
						<td><input type="text" name="MEMBER_EMAIL"
							value="<%=dto.getMEMBER_EMAIL()%>" class="inputdeco"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정하기"
							class="btn_edit btn-sunflower" class="inputdeco"></td>
					</tr>

				</table>

			</form>
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

