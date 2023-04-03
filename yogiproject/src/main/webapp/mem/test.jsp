<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginID" value='<%=(String)session.getAttribute("loginID")%>'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="mypage.css" rel="stylesheet" type="text/css">
<link href="regform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<form action="member.me?cmd=modifyProc" method="post" name="regForm">
<c:choose>
<c:when test="${loginID ne null}">

	<div class="mp-in">
		<c:out value="${loginID}"/>님 환영합니다.
		<a href="mem.me?cmd=logout" class="button">로그아웃</a>
	</div>
	
	<div class="mypage">

		<div class="mp_left">
			<div class="left-header">마이페이지</div>
			<ul>
				<li>
					<a class="mp-a" href="mypage.jsp">
						찜리스트
						<span class="mp_span">&gt;</span>
					</a>
				</li>
				<li>
					<a class="active mp-a" href="modifyForm.jsp">
						정보수정
						<span class="mp_span">&gt;</span>
					</a>
				</li>
				<li>
					<a class="mp-a" href="deleteForm.jsp"> 
						회원탈퇴
						<span class="mp_span">&gt;</span>
					</a>
				</li>
			</ul>

			<a class="left-a" href="#">	
				<div class="left-bottom">			
					<span>도움이 필요하신가요 ?</span>
					<span class="left-s">문의하기</span>	
				</div>			
			</a>
		</div>


		<div class="mp_right">
		
			<div class="right-header">
				<h2>정보수정</h2>
			</div>
			
			<div class="r-border"></div>
			
			
			<!-- 정보수정 -->
			<div class="mp-box">
				<div class="article-modify">
					<span class="red_span">*</span>필수입력사항
				</div>

				<div>

					<div class="div1">
						<div class="left">
							<label class="l_label">아이디<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="hidden" name="id" value="${id}">
							<c:out value="${id}" />
							
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="변경할 비밀번호를 입력해주세요"
								type="password" name="pass" value="${pass}">
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">비밀번호확인<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="비밀번호를 한번 더 입력해주세요"
								type="password" name="repass" value="${pass}">
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이름<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="hidden" name="name" value="${name}">
							<c:out value="${name}"></c:out>
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">이메일<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="이메일을 입력해주세요" type="text"
								name="email" value="${email}">
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">휴대폰</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="숫자만 입력해주세요" type="text"
								name="phone" value="${phone}">
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">우편번호<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text" name="zipcode" value="${zipcode}">
						</div>
						<div class="right">
							<input class="b_right" type="button" value="찾기" onclick="zipCheck()">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">주소<span class="red_span">*</span></label>
						</div>
						<div class="center">
							<input class="c_input" type="text" name="address1"
								value="${address1}">
						</div>
						<diV class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="div1">
						<div class="left">
							<label class="l_label">상세주소</label>
						</div>
						<div class="center">
							<input class="c_input" placeholder="상세주소를 입력해주세요" type="text" name="address2" value="${address2}">
						</div>
						<div class="right">
							<input class="w_right" type="button">
						</div>
					</div>

					<div class="c_bottom">
						<input class="c_button" type="button" value="정보수정" onclick="updateCheck()">
					</div>

				</div>
			
			</div>
		
		</div>

	</div>

</c:when>
</c:choose>
</form>
</body>
</html>