package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int join(String loginId, String name, String nickname, String email, String loginPw) {
		SecSql sql = SecSql.from("INSERT INTO member");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", loginId = ?", loginId);
		sql.append(", name = ?", name);
		sql.append(", nickname = ?", nickname);
		sql.append(", email = ?", email);
		sql.append(", loginPw = ?", loginPw);
		return DBUtil.insert(dbConn, sql);
	}

	//이렇게 selectRowBooleanValue 로 쓸수 도 있다
	public boolean isJoinableLoginId(String loginId) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	public boolean isJoinableNickname(String nickname) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE nickname = ?", nickname);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	public boolean isJoinableEmail(String email) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE email = ?", email);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	//로그인 확인
	public int getMemberIdByLoginIdAndLoginPw(String loginId, String loginPw) {
		SecSql sql = SecSql.from("SELECT id");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);
		sql.append("AND loginPw = ?", loginPw);

		return DBUtil.selectRowIntValue(dbConn, sql);
	}

	public Member getMemberById(int id) {
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM `member`");
		sql.append("WHERE id = ?", id);

		return new Member(DBUtil.selectRow(dbConn, sql));
	}

	public boolean checkMemberForFindPw(String loginId, String name, String email) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);
		sql.append("AND name = ?", name);
		sql.append("AND email = ?", email);

		return DBUtil.selectRowIntValue(dbConn, sql) == 1;
	}

	public int updatePw(String loginId, String loginPw) {
		SecSql sql = SecSql.from("UPDATE `member`");
		sql.append("SET loginPw = SHA2(?, 256)", loginPw);
		sql.append("WHERE loginId = ?", loginId);
		
		return DBUtil.update(dbConn, sql);
	}

	public String getMemberLoginId(String name, String email) {
		SecSql sql = SecSql.from("SELECT loginId");
		sql.append("FROM `member`");
		sql.append("WHERE name = ?", name);
		sql.append("AND email = ?", email);
		return DBUtil.selectRowStringValue(dbConn, sql);
	}
}