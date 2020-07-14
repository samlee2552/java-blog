package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int join(String loginId, String name, String nickName, String email, String loginPw) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO member");
		sql.append(" SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", loginId = ?", loginId);
		sql.append(", name = ?", name);
		sql.append(", nickName = ?", nickName);
		sql.append(", email = ?", email);
		sql.append(", loginPw = ?", loginPw);
		return DBUtil.insert(dbConn, sql);
	}

	public void login(String loginId, String loginPw) {
		Se
	}
}