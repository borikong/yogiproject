<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
.tooltip {
	position: relative;
	display: inline-block;
}

.tooltip .tooltip-content {
	visibility: hidden;
	width: 300px;
	background-color: orange;
	padding: 0;
	color: white;
	text-align: center;
	position: absolute;
	z-index: 1;
	border-radius: 9px;
}

.tooltip:hover .tooltip-content {
	visibility: visible;
}


 .tooltip_custom {
	position: relative;
	display: inline-block;
}

 .tooltip_custom .tooltip-content_custom {
	visibility: hidden;
	width: 300px;
	background-color: orange;
	padding: 0;
	color: white;
	text-align: center;
	position: absolute;
	z-index: 1;
	border-radius: 9px;
}

.tooltip_custom:hover .tooltip-content_custom {
	visibility: visible;
}
</style>
</head>
<body>
	<p>
		개발자를 위한 다양한 웹 기술을 배워보세요. <span class="tooltip">HTML<span
			class="tooltip-content">HyperText Markup Language</span></span>은 웹페이지에 내용을
		기술하고 정의하는 데 사용합니다. <span class="tooltip">CSS<span
			class="tooltip-content">Cascading Style Sheets</span></span>는 웹페이지 콘텐츠의 모양이나
		표현을 기술하는 데 사용합니다.
	</p>
	
	<span class="tooltip_custom">?<span class="tooltip-content_custom">사용자 리뷰를 분석하여 예측한 평점입니다.
				</span></span>
</body>
</html>
