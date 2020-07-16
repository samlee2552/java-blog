<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ include file="/jsp/part/head.jspf"%>

	
	<h1> 이름 = <% loginedMember.getName(); %></h1>
	<h1> 닉네임 = <% loginedMember.getNickname(); %></h1>
	<h1> 이메일 = <% loginedMember.getEmail(); %></h1>

	<%@ include file="/jsp/part/foot.jspf"%>