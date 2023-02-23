<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate();
	
	request.getSession().setAttribute("loginID", "test2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="GetDestinationList.de" method="post" name="submitForm">
        <input type="submit" value=""></button>
</form>
</body>
</html>
<script src="js/search.js" type="text/javascript"></script>
<script type="text/javascript">
window.attchEvent("onload",submit());
</script>