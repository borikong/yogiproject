<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<link href="css/regform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<jsp:include page="/common/navbar.jsp" />
	<form action="member.me?cmd=modifyProc" method="post" name="regForm">
		<c:choose>
			<c:when test="${loginID ne null}">

				<div class="mp-in">
					<h2>♥ ${loginID}님 환영합니다. ♥</h2>
				</div>

				<div class="mypage">

					<div class="mp_left">
						<div class="left-header">마이페이지</div>
						<ul class="mypageul">
							<li><a class="mp-a" href="mem.me?cmd=mypage"> 찜리스트 <span
									class="mp_span">&gt;</span>
							</a></li>
							<li><a class="active mp-a" href="mem.me?cmd=modifyForm">
									정보수정 <span class="mp_span">&gt;</span>
							</a></li>
							<li><a class="mp-a" href="deleteForm.jsp"> 회원탈퇴 <span
									class="mp_span">&gt;</span>
							</a></li>
						</ul>

						<a class="left-a"
							href="${pageContext.request.contextPath}/Sim/Customer_Service_Center/문의게시판/Inquiry_Board_List.jsp">
							<div class="left-bottom">
								<span>도움이 필요하신가요 ?</span> <span class="left-s">문의하기</span>
							</div>
						</a>
					</div>

					<div class="mp_right">

						<div class="right-header">
							<h2>정보수정</h2>
						</div>

						<div class="r-border"></div>


						<!-- 정보수정 -->
						<div class="mp-box">
							<div class="article-modify">
								<span class="red_span">*</span>필수입력사항
							</div>

							<div>

								<div class="div1">
									<div class="left">
										<label class="l_label">아이디<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" type="hidden" name="id" value="${id}">
										<c:out value="${id}" />

									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">비밀번호<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" placeholder="변경할 비밀번호를 입력해주세요"
											type="password" name="pass" value="${pass}">
									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">비밀번호확인<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" placeholder="비밀번호를 한번 더 입력해주세요"
											type="password" name="repass" value="${pass}">
									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">이름<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" type="hidden" name="name"
											value="${name}">
										<c:out value="${name}"></c:out>
									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">이메일<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<c:if test="${param.checkemail eq null}">
											<input class="c_input" placeholder="이메일을 입력해주세요" type="text"
												name="email" value="${email}">
										</c:if>
										<c:if test="${param.checkemail ne null }">
											<input class="c_input" placeholder="이메일을 입력해주세요" type="text"
												name="email" value="${param.checkemail}">
											<br>&nbsp;<span style="font-size: 0.7rem;">${param.check2 eq 1 and param.checkemail ne ''?'<span style="color :green; font-weight:700;">사용 가능한 이메일입니다.</span>':'<span style="color :red; font-weight:700;">사용 불가능한 이메일입니다.</span>'}</span>
										</c:if>

									</div>
									<div class="right">
										<input type="button" value="중복확인"
											onclick="emailCheck_modify(this.form.email.value)"
											class="b_right">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">휴대폰</label>
									</div>
									<div class="center">
										<input class="c_input" placeholder="숫자만 입력해주세요" type="text"
											name="phone" value="${phone}">
									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">우편번호<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" type="text" name="zipcode"
											value="${zipcode}">
									</div>
									<div class="right">
										<input class="b_right" type="button" value="찾기"
											onclick="zipCheck()">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">주소<span class="red_span">*</span></label>
									</div>
									<div class="center">
										<input class="c_input" type="text" name="address1"
											value="${address1}">
									</div>
									<diV class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="div1">
									<div class="left">
										<label class="l_label">상세주소</label>
									</div>
									<div class="center">
										<input class="c_input" placeholder="상세주소를 입력해주세요" type="text"
											name="address2" value="${address2}">
									</div>
									<div class="right">
										<input class="w_right" type="button">
									</div>
								</div>

								<div class="c_bottom">
									<input class="c_button" type="button" value="정보수정"
										onclick="updateCheck()">
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</form>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>