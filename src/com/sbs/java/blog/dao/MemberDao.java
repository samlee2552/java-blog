package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int join(String loginId, String name, String nickName, String loginPw) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO member");
		sql.append(" SET regDate = NOW()");
		sql.append(", loginId = '%s'", loginId);
		sql.append(", name = '%s'", name);
		sql.append(", nickName = '%s'", nickName);
		sql.append(", loginPw = '%s'", loginPw);
		return DBUtil.insert(dbConn, sql);
	}
}