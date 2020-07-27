<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
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

.form .register-form {
	display: none;
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

	var JoinFormSubmitted = false;

	function submitJoinForm(form) {
		if (JoinFormSubmitted) {
			alert('처리중입니다.');
			return;
		}

		if (form.loginId.value.indexOf(' ') != -1) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}

		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.')
			form.loginId.focus();
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

		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.')
			form.name.focus();
			return;
		}

		form.nickname.value = form.nickname.value.trim();
		if (form.nickname.value.length == 0) {
			alert('닉네임을 입력해주세요.')
			form.nickname.focus();
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

		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.')
			form.loginPw.focus();
			return;
		}

		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value.length == 0) {
			alert('비밀번호를 확인해주세요.')
			form.loginPwConfirm.focus();
			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.')
			form.loginPwConfirm.focus();
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';
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

<div class="login-page">
	<div class="form">
		<form action="doJoin" method="POST" class="register-form"
			onsubmit="submitJoinForm(this); return false;">
			<h1 style="padding: 0 0 30px 0;">회원가입</h1>
			<input type="hidden" name="loginPwReal" /> <input name="loginId"
				type="text" placeholder="아이디" /> <input name="name" type="text"
				placeholder="이름" /> <input name="nickname" type="text"
				placeholder="닉네임" /> <input name="email" type="email"
				placeholder="이메일" /> <input name="loginPw" type="password"
				placeholder="비밀번호" /> <input name="loginPwConfirm" type="password"
				placeholder="비밀번호 확인" />
			<button type="submit">가입하기</button>
			<p class="message">
				회원이신가요? <a href="#">로그인</a>
			</p>
		</form>
		<form action="doLogin" method="POST" class="login-form"
			onsubmit="submitLoginForm(this); return false;">
			<input type="hidden" name="redirectUri" value="${param.afterLoginRedirectUri}" />
			<input type="hidden" name="loginPwReal" /> 
			<h1 style="padding: 0 0 30px 0;">로그인</h1>
			<input name="loginId" type="text" placeholder="아이디" /> <input
				name="loginPw" type="password" placeholder="비밀번호" />
			<button type="submit">로그인</button>
			<p class="message">
				아직 회원이 아니신가요? <a href="#">회원가입</a>
			</p>
			<p class="message">
				로그인 정보를 잊으셧나요? <a href="findLoginId_Pw">아이디/비밀번호 찾기</a>
			</p>
		</form>
	</div>
</div>

<script>
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});
</script>
<%@ include file="/jsp/part/foot.jspf"%>
