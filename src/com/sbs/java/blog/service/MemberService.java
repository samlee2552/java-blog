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
	
	public int write(String loginId, String loginPw, String name, String nickName) {
		String sql = "";

		sql += String.format("INSERT INTO article ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", loginId = '%s' ", loginId);
		sql += String.format(", loginPw = '%s' ", loginPw);
		sql += String.format(", name = '%s'", name);
		sql += String.format(", nickName = '%s' ", nickName);
	

		return DBUtil.insert(dbConn, sql);
	}
}
