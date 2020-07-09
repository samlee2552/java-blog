<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="join-form-box con flex flex-jc-c">
	<form action="doJoin" method="POST" onsubmit="submitJoinForm(this); return false;">
		<input type="hidden" name="loginPwReal">
		  <div class="label">아이디
		    <div>
		      <input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="label">이름
		    <div>
		      <input name="name" type="text" placeholder="이름을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="label">닉네임
		    <div>
		      <input name="nickName" type="text" placeholder="닉네임을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="label">비밀번호
		    <div>
		      <input name="loginPw" type="password" placeholder="비밀번호 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="label">비밀번호 확인
		    <div>
		      <input name="loginPwConfirm" type="password" placeholder="비밀번호 확인.">
		    </div>
		  </div>
		   
		  <div>
		    <input type="submit" value="제출" /> <a href="list">취소</a>
		  </div>
	</form>
		
</div>

<script>
var joinFormSubmitted = false;

function submitJoinForm(form) {
  if ( joinFormSubmitted ) {
    alert('처리 중입니다.');
    return;
  }
  
  form.loginId.value = form.loginId.value.trim();
  if ( form.loginId.value.length == 0 ) {
    alert('아이디를 입력해주세요.');
    form.loginId.focus();
    
    return;
  }
  
  if ( form.loginId.value.indexOf(' ') != -1 ) {
    alert('아이디를 영문소문자와 숫자의 조합으로 입력해주세요.')
    form.loginId.focus();
    
    return;
  }
  
  form.loginPw.value = form.loginPw.value.trim();
  if ( form.loginPw.value.length == 0 ) {
    alert('비밀번호를 입력해주세요.');
    form.loginPw.focus();
    
    return;
  }
  
  form.loginPwReal.value = sha256(form.loginPw.value);
  form.loginPw.value = '';
  
  form.submit();
  joinFormSubmitted = true;
}
</script>

<%@ include file="/jsp/part/foot.jspf"%>