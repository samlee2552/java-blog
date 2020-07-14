<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>

</style>

<div class="join-box con flex flex-jc-c">
	<form action="doJoin" method="POST" onsubmit="submitJoinForm(this); return false;">
<input type="hidden" name="loginPwReal">
  <div>아이디</div>
  <div>
    <input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
  </div>
  <div>이름</div>
  <div>
    <input name="name" type="text" placeholder="이름을 입력해주세요.">
  </div>
    <div>닉네임</div>
  <div>
    <input name="nickName" type="text" placeholder="닉네임을 입력해주세요.">
  </div>
    <div>이메일</div>
  <div>
    <input name="email" type="text" placeholder="이메일을 입력해주세요.">
  </div>
    <div>비밀번호</div>
  <div>
    <input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요.">
  </div>
    <div>비밀번호 확인</div>
  <div>
    <input name="loginPwConfirm" type="password" placeholder="비밀번호를 재입력해주세요.">
  </div>
  <div>
    <input type="submit" value="제출">
  </div>
</form>
	
</div>

<script>
var JoinFormSubmitted = false;

function submitJoinForm(form){
  if (JoinFormSubmitted ) {
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
  joinFormSubmitted = true;
}
</script>

<%@ include file="/jsp/part/foot.jspf"%>