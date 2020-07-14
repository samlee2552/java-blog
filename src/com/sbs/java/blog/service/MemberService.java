package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
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

	public void login(String loginId, String loginPw) {
		memberDao.login(loginId, loginPw);
	}
}
