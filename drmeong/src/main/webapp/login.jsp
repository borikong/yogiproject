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
		out.println("로그인 실패!");
	}
	else{
		out.println("로그인 성공!");
	}
%>

<div>
	<p>사용자 아이디 : <jsp:getProperty name="login" property="userid"/></p>
	<p>사용자 패스워드 : <jsp:getProperty name="login" property="passwd"/></p>
	
</div>

<form  method="post" action="index.jsp">
	<input type="submit" value="메인으로"/>
</form>

</body>
</html>