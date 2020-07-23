package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doActionJoin();
		case "doJoin":
			return doActionDoJoin();
		case "login":
			return doActionLogin();
		case "doLogin":
			return doActionDoLogin();
		case "logout":
			return doActionLogout();
		case "memberInfo":
			return doActionShowMemberInfo();
		case "findPw":
			return doActionFindPw();
		case "doFindPw":
			return doActionDoFindPw();
		case "findLoginId":
			return doActionFindLoginId();
		case "doFindLoginId":
			return doActionDoFindLoginId();
		}

		return "";
	}

	//아이디 찾기
	private String doActionDoFindLoginId() {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		// 일치하는 회원 있는지 확인
		String loginId = memberService.getMemberLoginId(name, email);
		if(loginId == null) {
			return String.format("html:<script> alert('입력하신 정보와 일치하는 회원이 없습니다.'); history.back(); </script>");
		}
		return "html:<script> alert('회원님의 아이디는 "\" + loginId + "\" 입니다.'); location.replace('login'); </script>";	
	}

	private String doActionFindLoginId() {
		// TODO Auto-generated method stub
		return "member/findLoginId.jsp";
	}
	//비밀번호 찾기, 임시비밀번호 발송
	private String doActionDoFindPw() {
		// 회원 정보 입력 받은 값
		String loginId = req.getParameter("loginId");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		// 일치하는 회원 있는지 확인
		boolean memberExists = memberService.checkMemberForFindPw(loginId, name, email);

		if (memberExists == false) {
			return String.format("html:<script> alert('입력하신 정보와 일치하는 회원이 없습니다.'); history.back(); </script>");
		}

		String title = "임시비밀번호 발급 안내.";

		String tempPw = Util.randomPassword(7);
		String body = String.join(System.getProperty("line.separator"),
				"<h1>회원님의 임시 비밀번호는 \"" + tempPw + "\" 입니다. </h1>",
				"<h3>임시 비밀번호로 로그인 후 '회원정보'에서 비밀번호를 변경해주세요.</h3>"
				);

		boolean sendMailDone = mailService.send(email, title, body) == 1;
		if(sendMailDone == false) {
			return "html:<script> alert('발송 실패.'); history.back(); </script>";	
		}
		// 임시 비밀번호로 회원정보 변경
		memberService.updatePw(loginId, tempPw);
		return "html:<script> alert('" + email + " 로 임시 비밀번호가 발송되었습니다.'); location.replace('login'); </script>";	
	}

	private String doActionFindPw() {
		// TODO Auto-generated method stub
		return "member/findPw.jsp";
	}

	private String doActionShowMemberInfo() {
		return "member/memberInfo.jsp";
	}

	private String doActionLogout() {

		session.removeAttribute("loginedMemberId");
		return "html:<script> alert('로그아웃 되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int loginedMemberId = memberService.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);

		if (loginedMemberId == -1) {
			return String.format("html:<script> alert('일치하는 정보가 없습니다.'); history.back(); </script>");
		}

		session.setAttribute("loginedMemberId", loginedMemberId);
		String redirectUrl = Util.getString(req, "redirectUrl", "../home/main");

		return String.format("html:<script> alert('로그인 되었습니다.'); location.replace('" + redirectUrl + "'); </script>");
	}

	private String doActionLogin() {
		return "member/login.jsp";
	}

	private String doActionDoJoin() {
		String loginId = req.getParameter("loginId");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String loginPw = req.getParameter("loginPwReal");

		boolean isJoinableLoginId = memberService.isJoinableLoginId(loginId);

		if (isJoinableLoginId == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 아이디 입니다.'); history.back(); </script>", loginId);
		}

		boolean isJoinableNickname = memberService.isJoinableNickname(nickname);

		if (isJoinableNickname == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 닉네임 입니다.'); history.back(); </script>", nickname);
		}

		boolean isJoinableEmail = memberService.isJoinableEmail(email);

		if (isJoinableEmail == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 이메일 입니다.'); history.back(); </script>", email);
		}

		memberService.join(loginId, name, nickname, email, loginPw);
		

		String title = "회원가입을 환영합니다.";

		String body = String.join(System.getProperty("line.separator"),
				"<h1>회원이 되신 것을 환영합니다</h1>",
				"<h3>임시 비밀번호로 로그인 후 '회원정보'에서 비밀번호를 변경해주세요.</h3>"
				);

		boolean sendMailDone = mailService.send(email, title, body) == 1;
		if(sendMailDone == false) {
			return "html:<script> alert('발송 실패.'); history.back(); </script>";	
		}

		return String.format("html:<script> alert('%s님 환영합니다.'); location.replace('../home/main'); </script>", name);
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}

	@Override
	public String getControllerName() {

		return "member";
	}
}
