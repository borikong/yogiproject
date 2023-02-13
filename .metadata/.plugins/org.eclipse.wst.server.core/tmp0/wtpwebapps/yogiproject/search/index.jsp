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
		�����ڸ� ���� �پ��� �� ����� ���������. <span class="tooltip">HTML<span
			class="tooltip-content">HyperText Markup Language</span></span>�� ���������� ������
		����ϰ� �����ϴ� �� ����մϴ�. <span class="tooltip">CSS<span
			class="tooltip-content">Cascading Style Sheets</span></span>�� �������� �������� ����̳�
		ǥ���� ����ϴ� �� ����մϴ�.
	</p>
	
	<span class="tooltip_custom">?<span class="tooltip-content_custom">����� ���並 �м��Ͽ� ������ �����Դϴ�.
				</span></span>
</body>
</html>
