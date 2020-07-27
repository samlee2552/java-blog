package com.sbs.java.blog.dto;

import java.util.Map;

/**
 * @author SBS-
 *
 */
public class ArticleReply extends Dto {
	private int articleId;
	private String updateDate;
	private int memberId;
	private String body;
	private String memberNickName;

	public ArticleReply(Map<String, Object> row) {
		super(row);

		this.articleId = (int) row.get("articleId");
		this.updateDate = (String) row.get("updateDate");
		this.memberId = (int) row.get("memberId");
		this.body = (String) row.get("body");
		this.memberNickName = (String) row.get("memberNickName");
	}

	@Override
	public String toString() {
		return "ArticleReply [articleId=" + articleId + ", updateDate=" + updateDate + ", memberId=" + memberId
				+ ", body=" + body + ", getId()=" + getId() + ", getRegDate()=" + getRegDate() + ", getExtra()="
				+ getExtra() + "]";
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
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

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

}