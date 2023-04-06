<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="css/ect_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>


</head>

<div style="margin-left: 30px;">

	<form action="mem.me?cmd=searchid" name="idproc" method="post">
		<div class="search-header">
			<h2>아이디 찾기</h2>
		</div>

		<div class="r-border"></div>

		<div class="searchDivForm">

			<div>
				<input type="text" name="name" value="" placeholder="이름을 입력해주세요">
			</div>

			<div>
				<input type="text" name="email" value="" placeholder="이메일을 입력해주세요">
			</div>

			<div>
				<input class="bt3" type="submit" value="ID찾기"
					onclick="return searchId();"> <input class="bt3"
					type="button" value="취소"
					onclick="javascript:window.location.href='member.me?cmd=login'">
			</div>

		</div>

	</form>
</div>
</body>
</html>