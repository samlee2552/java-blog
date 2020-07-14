package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		super( dbConn, actionMethodName, req, resp, session);
	}
	
	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doActionJoin();
		case "doJoin":
			return doActionDoJoin(req, resp);
		case "login":
			return doActionLogin(req, resp);
		case "doLogin":
			return doActionDoLogin(req, resp);
		}

		return "";
	}

	private String doActionDoLogin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		
		session.setAttribute("loginedMemberId", 1);
		
		memberService.login(loginId, loginPw);
		return "html:<script> alert('" + loginId + "님 환영합니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionLogin(HttpServletRequest req, HttpServletResponse resp) {	
		return "member/login.jsp";
	}

	private String doActionDoJoin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String name = req.getParameter("name");
		String nickName = req.getParameter("nickName");
		String email = req.getParameter("email");
		String loginPw = req.getParameter("loginPw");
		
		
		int id = memberService.join(loginId, name, nickName, email, loginPw);
		
		return "html:<script> alert('" + id + "번 회원이 생성되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}
}

	