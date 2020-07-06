package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto{
	private String updateDate;
	private String title;
	private String body;
	private String cateItemId;

	public Article(Map<String, Object> row) {
		super(row);
		
		this.updateDate = (String) row.get("updateDate");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");		
	}
	
	public String getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(String cateItemId) {
		this.cateItemId = cateItemId;
	}

	public String getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return String.format("%n게시번호 : %d 제목 : %s%n게시 날짜 : %s 업데이트 날짜 : %s%n내용 : %s%n%n "+super.toString(),getId(), getTitle(), getRegDate(),getUpdateDate(), body);
	}


}