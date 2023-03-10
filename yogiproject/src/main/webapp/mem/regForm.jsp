<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<form action="member.do?cmd=regProcs" method="post" name="regForm">

		<div>
			<div class="join">회원가입</div>

			<div class="border">

				<div class="article">
					<span class="red_span">*</span>필수입력사항
				</div>

				<div>

					<div class="div1">
						<div class="left">
							<label class="l_label">아이디<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="아이디를 입력해주세요" type="text"
								name="id">
						</div>
						<div class="right">
							<button type="button" class="b_right" onclick="idCheck(this.form.id.value)">
								<span>중복확인</span>
							</button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="비밀번호를 입력해주세요" type="password">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호확인<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="비밀번호를 한번 더 입력해주세요"
								type="password">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이름<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="이름을 입력해주세요" type="text">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이메일<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="이메일을 입력해주세요" type="text">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">휴대폰</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="숫자만 입력해주세요" type="text">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">우편번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text" onclick="zipCheck()">
						</div>
						<div class="right">
							<button class="b_right" onclick="zipCheck()">
								<span>찾기</span>
							</button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">주소<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">상세주소</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="상세주소를 입력해주세요" type="text">
						</div>
						<div class="right">
							<button class="w_right"></button>
						</div>
					</div>

					<div class="c_bottom">
						<button class="c_button" onclick="inputCheck()">
							<span>가입하기</span>
						</button>
					</div>

				</div>

			</div>

		</div>

	</form>
</body>
</html>

