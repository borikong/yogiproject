<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- 툴팁을 숨겨둘 스타일시트 -->
<style>
    .tooltip {
        position: relative;
    }

    .tooltip::before {
        content: attr(title);
        position: absolute;
        display: none;
        background-color: #333;
        color: #fff;
        border-radius: 5px;
        padding: 5px;
        font-size: 0.8em;
        white-space: nowrap;
    }

    .tooltip:hover::before {
        display: block;
        z-index: 1;
        bottom: 100%;
        left: 50%;
        transform: translateX(-50%);
    }
</style>

</head>
<body>
<br><br>
<!-- 툴팁을 보여줄 요소 -->
<span class="tooltip" title="이것은 툴팁입니다.">마우스를 올려보세요.</span>
</body>
</html>