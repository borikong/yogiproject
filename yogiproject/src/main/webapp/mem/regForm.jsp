<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="regform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<jsp:include page="/common/navbar.jsp" />
	<br><br><br>
	<form action="member.me?cmd=regProc" method="post" name="regForm">

		<div class="maindiv">
			<div class="join">
				<b>회원가입</b>
			</div>

			<div class="border">

				<div class="article">
					<span class="red_span">*</span>필수입력사항
				</div>

				<div class="maindiv">

					<div class="div1">
						<div class="left">
							<label class="l_label">아이디<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="아이디를 입력해주세요" type="text"
								name="id" id="input_id" value="${checkid}">
						</div>
						<div class="right">
							<input type="button" value="중복확인"
								onclick="idCheck(this.form.id.value)" class="b_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="비밀번호를 입력해주세요" type="password"
								name="pass">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호확인<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="비밀번호를 한번 더 입력해주세요"
								type="password" name="repass">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이름<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="이름을 입력해주세요" type="text"
								name="name">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이메일<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="이메일을 입력해주세요" type="text"
								name="email">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">휴대폰</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="숫자만 입력해주세요" type="text"
								name="phone">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">우편번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text" name="zipcode">
						</div>
						<div class="right">
							<input type="button" value="찾기" onclick="zipCheck()"
								class="b_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">주소<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text" name="address1">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">상세주소</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="상세주소를 입력해주세요" type="text"
								name="address2">
						</div>
						<div class="right">
							<input type="hidden" class="w_right">
						</div>
					</div>

					<div class="c_bottom">
						<input type="button" value="가입하기" onclick="inputCheck()"
							class="c_button">
					</div>

				</div>

			</div>
			<!-- board close -->

		</div>

	</form>
	<br><br><br>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>

