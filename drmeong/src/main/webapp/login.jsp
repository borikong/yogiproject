<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="login" class="checkID.LoginBean" scope="page"/>
<jsp:setProperty name="login" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Check User Login</title>
</head>
<body>
<%
	if(!login.checkUser()){
		out.println("�α��� ����!");
	}
	else{
		out.println("�α��� ����!");
	}
%>

<div>
	<p>����� ���̵� : <jsp:getProperty name="login" property="userid"/></p>
	<p>����� �н����� : <jsp:getProperty name="login" property="passwd"/></p>
	
</div>

<form  method="post" action="index.jsp">
	<input type="submit" value="��������"/>
</form>

</body>
</html>