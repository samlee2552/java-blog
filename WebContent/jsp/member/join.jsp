<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>

</style>

<form action="~member/doLogin" method="POST">
	<input type="text" name="loginId" />
	<input type="text" name="name" />
	<input type="text" name="nickName" />
	<input type="text" name="loginPw" />
	<input type="text" name="loginPwConfirm" />
	<input type="submit" value="로그인" />	
</form>

<%@ include file="/jsp/part/foot.jspf"%>