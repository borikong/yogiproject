<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
<link href="css/ect_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>

</head>
<body>

<div class="idproc-size">
${id }
<c:choose>
  <c:when test="${empty id}">
    가입 정보를 찾을 수 없습니다.
  </c:when>
  <c:otherwise>
    <p>입력하신 정보로 아래의 아이디를 찾았습니다.</p>
    <!-- 아이디가 null이 아닐 때 -->
    <c:if test="${id ne null && id !='' }">
      <!-- 아이디의 앞 4자리까지 보여 주고 -->
      ${fn:substring(id,0,4)}
      <!-- 5자리부터 id의 길이만큼 *를 찍어줌 -->
      <c:forEach begin="5" end="${fn:length(id)}" step="1">
        *
      </c:forEach>
    </c:if>
  </c:otherwise>
</c:choose>

<table>
<tr>
	<td>
		<input class="bt4" type="button" value="확인" onclick="javascript:window.close();">				
	</td>
</tr>
</table>

</div>
</body>
</html>