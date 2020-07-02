package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

public class ArticleDao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public List<Article> getForPrintListArticles(int itemsPerPage,int page, int cateItemId) {
		String sql = "";
		
		int limitFrom = (page - 1) * itemsPerPage;
		
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}
		sql += String.format("ORDER BY id DESC ");
		sql += String.format("LIMIT %d, %d ", limitFrom, itemsPerPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();
		
		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}
		
		return articles;
	}

	public Article getForPrintArticle(int id) {
		String sql = "";
		
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		sql += String.format("AND id = %d;", id);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);
		
		return new Article(row);
	}

	public int getArticlesCount(int cateItemId) {
		String sql = "";
		
		sql += String.format("SELECT COUNT(*) ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d;", cateItemId);
		}
		
		int count = DBUtil.selectRowIntValue(dbConn, sql);
		return count;
	}
}
