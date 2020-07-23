<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>
/* cus */
.findPw-form-box {
	margin-top: 30px;
}
</style>
<h1 align="center">비밀번호 찾기</h1>

<div class="findPw-form-box con">
	<form action="doFindPw" method="POST" class="findPw-form form1"
		onsubmit="submitFindPwForm(this); return false;">
		<div class="form-row">
			<div class="label">아이디</div>
			<div class="input">
				<input name="loginId" type="text" placeholder="아이디를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">이름</div>
			<div class="input">
				<input name="name" type="text" placeholder="이름을 입력해주세요." />
			</div>
		</div>

		<div class="form-row">
			<div class="label">이메일</div>
			<div class="input">
				<input name="email" type="email" placeholder="이메일을 입력해주세요." />
			</div>
		</div>

		<div class="form-row">
			<div class="label"></div>
			<div class="input">
				<input type="submit" value="임시 비밀번호 발송" /> <a href="findLoginId">아이디 찾기</a>
			</div>
		</div>
	</form>
</div>

<script>
	var FindPwFormSubmitted = false;

	function submitFindPwForm(form) {
		if (FindPwFormSubmitted) {
			alert('처리중입니다.');
			return;
		}

		if (form.loginId.value.indexOf(' ') != -1) {
			alert('아이디는 영문 소문자와 숫자의 조합입니다.');
			form.loginId.focus();
			return;
		}

		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.')
			form.loginId.focus();
			return;
		}

		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.')
			form.name.focus();
			return;
		}

		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.')
			form.email.focus();
			return;
		} else {
			if (!CheckEmail(form.email.value)) {
				alert('올바른 이메일 형식이 아닙니다.');
				form.email.focus();
				return;
			}
		}

		form.submit();
	}

	function CheckEmail(str) {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!reg_email.test(str)) {
			return false;
		} else {
			return true;
		}
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>