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
<title>���̵� �ߺ�Ȯ��</title>
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
			<td height="30"><font size="2"><%=id%>�� �̹� ��� ���� ���̵�
					�Դϴ�.</font></td>
		</tr>
	</table>

	<form action="../MemberIDCheckAction.me" method="post" name="checkForm">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td aligh="center"><font size="2">�ٸ� ���̵� �����ϼ���.</font>
					<p>
						<input type="text" size="10" maxlength="12" name="MEMBER_ID" /> <input
							type="submit" value="�ߺ�Ȯ��" />
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
	<font size="2">�Է��Ͻ� <%=id %>�� ����� �� �ִ� ���̵� �Դϴ�.</font>
	<br/><br/>
	<input type="button" value="�ݱ�" onclick="windowclose()"/>
	</td>
	</tr>
	</table>
	
	<%} %>
</body>
</html>