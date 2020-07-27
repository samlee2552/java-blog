package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

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

		case "doDelete":
			return doActionDoDelete();
		case "modify":
			return doActionModify();
		case "doModify":
			return doActionDoModify();
		// 댓글
		case "doWriteReply":
			return doActionDoWriteReply();
		case "doModifyReply":
			return doActionDoModifyReply();
		case "modifyReply":
			return doActionModifyReply();
		}

		return "";
	}

	private String doActionDoModify() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		Map<String, Object> getCheckRsModifyAvailableRs = articleService.getCheckRsModifyAvailable(id, loginedMemberId);

		if (Util.isSuccess(getCheckRsModifyAvailableRs) == false) {
			return "html:<script> alert('" + getCheckRsModifyAvailableRs.get("msg") + "'); history.back(); </script>";
		}

		int cateItemId = Util.getInt(req, "cateItemId");
		String title = Util.getString(req, "title");
		String body = Util.getString(req, "body");

		articleService.modifyArticle(id, cateItemId, title, body);

		return "html:<script> alert('" + id + "번 게시물이 수정되었습니다.'); location.replace('detail?id=" + id + "'); </script>";
	}

	private String doActionModify() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		Article article = articleService.getForPrintArticle(id, loginedMemberId);

		req.setAttribute("article", article);

		return "article/modify.jsp";
	}

	// 댓글 작성
	private String doActionDoWriteReply() {
		if (Util.empty(req, "articleId")) {
			return "html:articleId를 입력해주세요.";
		}
		if (Util.isNum(req, "articleId") == false) {
			return "html:articleId를 정수로 입력해주세요.";
		}
		int articleId = Util.getInt(req, "articleId");
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		String memberNickname = member.getNickname();
		String body = Util.getString(req, "body");
		String redirectUri = Util.getString(req, "redirectUri");

		
		int id = articleService.writeArticleReply(articleId, memberNickname, body);
		redirectUri = Util.getNewUri(redirectUri, "lastWorkArticleReplyId", id + "");

		return "html:<script> alert('" + id + "번 댓글이 작성되었습니다.'); location.replace('" + redirectUri + "'); </script>";
	}

	private String doActionDoModifyReply() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");
		String body = Util.getString(req, "body");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		Map<String, Object> getReplyCheckRsModifyAvailableRs = articleService.getReplyCheckRsModifyAvailable(id,
				loginedMemberId);

		if (Util.isSuccess(getReplyCheckRsModifyAvailableRs) == false) {
			return "html:<script> alert('" + getReplyCheckRsModifyAvailableRs.get("msg")
					+ "'); history.back(); </script>";
		}

		articleService.modifyArticleReply(id, body);

		String redirectUri = Util.getString(req, "redirectUri", "list");

		redirectUri = Util.getNewUri(redirectUri, "lastWorkArticleReplyId", id + "");

		return "html:<script> alert('" + id + "번 댓글이 수정되었습니다.'); location.replace('" + redirectUri + "'); </script>";
	}

	private String doActionModifyReply() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		ArticleReply articleReply = articleService.getArticleReply(id);
		req.setAttribute("articleReply", articleReply);

		Article article = articleService.getForPrintArticle(articleReply.getArticleId(), loginedMemberId);
		req.setAttribute("article", article);

		return "article/modifyReply.jsp";
	}

	private String doActionWrite() {
		return "article/write.jsp";
	}

	// 글 쓰기
	private String doActionDoWrite() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

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
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		Article article = articleService.getForPrintArticle(id, loginedMemberId);

		req.setAttribute("article", article);

		List<ArticleReply> articleReplies = articleService.getArticleRepliesByArticleId(id);

		req.setAttribute("articleReplies", articleReplies);

		return "article/detail.jsp";
	}

	// 게시물 리스팅
	private String doActionList() {
		long startTime = System.nanoTime();
		
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
		int blockCount = 5;
		
		//페이지당 게시물 10개
		// 총 게시물 수
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		// 총 페이지 수
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);
		int blockNum = (int)Math.floor((page-1)/ blockCount);
	    int blockStartNum = (blockCount * blockNum) + 1;
	    int blockLastNum = blockStartNum + (blockCount-1);
	    
	    
	    req.setAttribute("blockStartNum", blockStartNum);
	    req.setAttribute("blockLastNum", blockLastNum);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		List<Article> articles = articleService.getForPrintListArticles(loginedMemberId, page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		req.setAttribute("articles", articles);
		
		long endTime = System.nanoTime();
		long estimatedTime = endTime - startTime;
		
		double seconds = estimatedTime / 1000000000.0;
		System.out.println("seconds : " + seconds);
		
		return "article/list.jsp";
	}

	// 글 삭제
	private String doActionDoDelete() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		System.out.println(loginedMemberId);

		Map<String, Object> getCheckRsDeleteAvailableRs = articleService.getCheckRsDeleteAvailable(id, loginedMemberId);

		if (Util.isSuccess(getCheckRsDeleteAvailableRs) == false) {
			return "html:<script> alert('" + getCheckRsDeleteAvailableRs.get("msg") + "'); history.back(); </script>";
		}

		articleService.deleteArticle(id);

		return "html:<script> alert('" + id + "번 게시물이 삭제되었습니다.'); location.replace('list'); </script>";
	}

	@Override
	public String getControllerName() {
		return "article";
	}
}