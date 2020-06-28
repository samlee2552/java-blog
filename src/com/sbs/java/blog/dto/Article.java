package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {

	private String updateDate;
	private String title;
	private String body;
	
	public Article(Map<String, Object> row) {
		super(row);
		this.updateDate = (String)row.get("updateData");
		this.title = (String)row.get("title");
		this.body = (String)row.get("body");
	}

	@Override
	public String toString() {
		return String.format("Article [id=%d, regDate=%s, updateDate=%s, title=%s, body=%s]\n", getId(),  getUpdateDate(), getTitle(), getBody());
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

}
