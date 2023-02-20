<%@page import="java.util.*, net.dest.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<%
request.setCharacterEncoding("utf-8");

Vector<DestVO> list = (Vector<DestVO>) request.getAttribute("destList");
if (list != null) {
	for (int i = 0; i < list.size(); i++) {
		DestVO vo = list.elementAt(i);
		String summary=vo.getDEST_CONTENT();
		if(summary.length()>190){
			summary=summary.substring(0,190);}
%>


<div class="resume-wrap d-flex ftco-animate">
	<div class="text pl-3">
	
		<!-- 		여행지 이미지 -->
		<img src="<%=vo.getDEST_IMG()%>" class="rounded float-start"
			alt="destimg" id="dest_img" width="400px">
			
		<!-- 클릭시 여행지 상세페이지 -->
		<form action="GetDestDetailView.de" method="post" id="viewForm<%=vo.getDEST_NAME()%>">
			<input type="hidden" name="dest_name" value="<%=vo.getDEST_NAME()%>">
			<h2 onclick="document.getElementById('viewForm<%=vo.getDEST_NAME()%>').submit()" id="dest_select">
				<span class="rgyBadge"><%=vo.getDEST_COUNTRY()%></span>&nbsp;<span id="dest_name"><%=vo.getDEST_NAME()%></span>&nbsp;&nbsp;<span
					class="date" id="name_eng"><%=vo.getDEST_NAME_ENG()%></span>
			</h2>
		</form>
		

		<div>
			<span class="position">비용</span>
			<progress value="<%=vo.getDEST_MONEY() * 100%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position">경치</span>
			<progress value="<%=vo.getDEST_LANDSCAPE() * 100%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position">재미</span>
			<progress value="<%=vo.getDEST_FUN() * 100%>" max="100" id="pg"></progress>
		</div>

		<%-- 				<jsp:include page="pgbar.jsp"></jsp:include> --%>
		<p id="content_preview"><%=summary%>...</p>
		
<!-- 		하트찜 -->
		<div>
			<a href="javascript:;" class="icon2 heart">&nbsp;&nbsp;
				<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">&nbsp;&nbsp;&nbsp;
			</a>
		</div>
	</div>
</div>


<%
}//end for
}//end if
%>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script>
	$(function() {
		var $likeBtn = $('.icon2.heart');

		$likeBtn
				.click(function() {
					$likeBtn.toggleClass('active');

					if ($likeBtn.hasClass('active')) {
						$(this)
								.find('img')
								.attr(
										{
											'src' : 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
											alt : '찜하기 완료'
										});

					} else {
						$(this).find('i').removeClass('fas').addClass('far')
						$(this)
								.find('img')
								.attr(
										{
											'src' : 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
											alt : "찜하기"
										})
					}
				})
	})
</script>

