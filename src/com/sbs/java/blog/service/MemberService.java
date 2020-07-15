package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;

public class MemberService extends Service {
	private Connection dbConn;
	private MemberDao memberDao;

	public MemberService(Connection dbConn) {
		memberDao = new MemberDao(dbConn);
	}
	
	public int join(String loginId, String name, String nickName, String email, String loginPw) {
		return memberDao.join(loginId, name, nickName, email, loginPw);
	}

	public Member getMember(String loginId, String loginPw) {
		return memberDao.getMember(loginId, loginPw);
	}

	public boolean getMemberByLoginId(String loginId) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByLoginId(loginId);
	}

	public boolean getMemberByEmail(String email) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByEmail(email);
	}

	public boolean getMemberByNickName(String nickName) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByNickName(nickName);
	}
}
