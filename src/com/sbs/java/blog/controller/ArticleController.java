package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.Util;

public class ArticleController extends Controller {
	public ArticleController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	public String doAction() {
		switch (actionMethodName) {
		case "list":
			return doActionList();
		case "detail":
			return doActionDetail();
		case "doWrite":
			return doActionDoWrite();
		case "write":
			return doActionWrite();
		case "doWriteReply":
			return doActionWriteReply();
		}

		return "";
	}
	//댓글 작성
	private String doActionWriteReply() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}
		int articleId = Util.getInt(req, "id");


//		Article article = articleService.getArticleById(id);
		
//		int articleId = article.getId();
		String body = req.getParameter("body");
		
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		Member member = articleService.getMemberById(loginedMemberId);
		String memberNickname = member.getNickname();
		
//		articleService.increaseArticleReplyId(id);
		
		articleService.writeReply(articleId, memberNickname, body);
		
		return "html:<script> alert('댓글이 등록되었습니다!'); location.replace('detail?id=" + articleId + "'); </script>";
	}

	private String doActionWrite() {
		return "article/write.jsp";
	}
	// 글 쓰기
	private String doActionDoWrite() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");
		
		int loginedMemberId = (int)req.getAttribute("loginedMemberId");
		
		int id = articleService.write(cateItemId, title, body, loginedMemberId);
		
		return "html:<script> alert('" + id + "번 게시물이 생성되었습니다!'); location.replace('list'); </script>";
	}
	// 글 상세보기
	private String doActionDetail() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		articleService.increaseHit(id);
		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("article", article);
		
		List<ArticleReply> articleReplies = articleService.getArticleRepliesByArticleId(id);
		
		req.setAttribute("articleReplies", articleReplies);


		return "article/detail.jsp";
	}
	//게시물 리스팅
	private String doActionList() {
		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "전체";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}
		req.setAttribute("cateItemName", cateItemName);

		String searchKeywordType = "";

		if (!Util.empty(req, "searchKeywordType")) {
			searchKeywordType = Util.getString(req, "searchKeywordType");
		}

		String searchKeyword = "";

		if (!Util.empty(req, "searchKeyword")) {
			searchKeyword = Util.getString(req, "searchKeyword");
		}

		int itemsInAPage = 10;
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);

		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		req.setAttribute("articles", articles);
		return "article/list.jsp";
	}

	@Override
	public String getControllerName() {
		return "article";
	}
}