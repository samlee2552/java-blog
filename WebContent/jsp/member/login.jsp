<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<div class="login-box con flex flex-jc-c">
	<form action="doLogin" method="POST" onsubmit="submitLoginForm(this); return false;">
  <div>아이디</div>
  <div>
    <input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
  </div>
    <div>비밀번호</div>
  <div>
    <input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요.">
  </div>
  <div>
    <input type="submit" value="제출">
  </div>
</form>
</div>


<script>
var LoginFormSubmitted = false;

function submitLoginForm(form){
  if (LoginFormSubmitted ) {
    alert('처리중입니다.');
    return;
  }
  
  if( form.loginId.value.indexOf(' ') != -1 ) {
      alert('아이디를 영문 소문자와 숫자의 조합으로 입력해주세요.');
     form.loginId.focus();
    return;
  }
  
  form.loginId.value=form.loginId.value.trim();
  if (form.loginId.value.length == 0 ) {
    alert('아이디를 입력해주세요.')
    form.loginId.focus();
    return;
  }
  
  
  form.loginPw.value=form.loginPw.value.trim();
  if (form.loginPw.value.length == 0 ) {
    alert('비밀번호를 입력해주세요.')
    form.loginPw.focus();
    return;
  }
  
  form.submit();
  LoginFormSubmitted = true;
}
</script>
<%@ include file="/jsp/part/foot.jspf"%>