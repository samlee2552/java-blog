<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<div style="display:block; text-align:center;" class="member-profile-box">
	<h1>
		이름 =
		"${loginedMember.name}"</h1>

	<h1>
		닉네임 =
		"${loginedMember.nickname}"</h1>

	<h1>
		이메일 =
		"${loginedMember.email}"</h1>

</div>

<%@ include file="/jsp/part/foot.jspf"%>