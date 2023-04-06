<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="${pageContext.request.contextPath}/common/css/popular_sub.css" rel="stylesheet">

<div class="pop-main">
	<h2 class="heading">인기 여행지</h2>


	<c:if test="${poplist ne null}">
		<div class="row">
			<c:forEach var="vo" items="${poplist}">
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img style="height: 200px;" src="${vo.DEST_IMG}" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title" style="height: 50px;">${vo.DEST_NAME}</h5>
							<p class="card-text" style="height: 50px;">${vo.getDEST_TAG_STR()}</p>
							<a href="${pageContext.request.contextPath}/search_main/GetDestDetailView.de?dest_name=${vo.DEST_NAME}" class="btn-main">상세 보기</a>
							<img style="margin-left : 10px; padding-bottom: 5px;" src="${pageContext.request.contextPath}/common/pic/heart2.png">
							<span class="destcnt">${vo.DEST_CNT }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>
