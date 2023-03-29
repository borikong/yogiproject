<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginID"
	value='<%=(String) session.getAttribute("loginID")%>' />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜리스트</title>
<link href="mypage.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../search_main/navbar/navbar.jsp" />
	<c:choose>
		<c:when test="${loginID ne null}">

			<div class="mp-in">
				<h2>♥ ${loginID}님 환영합니다. ♥</h2>
			</div>

			<div class="mypage">

				<div class="mp_left">
					<div class="left-header">마이페이지</div>
					<ul>
						<li><a class="active mp-a" href="mem.do?cmd=mypage"> 찜리스트
								<span class="mp_span">&gt;</span>
						</a></li>

						<li><a class="mp-a" href="mem.do?cmd=modifyForm"> 정보수정 <span
								class="mp_span">&gt;</span>
						</a></li>

						<li><a class="mp-a" href="deleteForm.jsp"> 회원탈퇴 <span
								class="mp_span">&gt;</span>
						</a></li>
					</ul>

					<a class="left-a" href="#">
						<div class="left-bottom">
							<span>도움이 필요하신가요 ?</span> <span class="left-s">문의하기</span>
						</div>
					</a>

				</div>

				<div class="mp_right">
					<div class="right-header" id="title_content">
						<h2>찜리스트</h2>
					</div>
					<div class="r-border"></div>

					<!-- 찜 리스트가 있으면 -->
					<c:if test="${likecheck eq 1 }">
						<!-- 찜리스트 -->
						<div class="mp-box">

							<!-- 리스트 반복문 -->
							<c:forEach var="vo" items="${likelist}">

								<div class="box-li">
									<div class="li-top">
										<img class="li-img" src="${vo.DEST_IMG}">

										<div class="li-content">

											<!-- 여행지 국가/이름 -->
											<a
												href="${pageContext.request.contextPath}/search_main/GetDestDetailView.de?dest_name=${vo.getDEST_NAME()}">

												<span class="rgyBadge">${vo.DEST_COUNTRY}</span>&nbsp; <span
												id="dest_select">${vo.DEST_NAME}</span>

											</a>

											<!-- 여행지 평점 -->
											<br> <br>
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
											<!-- 여행지 태그 -->
											<div>
												<span class="position">${vo.DEST_TAG_STR }</span>
											</div>
										</div>



									</div>

									<!-- 찜삭제 -->
									<div class="box-wish">
										<button class="wish-btn" type="button" height="36" radius="3">
											<a
												href="${pageContext.request.contextPath}/search_main/Like.de?cmd=dislike&dest=${vo.DEST_NAME}&page=mypage">찜
												삭제</a>
										</button>
									</div>
								</div>

								<hr />

							</c:forEach>
							<!-- 리스트 반복문 끝-->
						</div>
					</c:if>

					<c:if test="${likecheck eq 0 }">
						<div align="center">
							<br>
							<br>
							<br> <span class="msg">찜한 목록이 없습니다.</span> <br>
							<br>
							<br>
						</div>
					</c:if>

				</div>
			</div>

		</c:when>
	</c:choose>
	<jsp:include page="/search_main/navbar/footer.jsp"></jsp:include>
</body>

</html>

