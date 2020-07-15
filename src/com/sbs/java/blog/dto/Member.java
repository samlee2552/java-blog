package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto{
	private String updateDate;
	private String loginId;
	private String loginPw;
	private String name;
	

	private String nickName;
	private String email;
	
	
	
	@Override
	public String toString() {
		return "Member [updateDate=" + updateDate + ", loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name
				+ ", nickName=" + nickName + ", email=" + email + ", dto=" + super.toString() + "]";
	}

	public Member(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.loginId = (String) row.get("loginId");
		this.loginPw = (String) row.get("loginPw");
		this.name = (String) row.get("name");
		this.nickName = (String) row.get("nickName");
		this.email = (String) row.get("email");
	}
	
	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPw() {
		return loginPw;
	}

	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
