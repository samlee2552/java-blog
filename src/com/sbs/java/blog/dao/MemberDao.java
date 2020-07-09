package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int join(String loginId, String loginPw, String name, String nickName) {
		String sql = "";

		sql += String.format("INSERT INTO article ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", loginId = '%s' ", loginId);
		sql += String.format(", loginPw = '%s' ", loginPw);
		sql += String.format(", name = '%s'", name);
		sql += String.format(", nickName = '%s';", nickName);
		return DBUtil.insert(dbConn, sql);
	}
	
	
}
