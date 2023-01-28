<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
		var url = "./MemberFind.me"
		open(
				url,
				"confirm",
				"toolbar=no,location=no,status=no,menbar=no,scrollbars=no,resizable=no,width=450ps,height=300");
	}
</script>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="header">
		<div class="htitlebox">
			<a href="${pageContext.request.contextPath}/index.jsp"
				class="textdeco">
				<div class="htitletxt">
					<p align=center>
						닥터멍<br>Dr.Meong
					</p>
				</div>
			</a>`
		</div>
	</div>
<form action="../MemberLoginAction.me" method="POST" onsubmit="return check()">
	<table align=center>
		<tr>
			<td align=center><b>ID</b></td>
			<td><input type="text" name="MEMBER_ID" class="inputdeco" /></td>
		</tr>
		<tr>
			<td align=center><b>PW</b></td>
			<td><input type="password" name="MEMBER_PW" class="inputdeco" /></td>
		</tr>
		<tr>
			<td align=center colspan=2>
					<input type="submit" value="로그인" class="btn btn-sunflower" />
				</form>
			</td>
		</tr>
		<tr>
			<td align=center colspan=2><input type="button" value="회원가입"
				class="btn btn-sunflower"
				onclick="javascript:window.location='../MemberJoin.me'" /></td>
		</tr>
		</table>

</body>
</html>