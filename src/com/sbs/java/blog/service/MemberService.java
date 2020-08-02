package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {
	private MailService mailService;
	private MemberDao memberDao;

	public MemberService(Connection dbConn, MailService mailService) {
		this.mailService = mailService;
		memberDao = new MemberDao(dbConn);
	}
	
	//회원가입
	public int join(String loginId, String loginPw, String name, String nickname, String email) {
		
		int id = memberDao.join(loginId, loginPw, name, nickname, email);

		mailService.send(email, "가입을 환영합니다.", "<a href=\"https://samlee.my.iu.gy/\" target=\"_blank\">사이트로 이동</a>");
		return id;
	}


	/*회원가입시 데이터 중복체크*/
	public boolean isJoinableLoginId(String loginId) {
		return memberDao.isJoinableLoginId(loginId);
	}

	
	public boolean isJoinableNickname(String nickname) {
		return memberDao.isJoinableNickname(nickname);
	}

	public boolean isJoinableEmail(String email) {
		return memberDao.isJoinableEmail(email);
	}
	//끝
	
	//회원가입시 중복체크
	public int getMemberIdByLoginIdAndLoginPw(String loginId, String loginPw) {
		return memberDao.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);
	}

	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}
	//비밀번호 찾기
	public boolean checkMemberForFindPw(String loginId, String name, String email) {
		return memberDao.checkMemberForFindPw(loginId, name, email);
	}
	//비밀번호 변경
	public int updatePw(String loginId, String loginPw) {
		return memberDao.updatePw(loginId, loginPw);
	}
	//아이디 찾기
	public String getMemberLoginId(String name, String email) {
		return memberDao.getMemberLoginId(name, email);
	}
}
