<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.find-page {
	width: 360px;
	padding: 0 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	border-radius: 5px;
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	border-radius: 5px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #0082c8;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
	border-radius: 5px;
}

.form button:hover, .form button:active, .form button:focus {
	background: #0090DD;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #BA9A18;
	text-decoration: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #00000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}
/* cus */
</style>

<script>

	var FindPwFormSubmitted = false;

	function submitFindPwForm(form) {
		if (FindPwFormSubmitted) {
			alert('처리중입니다.');
			return;
		}

		if (form.loginId.value.indexOf(' ') != -1) {
			alert('아이디는 공백을 포함할 수 없습니다.');
			form.loginId.focus();
			return;
		} else {
			if (!CheckLoginId(form.loginId.value)) {
				alert('아이디는 영문 소문자와 숫자로만 입력 가능합니다. \n길이는 4자 이상, 15자 이하여야 합니다');
				form.loginId.focus();
				return;
			}
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

	function CheckLoginId(str) {
		var reg_loginId = /^[A-Za-z0-9+]{4,15}$/;
		if (!reg_loginId.test(str)) {
			return false;
		} else {
			return true;
		}
	}
</script>
<div class="find-page">
	<div class="form">
		<form action="doFindPw" method="POST" class="findPw-form"
			onsubmit="submitFindPwForm(this); return false;">
			<h1 style="padding: 0 0 30px 0;">비밀번호 찾기</h1>
			<input name="loginId" type="text" placeholder="아이디" /> <input
				name="name" type="text" placeholder="이름" /> <input name="email"
				type="email" placeholder="이메일" />
			<button type="submit">비밀번호 찾기</button>
			<p class="message">
				아이디를 잊으셨나요? <a href="findLoginId">아이디 찾기</a>
			</p>
			<p class="message">
				비밀번호를 찾으셨나요?<a href="login">로그인</a>
			</p>
		</form>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>
