package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		super( dbConn, actionMethodName, req, resp);
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
		}

		return "";
	}

	private String doActionDoJoin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String name = req.getParameter("name");
		String nickName = req.getParameter("nickName");
		String loginPw = req.getParameter("loginPw");
		
		
		int id = memberService.join(loginId, name, nickName, loginPw);
		
		return "html:<script> alert('" + id + "번 회원이 생성되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionJoin() {
		// TODO Auto-generated method stub
		return "member/join.jsp";
	}
}

	