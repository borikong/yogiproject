<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="net.dog.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<link href="${pageContext.request.contextPath}/css/mypage.css?ver=7"
	rel="stylesheet" type="text/css">


<title>강아지 정보</title>

<link
	href="${pageContext.request.contextPath}/bootstrap/dist/css/bootstrap.min.css?ver=2"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/bootstrap/bootstrap-3.3.2/docs/examples/jumbotron-narrow.css"
	rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/bootstrap-3.3.2/docs/assets/js/ie-emulation-modes-warning.js"></script>



<script>
	function SetEmailTail(emailValue) {
		var email = document.all("email") // 사용자 입력
		var emailTail = document.all("DOG_BREED") // Select box

		if (emailValue == "notSelected")
			return;
		else if (emailValue == "etc") {
			emailTail.readOnly = false;
			emailTail.value = "";
			emailTail.focus();
		} else {
			emailTail.readOnly = true;
			emailTail.value = emailValue;
		}
	}
</script>

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


		<div class="container">
			<nav>
			<ul class="nav nav-pills pull-left">
				<li role="presentation"><a href="mypage.jsp">보호자 정보</a></li>
				<li role="presentation" class="active"><a href="dogpage.jsp">강아지
						정보</a></li>
				<li role="presentation"><a href="mydoginfo.jsp">내 강아지 맞춤 정보</a></li>
				<li role="presentation"><a href="unregister">회원 탈퇴</a></li>
			</ul>
			</nav>

			<div class="jumbotron" align="center">
				<h3>강아지 정보</h3>


				<p class="lead">

					<%!DogDAO dogdao;
	DogBean dto;
	String id;%>


					<%

						dogdao = new DogDAO();
						dto = new DogBean();
						id = (String) session.getAttribute("id");

						dto = dogdao.getDog(id);
					%>
				
				<form action="DogAddAction.me" method="post">
					<table class="memberinfotable">

						<tr>
							<td width=170><p><font size="3">보호자 아이디</font></p></td>
							<td><input type="text" name="MEMBER_ID"
								value="<%=dto.getMEMBER_ID()%>" disabled="disabled"
								class="inputdeco"></td>
						</tr>

						<tr>
							<td><p><font size="3">강아지 이름</font></p></td>
							<td><input type="text" name="DOG_NAME"
								value="<%=dto.getDOG_NAME()%>" class="inputdeco"></td>
						</tr>

						<tr>
							<td><p><font size="3">강아지 생년월일</font></p></td>
							<td><input type="text" name="DOG_BYEAR"
								value="<%=dto.getDOG_BYEAR()%>" size="6" class="inputdeco">년&nbsp;
								<input type="text" name="DOG_BMONTH"
								value="<%=dto.getDOG_BMONTH()%>" size="6" class="inputdeco">월&nbsp;
								<input type="text" name="DOG_BDATE"
								value="<%=dto.getDOG_BDATE()%>" size="6" class="inputdeco">일&nbsp;</td>
						</tr>


						<tr>
							<td><p><font size="3">강아지 나이</font></p></td>
							<td><input type="text" name="DOG_AGE"
								value="<%=dto.getDOG_AGE()%>" class="inputdeco"></td>
						</tr>

						<tr>
							<td><p><font size="3">견종</font></p></td>
							<td><input type="text" name="DOG_BREED" value="<%=dto.getDOG_BREED() %>" class="inputdeco" ReadOnly="true" /> 
							<select
								name="emailCheck"
								onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
								
									<option value="notSelected">::선택하세요::</option>
										<%
											for(String dog_breed:dogdao.getDogList() ){
												out.println("<option value='"+dog_breed+"'>"+dog_breed+"</option>");
											}
										%>
									
									<option value="etc">직접입력</option>
								
							</select></td>

						</tr>
							<td colspan="2"><font size="1" color="red">*견종을 선택하시면 내 강아지에 대한 정보를 손쉽게 조회하실 수 있습니다.</font></td>
						<tr>
							
						</tr>

						<tr>
							<td><p><font size="3">강아지 성별</font></p></td>
							<td><input type="text" name="DOG_SEX"
								value="<%=dto.getDOG_SEX()%>" class="inputdeco"></td>
						</tr>


						<tr>
							<td><p><font size="3">강아지 몸무게</font></p></td>
							<td><input type="text" name="DOG_WEIGHT"
								value="<%=dto.getDOG_WEIGHT()%>" class="inputdeco">KG</td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value="수정하기"
								class="btn_edit btn-sunflower"></td>
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



		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/myhistory.js"></script>
</body>
</html>