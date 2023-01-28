<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath}/css/join_form.css" rel="stylesheet" type="text/css">
<title>login_form.jsp(Login)</title>
<script>
	function check() {
		var id = loginform.MEMBER_ID.value;
		var pass = loginform.MEMBER_PW.value;

		if (id.length == 0) {
			alert("아이디를 입력하세요");
			loginform.MEMBER_ID.focus();
			return false;
		}

		if (pass.length == 0) {
			alert("비밀번호를 입력하세요");
			loginform.MEMBER_PW.focus();
			return false;
		}

		return true;
	}

	function openConfirmId(loginform) {
		var id=joinform.MEMBER_ID.value;
		var url="../MemberIDCheckAction.me?MEMBER_ID"=joinform.MEMBER_ID.value;
		
		if(id.lengt == 0){
			alert("아이디를 입력하세요.");
			joinform.MEMBER_ID.focus();
			return false
		}
		
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
	}
</script>

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
	</div>

	<form name="joinform" action="./MemberJoinAction.me" method="post" onsubmit="return check()">
		<table align="center">

			<tr>
				<td align=center><b>이름</b></td>
				<td><input type="text" name="MEMBER_NAME" class="inputdeco"
					size=10 /></td>
			</tr>

			<tr>
				<td align=center><b>ID</b></td>
				<td><input type="text" name="MEMBER_ID" class="inputdeco"
					size=15 /> <input type="button" name="confirm_id" value="중복확인"
					onclick="openConfirmId(this.form)" /></td>
			</tr>

			<tr>
				<td align=center><b>PASSWORD</b></td>
				<td><input type="password" name="MEMBER_PW" class="inputdeco"
					size=15 /></td>
			</tr>

			<tr>
				<td align=center><b>비밀번호 확인</b></td>
				<td><input type="password" name="MEMBER_PW2" class="inputdeco"
					size=15 /></td>
			</tr>

			<tr>
				<td align=center colspan=2><b>(아이디와 비밀번호는 문자와 숫자를 조합하여
						2~12자리로 만들어 주세요)</b></td>
			</tr>

			<tr>
				<td align=center><b>나이</b></td>
				<td><input type="text" name="MEMBER_AGE" class="inputdeco"
					size=30 /></td>
			</tr>

			<tr>
				<td align=center><b>성별</b></td>
				<td>여<input type="radio" name="MEMBER_GENDER" value="여"/> 남<input type="radio" name="MEMBER_GENDER" value="남"/></td>
			</tr>
			
			<tr>
				<td align=center><b>E-MAIL</b></td>
				<td><input type="text" name="MEMBER_EMAIL" class="inputdeco"
					size=30 /></td>
			</tr>

			<tr>
				<td align=center colspan=2><input type="submit" value="회원가입"
					class="btn btn-sunflower" /></td>
			</tr>

		</table>
	</form>
</body>
</html>