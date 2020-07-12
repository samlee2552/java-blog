package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int join(String loginId, String name, String nickName, String loginPw) {
		String sql = "";

		sql += String.format("INSERT INTO member");
		sql += String.format(" SET regDate = NOW()");
		sql += String.format(", loginId = '%s'", loginId);
		sql += String.format(", name = '%s'", name);
		sql += String.format(", nickName = '%s'", nickName);
		sql += String.format(", loginPw = '%s'", loginPw);
		return DBUtil.insert(dbConn, sql);
	}
	
	
}
