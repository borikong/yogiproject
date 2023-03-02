<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>

body {
	min-width: 1050px;
    margin-top: 50px;
    margin-bottom: 60px;
    background-color: rgb(255, 255, 255);
}

.join {
	margin-bottom: 10px;
    font-size: 28px;
    line-height: 35px;
    font-weight: 500;
    text-align: center;
    letter-spacing: -1px;
    color: #333;
}

div {	
	width: 640px;
    margin: 0px auto;
	
}

.border {
}

.article {
	padding-bottom: 10px;
    border-bottom: 1px solid rgb(51, 51, 51);
    font-size: 12px;
    color: rgb(102, 102, 102);
    line-height: 17px;
    text-align: right;
}

.div1 {
	
	display: inline-flex;
    width: 100%;
    padding: 10px 20px;
    
}

.left {
	width: 139px;
    padding-top: 12px;
}

.l_label {
	
    color: rgb(51, 51, 51);
    line-height: 20px;
}

.red_span {
	color: rgb(238, 106, 123);
}

.center { 
	flex: 1 1 0%;	 
	padding-bottom: 0px;
	position: relative;
    height: 48px;
}

.c_input {
	width: 100%;
    height: 46px;
    padding: 0px 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid rgb(221, 221, 221);
    font-weight: 400;
    font-size: 16px;
    line-height: 1.5;
    color: rgb(51, 51, 51);
    outline: none;
    box-sizing: border-box;
}

.right {
	width: 120px;
    margin-left: 8px;
}

.b_right {
	height: 44px;
    border-radius: 3px;
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    border-radius: 3px;
    color: #2EA26B;
    background-color: rgb(255, 255, 255);
    border: 1px solid #2EA26B;
}

.w_right {
	height: 44px;
    border-radius: 3px;
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    border-radius: 3px;
    color: rgb(95, 0, 128);
    background-color: rgb(255, 255, 255);
    border: 1px solid #fff;
}

span {
	font-weight: 500;
    font-size: 14px;
}

.c_bottom {
	display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    border-top: 1px solid rgb(247, 247, 247);
    padding: 40px 0px;
}

.c_button {
	display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 240px;
    height: 56px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: #2EA26B;
    border: 0px none;  
}
</style>

<script type="text/javascript" src="script2.js"></script>

</head>
<body>
<form action="member.do?cmd=regProc" method="post" name="regFrom">

<div>
	<div class="join">회원가입</div>
	
	<div class="border">
	
		<div class="article"><span class="red_span">*</span>필수입력사항</div>
		
		<div>
		
			<div class="div1">
				<div class="left">
					<label class="l_label">아이디<span class="red_span">*</span></label>
				</div>
				<div class="center">
					<input class="c_input" placeholder="아이디를 입력해주세요" type="text" name="id">
				</div>
				<div class="right">
					<button class="b_right" onclick="idCheck(this.from.id.value)">중복확인</button>
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
					<input class="c_input" placeholder="비밀번호를 한번 더 입력해주세요" type="password">
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
					<button class="b_right" onclick="zipCheck()"><span>찾기</span></button>
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