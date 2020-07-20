package com.sbs.java.blog.dto;

import java.util.Map;

public class ArticleReply extends Dto {
	private String updateDate;
	private int articleId;
	private String memberNickname;
	private String body;
	private int like;
	
	public ArticleReply(Map<String, Object> row) {
		super(row);

		this.updateDate = (String) row.get("updateDate");
		this.articleId = (int) row.get("articleId");
		this.memberNickname = (String) row.get("memberNickname");
		this.body = (String) row.get("body");
		this.like = (int) row.get("like");
		
	}
	
	@Override
	public String toString() {
		return "ArticleReply [updateDate=" + updateDate + ", articleId=" + articleId + ", memberId=" + memberNickname
				+ ", body=" + body + ", like=" + like + ", dto=" + super.toString() + "]";
	}

	public int getArticleId() {
		return articleId;
	}


	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}


	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}


	public int getLike() {
		return like;
	}


	public void setLike(int like) {
		this.like = like;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}


	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
	
	
	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:script-->");
	}
}