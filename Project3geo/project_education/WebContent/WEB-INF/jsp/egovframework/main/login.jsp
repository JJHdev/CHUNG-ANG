<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<html lang="ko">
	<head>
		<!-- login -->
		<script type="text/javascript" src="js/login/login.js?v=<%= System.currentTimeMillis() %>"></script>
	</head>
	<body class="mainWrap">
	<div class="part-tit">
	</div>
	<div class="part-login">
		<div class="inBox">
			<form class="form-login" name="form1" method="post" action="" role="form">
				<article><span class="icon-login"></span></article>
				<p class="txt-major">로그인을 해주세요</p>
				<p class="txt-sub">
					플랫폼의 모든 정보를<br>
					이용하기 위해서는 로그인이 필요합니다.<br>
					회원님의 로그인 정보를 입력해주세요.
				</p>
				<div class="formGroup" id="register_form">
					<div class="inputWrap id">
						<label for="user-id">아이디</label>
						<span class="icon-Man"></span>
						<input type="text" maxlength="10" name="userId" id="userId" value="" placeholder="아이디를 입력하세요" onKeyPress="if(event.keyCode==13){doLogin(this)}" >
					</div>
					<div class="inputWrap pw">
						<label for="user-pw">비밀번호</label>
						<span class="icon-Lock"></span>
						<input type="password" maxlength="10" name="userPw" id="userPw" value="" placeholder="비밀번호를 입력하세요" onKeyPress="if(event.keyCode==13){doLogin(this)}">
					</div>
				</div>
				<div class="btn-wrap">
					<a href="#" onclick="javascript:doLogin()"><span>로그인</span></a>
				</div>
			</form>
		</div>
	</div>
	<input type="hidden" id="idUserSeq" value="${sessionScope.userSeq}" />
</body>
</html>