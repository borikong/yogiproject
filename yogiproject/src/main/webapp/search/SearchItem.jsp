<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.dest.db.*" %>
<jsp:useBean id="dao" class="net.dest.db.DestDAO"></jsp:useBean>

<!-- include 하는 페이지 기준으로 경로를 설정해 주어야 함!! -->
<!-- <link rel="stylesheet" href="search/css/style2.css"> -->
<!-- <link rel="stylesheet" href="search/css/animate.css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<%

Vector<DestVO> destList=dao.getDestList();
for (int i = 0; i < destList.size(); i++) {
	DestVO vo=destList.elementAt(i);
%>


<div class="resume-wrap d-flex ftco-animate">
	<div class="text pl-3">
<!-- 		여행지 이미지 -->
		<img src="<%=vo.getDEST_IMG()%>" class="rounded float-start" alt="destimg" id="dest_img" width="400px">
<!-- 		여행지 상세페이지 -->
		<h2 onclick="location.href='search/TravelView.jsp'"
			onMouseover="this.style.color='#3e64ff';"
			onMouseout="this.style.color='black';" style="cursor: pointer;"
			id="dest_name">
			<span class="rgyBadge" style="font-size: 1.1rem"><%=vo.getDEST_COUNTRY() %></span>&nbsp;<%=vo.getDEST_NAME() %>&nbsp;&nbsp;<span
				class="date" id="name_eng"><%=vo.getDEST_NAME_ENG()%></span>
		</h2>

		<div>
			
			<a href="javascript:;"
				class="icon2 heart" style="background-color: rgba(255, 255, 255, 0.8);   position: absolute; top: 15px; left : 32px; border-radius : 15px;">&nbsp;&nbsp;
				<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
				alt="찜하기">&nbsp;&nbsp;</a>

		</div>

		<div>
			<span class="position" id="country">비용</span>
			<progress value="<%=vo.getDEST_MONEY()*10%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position" id="country">경치</span>
			<progress value="<%=vo.getDEST_LANDSCAPE()*10%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position" id="country">재미</span>
			<progress value="<%=vo.getDEST_FUN()*10%>" max="100" id="pg"></progress>
		</div>


<%-- 		<jsp:include page="/search/pgbar.jsp"></jsp:include> --%>
		<p id="content_preview"><%=vo.getDEST_CONTENT() %></p>
	</div>
</div>


<%
}
%>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="js/main.js"></script>
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

