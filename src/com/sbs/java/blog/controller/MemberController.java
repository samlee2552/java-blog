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
		case "doJoin":
			return doActionDoJoin();
		case "join":
			return doActionJoin();
		case "doLogin":
			return doActionDoLogin();
		case "login":
			return doActionLogin();
		case "logout":
			return doActionLogout();
		case "memberInfo":
			return doActionShowMemberInfo();
		case "findLoginId":
			return doActionFindLoginId();
		case "doFindLoginId":
			return doActionDoFindLoginId();
		case "findLoginPw":
			return doActionFindLoginPw();
		case "doFindPw":
			return doActionDoFindPw();
		}

		return "";
	}

	// jsp 주소 리턴 메서드 시작
	private String doActionFindLoginPw() {
		return "member/findLoginPw.jsp";
		}

	private String doActionFindLoginId() {
		return "member/findLoginId.jsp";
	}

	private String doActionShowMemberInfo() {
		return "member/memberInfo.jsp";
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}
	
	private String doActionLogin() {
		return "member/login.jsp";
	}
	
	// jsp 주소 리턴 메서드 끝
	
	//아아디 찾기
	private String doActionDoFindLoginId() {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		// 일치하는 회원 있는지 확인
		String loginId = memberService.getMemberLoginId(name, email);
		if (loginId == "") {
			return String.format("html:<script> alert('입력하신 정보와 일치하는 회원이 없습니다.'); history.back(); </script>");
		}
		return "html:<script> alert('회원님의 아이디는 " + loginId + " 입니다.'); location.replace('login_join'); </script>";
	}

	// 비밀번호 찾기, 임시비밀번호 발송
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
				"<h1>회원님의 임시 비밀번호는 \"" + tempPw + "\" 입니다. </h1>", "<h3>임시 비밀번호로 로그인 후 '회원정보'에서 비밀번호를 변경해주세요.</h3>");

		boolean sendMailDone = mailService.send(email, title, body) == 1;
		if (sendMailDone == false) {
			return "html:<script> alert('메일 발송 실패.'); history.back(); </script>";
		}
		// 임시 비밀번호로 회원정보 변경
		memberService.updatePw(loginId, tempPw);
		return "html:<script> alert('" + email + " 로 임시 비밀번호가 발송되었습니다.'); location.replace('login_join'); </script>";
	}

	// 로그아웃
	private String doActionLogout() {
		session.removeAttribute("loginedMemberId");
		return "html:<script> alert('로그아웃 되었습니다.'); location.replace('../home/main'); </script>";
	}
	// 로그인
	private String doActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int loginedMemberId = memberService.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);

		if (loginedMemberId == -1) {
			return String.format("html:<script> alert('일치하는 정보가 없습니다.'); history.back(); </script>");
		}

		session.setAttribute("loginedMemberId", loginedMemberId);
		String redirectUri = Util.getString(req, "redirectUri", "../home/main");

		return String.format("html:<script> alert('로그인 되었습니다.'); location.replace('" + redirectUri + "'); </script>");
	}
	//회원가입
	private String doActionDoJoin() {
		String loginId = req.getParameter("loginId");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");	
		String email = req.getParameter("email");
		String loginPw = req.getParameter("loginPwReal");
		//조건 검사 시작
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
		//조건 검사 끝
		memberService.join(loginId, name, nickname, email, loginPw);

		String title = "회원가입을 환영합니다!.";

		String body = String.join(System.getProperty("line.separator"), "<h1>회원이 되신 것을 환영합니다~!!!</h1>",
				"<h3>" + name + " 회원님의 가입을 축하합니다~! 감사합니다!.</h3>", "<a href=\"https://samlee.my.iu.gy/\" target=\"_blank\">사이트로 이동</a>"); 

		boolean sendMailDone = mailService.send(email, title, body) == 1;
		if (sendMailDone == false) {
			return "html:<script> alert('메일 발송 실패.'); history.back(); </script>";
		}

		return String.format("html:<script> alert('%s님, 회원이 되신것을 환영합니다.'); location.replace('../home/main'); </script>", name);
	}

	@Override
	public String getControllerName() {

		return "member";
	}
}
