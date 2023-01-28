<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = (String) request.getAttribute("id");
	int check = ((Integer) (request.getAttribute("check"))).intValue();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복확인</title>
<script>
function windowclose(){
	opener.document.joinformMEMBER_ID.value="<%=id%>";
		self.close();
	}
</script>
</head>
<body>
	<%
		if (check == 1) {
	%>
	<table width="360" border=0 cellspacing=0 cellpadding=5>
		<tr align="center">
			<td height="30"><font size="2"><%=id%>는 이미 사용 중인 아이디
					입니다.</font></td>
		</tr>
	</table>

	<form action="../MemberIDCheckAction.me" method="post" name="checkForm">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td aligh="center"><font size="2">다른 아이디를 선택하세요.</font>
					<p>
						<input type="text" size="10" maxlength="12" name="MEMBER_ID" /> <input
							type="submit" value="중복확인" />
					</p></td>
			</tr>
		</table>
	</form>

	<%
		}else{
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<td>
	<font size="2">입력하신 <%=id %>는 사용할 수 있는 아이디 입니다.</font>
	<br/><br/>
	<input type="button" value="닫기" onclick="windowclose()"/>
	</td>
	</tr>
	</table>
	
	<%} %>
</body>
</html>