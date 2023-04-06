<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">


<c:if test="${fn:length(destlist)==0}">
	<div id="noresults">
		<p align="center">검색된 결과가 없습니다.</p>
	</div>
</c:if>


<c:forEach var="vo" items="${destlist}">
	<div class="resume-wrap d-flex ftco-animate">
		<div class="text pl-3">

			<!-- 				여행지 이미지 클릭시 여행지 상세페이지 -->
			<img src="${vo.DEST_IMG}" class="rounded float-start" alt="destimg"
				id="dest_img" width="400px"> <a
				href="${pageContext.request.contextPath}/search_main/GetDestDetailView.de?dest_name=${vo.getDEST_NAME()}"
				name="${vo.DEST_NAME }"> <span class="rgyBadge">${vo.DEST_COUNTRY}</span>&nbsp;
				<span id="dest_select">${vo.DEST_NAME}</span>
			</a>


			<div>
				<span class="position">비용</span>
				<progress value="${vo.DEST_MONEY * 100}" max="100" id="pg"></progress>
			</div>
			<div>
				<span class="position">경치</span>
				<progress value="${vo.DEST_LANDSCAPE * 100}" max="100" id="pg"></progress>
			</div>
			<div>
				<span class="position">재미</span>
				<progress value="${vo.DEST_FUN * 100}" max="100" id="pg"></progress>
			</div>

			<p id="content_preview">${vo.DEST_SUMMARY}...</p>

			<div>
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
					${loop_flag ? "class='icon2 heart active'" :"class='icon2 heart'"  }>&nbsp;&nbsp;
					<img
					${loop_flag ? "src='https://cdn-icons-png.flaticon.com/512/803/803087.png'" :"src='https://cdn-icons-png.flaticon.com/512/812/812327.png'"  }
					${loop_flag ? "alt='찜하기 완료'" :"alt='찜하기'"  }>&nbsp;&nbsp;
				</a>

			</div>

		</div>
	</div>
</c:forEach>

<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery-migrate-3.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.stellar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/search_main/js/aos.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/search_main/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/search_main/js/main.js"></script>

<script
	src="${pageContext.request.contextPath}/search_main/js/search.js"
	type="text/javascript"></script>

<script>
// 찜하고 해당 위치로 이동하기 위해서
// a 태그의 name 속성에 넣어준 값을 매칭해서 이동
var thisdest="${thisdest}";
	window.onload = function(){
		var newlocation=location.href.substring(0,location.href.indexOf("#"));
		setTimeout(() => location.href =  newlocation+"#${thisdest}", 50);
    }
</script>
