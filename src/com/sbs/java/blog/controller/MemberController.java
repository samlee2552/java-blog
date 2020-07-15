package com.sbs.java.blog.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Member;
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
		case "login":
			return doActionLogin(req, resp);
		case "doLogin":
			return doActionDoLogin(req, resp);
		case "logout":
			return doActionLogout(req, resp);
		}

		return "";
	}

	private String doActionLogout(HttpServletRequest req, HttpServletResponse resp) {
		
		session.removeAttribute("loginedMemberId");
		return "html:<script> alert('로그아웃 되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionDoLogin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		
		
		Member member = memberService.getMember(loginId, loginPw);
		if(member != null) {
			session.setAttribute("loginedMemberId", member.getId());
			
			return "html:<script> alert('" + member.getNickName() + "님 환영합니다.'); location.replace('../home/main'); </script>";

		} else {
			return "html:<script> alert('아이디와 비밀번호를 확인 바랍니다.'); location.replace('/member/login'); </script>";			
		}
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
		
		String checkInfo = checkMemberInfo(loginId, nickName, email);
		int id = memberService.join(loginId, name, nickName, email, loginPw);
		
		return "html:<script> alert('" + id + "번 회원이 생성되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String checkMemberInfo(String loginId, String nickName, String email) {
		if(checkMemberbyLoginId(loginId)) {
			return "html:<script> alert('이미 사용중인 아이디 입니다.'); location.replace('join'); </script>";	
		}
		if(checkMemberbyNickName(nickName)) {
			return "html:<script> alert('이미 사용중인 닉네임 입니다.'); location.replace('join'); </script>";	
		}
		if(checkMemberbyEmail(email)) {
			return "html:<script> alert('이미 사용중인 닉네임 입니다.'); location.replace('join'); </script>";	
		}
		return "";
	}

	private boolean checkMemberbyEmail(String email) {
		return memberService.getMemberByEmail(email);
	}

	private boolean checkMemberbyNickName(String nickName) {
		return memberService.getMemberByNickName(nickName);
	}

	private boolean checkMemberbyLoginId(String loginId) {
		return memberService.getMemberByLoginId(loginId);
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}
}

	