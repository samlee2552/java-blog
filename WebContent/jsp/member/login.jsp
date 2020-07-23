<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
/* cus */
.login-form-box {
	margin-top: 30px;
}
</style>

<script>
	function submitLoginForm(form) {
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.submit();
	}
</script>

<h1 align="center">로그인</h1>

<div class="login-form-box con">
	<form action="doLogin" method="POST" class="login-form form1" onsubmit="submitLoginForm(this); return false;">
	<input type="hidden" name="redirectUrl" value="${param.afterLoginRedirectUrl}" />
		<input type="hidden" name="loginPwReal" />
		<div class="form-row">
			<div class="label">아이디</div>
			<div class="input">
				<input name="loginId" type="text" placeholder="아이디를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">비밀번호</div>
			<div class="input">
				<input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label"></div>
			<div class="input">
				<input type="submit" value="로그인" /> <a href="findLoginId">아이디 / </a> <a href="findPw">비밀번호 찾기</a>
			</div>
		</div>
	</form>
</div>

<%@ include file="/jsp/part/foot.jspf"%> 