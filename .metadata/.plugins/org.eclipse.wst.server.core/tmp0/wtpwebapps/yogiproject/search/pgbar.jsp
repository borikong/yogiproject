<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		<div>
			<span class="position" id="country">비용</span>
			<progress value="<%=vo.getDEST_MONEY() * 10%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position" id="country">경치</span>
			<progress value="<%=vo.getDEST_LANDSCAPE() * 10%>" max="100" id="pg"></progress>
		</div>
		<div>
			<span class="position" id="country">재미</span>
			<progress value="<%=vo.getDEST_FUN() * 10%>" max="100" id="pg"></progress>
		</div>
