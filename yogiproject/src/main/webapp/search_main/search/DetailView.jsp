<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/search_main/css/search_main.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/search_main/css/style2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/search_main/css/animate.css">


<title>여행지 상세</title>
</head>
<body>

	<div>
		<jsp:include page="/common/navbar.jsp"></jsp:include>
		<hr class="deep_hr">
		<div class="container">

			<h3 class="view_label">
				<span class="rgyBadge" style="font-size: 1.1rem;">${vo.getDEST_COUNTRY()}</span>
				<span id="dest_name">${vo.getDEST_NAME()}</span>

				<div id="likebtn">

					<!-- 				loop 돌다가 찜한 리스트에 해당 관광지가 있으면 flag를 true로 바꿈 -->
					<!-- 				flag가 true인 동안은 loop를 돌더라도 아무 동작도 하지 않음(break 구현 대체) -->
					<c:set var="loop_flag" value="false" />
					<c:forEach var="like" items="${likeList}">
						<c:if test="${not loop_flag }">
							<c:if test="${vo.DEST_NAME==like}">
								<c:set var="loop_flag" value="true" />
							</c:if>
						</c:if>
					</c:forEach>

					<!-- 					해당 관광지가 찜 리스트에 있으면 하트찜 활성화 -->

					<a href="javascript:;" data-a="${vo.DEST_NAME}"
						data-b="${loop_flag ? 'active':'nonactive' }" data-c="${loginID}"
						${loop_flag ? "class='icon2 heart2 active'" :"class='icon2 heart2'"  }>&nbsp;&nbsp;
						<img
						${loop_flag ? "src='https://cdn-icons-png.flaticon.com/512/803/803087.png'" :"src='https://cdn-icons-png.flaticon.com/512/812/812327.png'"  }
						${loop_flag ? "alt='찜하기 완료'" :"alt='찜하기'"  }>&nbsp;&nbsp;
					</a>

				</div>
				

			</h3>
			<div style="display: inline-block; padding-left: 600px;">
				<input type="button" class="listbtn" value="목록으로"
					onclick="window.location.href='index.jsp';">
			</div>
			<div align="center">
				<table>
					<tr>
						<td width="40%"><img src="${vo.getDEST_IMG()}"
							class="img-thumbnail" id="dest_img"
							alt="${vo.getDEST_NAME()} 이미지" /></td>
						<td width="50%">
							<div class="content-container">
								<h2 class="detail-label">
									여행지 평점&nbsp;<span class="tooltip_custom">?<span
										class="tooltip-content_custom" style="width: 310px;">사용자
											리뷰를 분석하여 예측한 평점입니다. </span></span>
								</h2>
								<%-- 			<jsp:include page="/search/pgbar.jsp"></jsp:include> --%>
								<div>
									<span class="position">비용</span>
									<progress value="${vo.DEST_MONEY * 100}" max="100" id="pg"></progress>
								</div>
								<div>
									<span class="position">경치</span>
									<progress value="${vo.DEST_LANDSCAPE * 100}" max="100"
										id="pg"></progress>
								</div>
								<div>
									<span class="position">재미</span>
									<progress value="${vo.DEST_FUN * 100}" max="100" id="pg"></progress>
								</div>
								<br>
								<h2 class="detail-label">
									여행지 태그&nbsp;<span class="tooltip_custom">?<span
										class="tooltip-content_custom" style="width: 320px;">사용자
											리뷰에서 자동으로 추출한 태그입니다. </span></span>
								</h2>
								<span>${vo.DEST_TAG}</span>
																<br><br>
								<span class="detail-label">
									찜&nbsp;&nbsp;&nbsp;<span class="like-cnt">${vo.DEST_CNT }&nbsp;</span>명</span>
							</div>
						</td>
					</tr>

				</table>
			</div>
			<div class="content-container">
				<p class="dest_content">${vo.getDEST_CONTENT()}<br>
					<br>출처 : ${vo.getDEST_REFERENCE() }
				</p>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>

</html>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/search.js"
	type="text/javascript"></script>
