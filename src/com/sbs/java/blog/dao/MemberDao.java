package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.Map;

import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
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

	public Member getMember(String loginId, String loginPw) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM member ");
		sql.append("WHERE 1 ");
		sql.append("AND loginId = ? ", loginId);
		sql.append("AND loginPw = ? ", loginPw);

		return new Member(DBUtil.selectRow(dbConn, sql));
	}

	public String getMemberloginId() {
		SecSql sql = new SecSql();

		sql.append("SELECT loginId ");
		sql.append("FROM member ");
		sql.append("FROM member ");

		String loginId = DBUtil.selectRowStringValue(dbConn, sql);

		return loginId;
	}

	public boolean getMemberByLoginId(String loginId) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM member ");
		sql.append("WHERE loginId = ?", loginId);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);
		if (row.isEmpty()) {
			return false;
		}
		return true;
	}

	public boolean getMemberByEmail(String email) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM member ");
		sql.append("WHERE email = ?", email);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);
		if (row.isEmpty()) {
			return false;
		}
		return true;
	}

	public boolean getMemberByNickName(String nickName) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM member ");
		sql.append("WHERE nickName = ?", nickName);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);
		if (row.isEmpty()) {
			return false;
		}
		return true;
	}

}