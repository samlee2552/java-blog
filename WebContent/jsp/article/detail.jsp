<%@ page import="com.sbs.java.blog.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="게시물 상세내용"></c:set>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>
<style>
	.table-box>s {
	width: 100%;
	border-collapse: collapse;
}

.table-box {
	margin-bottom: 100px;
}

.write-reply-form-box {
	margin-bottom: 100px;	
}
</style>
<div class="content">
	<h1>게시물 상세페이지</h1>
</div>

<div class="content table-box">
	<table>
		<colgroup>
			<col width="200">
		</colgroup>

		<tbody>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>조회</th>
				<td>${article.hit}</td>
			</tr>
			<tr>
				<th>비고</th>
				<td>
					<div class="inline-block">
						<c:if test="${article.extra.deleteAvailable}">
						
						<a onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;"
							href="./doDelete?id=${article.id}">삭제</a>
						</c:if>
					</div>
					<div class="inline-block">
						<c:if test="${article.extra.modifyAvailable}">
						<a href="./modify?id=${article.id}">수정</a>
						</c:if>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
		<script type="text/x-template">${article.bodyForXTemplate}</script>
					<div class="toast-editor toast-editor-viewer"></div>
</div>


<c:if test="${isLogined == false}">
	<div class="content">

		<c:url value="/s/member/login" var="loginUri">
			<c:param name="afterLoginRedirectUri"
				value="${currentUri}&jsAction=WriteReplyForm__focus" />
		</c:url>
		<a href="${loginUri}">로그인</a> 후 이용해주세요.
	</div>
</c:if>
<c:if test="${isLogined}">
	<script>
		var WriteReplyForm__submitDone = false;
		function WriteReplyForm__focus() {
			var editor = $('.write-reply-form .toast-editor').data(
					'data-toast-editor');
			editor.focus();
		}
		function WriteReplyForm__submit(form) {
			if (WriteReplyForm__submitDone) {
				alert('처리중입니다.');
				return;
			}
			var editor = $(form).find('.toast-editor')
					.data('data-toast-editor');
			var body = editor.getMarkdown();
			body = body.trim();
			if (body.length == 0) {
				alert('내용을 입력해주세요.');
				editor.focus();
				return false;
			}
			form.body.value = body;
			form.submit();
			WriteReplyForm__submitDone = true;
		}
		function WriteReplyForm__init() {
			$('.write-reply-form .cancel').click(
					function() {
						var editor = $('.write-reply-form .toast-editor').data(
								'data-toast-editor');
						editor.setMarkdown('');
					});
		}
		$(function() {
			WriteReplyForm__init();
		});
	</script>

	<div class="write-reply-form-box content">
		<form action="doWriteReply" method="POST"
			class="write-reply-form form1"
			onsubmit="WriteReplyForm__submit(this); return false;">
			<input type="hidden" name="articleId" value="${article.id}">
			<c:url value="${noBaseCurrentUri}" var="redirectUri">
				<c:forEach items="${paramValues}" var="p">
					<c:choose>
						<c:when test="${p.key == 'jsAction'}">

						</c:when>
						<c:otherwise>
							<c:forEach items="${p.value}" var="val">
								<c:param name="${p.key}" value="${val}" />
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:param name="jsAction" value="WriteReplyList__showTop" />
			</c:url>
			<input type="hidden" name="redirectUri" value="${redirectUri}">
			<input type="hidden" name="body">
			<div class="form-row">
				<div class="input">
					<script type="text/x-template"></script>
					<div data-toast-editor-placeholderString="댓글을 입력해주세요" data-toast-editor-height="150" data-toast-editor-initialEditType="wysiwyg" class="toast-editor"></div>
				</div>
			</div>
			<div class="form-row">
				<div class="input flex">
					<input type="submit" value="작성" /> 
				</div> 
			</div>
		</form>
	</div>
</c:if>

<script>
function WriteReplyList__showTop() {
	var top = $('.article-replies-list-box').offset().top;
	$(window).scrollTop(top);
	var $firstTr = $('.article-replies-list-box > table > tbody > tr:first-child');
	$firstTr.addClass('high');
	setTimeout(function() {
		$firstTr.removeClass('high');
	}, 1000);
}
</script>

<style>
.article-replies-list-box > table > tbody > tr.high {
	background-color:#dfdfdf;
} 
.article-replies-list-box > table > tbody > tr {
	transition: background-color 1s;
} 
</style>

<h2 class="content">댓글 리스트</h2>

<div class="content article-replies-list-box table-box">
	<table>
		<colgroup>
			<col width="100">
			<col width="200">
			<col>
			<col width="120">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>내용</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articleReplies}" var="articleReply">
				<tr data-id="${articleReply.id}">
					<td class="text-align-center">${articleReply.id}</td>
					<td class="text-align-center">${articleReply.regDate}</td>
					<td class="text-align-center">${articleReply.extra.writer}</td>
					<td class="padding-left-10 padding-right-10"><script
							type="text/x-template">${articleReply.bodyForXTemplate}</script>
						<div class="toast-editor toast-editor-viewer"></div></td>
					<td class="text-align-center"><c:if
							test="${articleReply.extra.deleteAvailable}">
							<c:set var="afterDeleteReplyRedirectUri"
								value="${Util.getNewUriRemoved(currentUri, 'lastWorkArticleReplyId')}" />
							<c:set var="afterDeleteReplyRedirectUri"
								value="${Util.getNewUriAndEncoded(afterDeleteReplyRedirectUri, 'jsAction', 'WriteReplyList__showTop')}" />

							<c:set var="afterModifyReplyRedirectUri"
								value="${Util.getNewUriRemoved(currentUri, 'lastWorkArticleReplyId')}" />
							<c:set var="afterModifyReplyRedirectUri"
								value="${Util.getNewUriAndEncoded(afterModifyReplyRedirectUri, 'jsAction', 'WriteReplyList__showDetail')}" />

							<a onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;"
								href="./doDeleteReply?id=${articleReply.id}&redirectUri=${afterDeleteReplyRedirectUri}">삭제</a>
						</c:if> <c:if test="${articleReply.extra.modifyAvailable}">
							<a
								href="./modifyReply?id=${articleReply.id}&redirectUri=${afterModifyReplyRedirectUri}">수정</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="/jsp/part/foot.jspf"%>