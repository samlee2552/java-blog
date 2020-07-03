package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;

public class ArticleService {
	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
	}


	public List<Article> getForPrintListArticles(int itemsPerPage, int page, int cateItemId) {
		return articleDao.getForPrintListArticles(itemsPerPage, page, cateItemId);
	}


	public Article getForPrintArticle(int id) {
		return articleDao.getForPrintArticle(id);
	}


	public int getArticlesCount(int cateItemId) {
		return articleDao.getArticlesCount(cateItemId);
	}


	public String getBoardName(int cateItemId) {
		return articleDao.getBoardName(cateItemId);
	}
}
