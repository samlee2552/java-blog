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
  
  form.name.value=form.name.value.trim();
  if(form.name.value.length == 0) {
    alert('이름을 입력해주세요.')
    form.name.focus();
    return;
    }
  
  form.nickName.value=form.nickName.value.trim();
  if(form.nickName.value.length == 0) {
    alert('닉네임을 입력해주세요.')
    form.nickName.focus();
    return;
    }
  
  form.email.value=form.email.value.trim();
  if(form.email.value.length == 0) {
    alert('이메일을 입력해주세요.')
    form.email.focus();
    return;
    } else {
      if(!CheckEmail(form.email.value)) {
        alert('올바른 이메일 형식이 아닙니다.');
        form.email.focus();
        return;
      }
    }
  
  form.loginPw.value=form.loginPw.value.trim();
  if (form.loginPw.value.length == 0 ) {
    alert('비밀번호를 입력해주세요.')
    form.loginPw.focus();
    return;
  }
  
  form.loginPwConfirm.value=form.loginPwConfirm.value.trim();
  if (form.loginPwConfirm.value.length == 0 ) {
    alert('비밀번호를 확인해주세요.')
    form.loginPwConfirm.focus();
    return;
  }
  
  if (form.loginPw.value != form.loginPwConfirm.value ) {
    alert('비밀번호가 일치하지 않습니다.')
    form.loginPwConfirm.focus();
    return;
  }    
 
  form.submit();
  joinFormSubmitted = true;
}

function CheckEmail(str) {                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}                                

</script>

<%@ include file="/jsp/part/foot.jspf"%>