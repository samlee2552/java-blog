<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
List<ArticleReply> articleReplies = (List<ArticleReply>) request.getAttribute("articleReplies");
%>

<style>
.entire-box {
	padding: 0 5px;
}

.detail-box {
	margin-top: 100px;
	border: 1px solid #BFC9CA;
	border-radius: 20px 50px;
	padding: 10px;
	margin-bottom: 100px;
}

.title-box {
	margin-bottom: 30px;
}

.writeReply-form-box {
	margin-top: 30px;
	padding: 5px;
	margin-bottom: 100px;
}

.form1 .form-row>.input>input, .form1 .form-row>.input>textarea {
	display: block;
	width: 100%;
	box-sizing: border-box;
	padding: 10px;
}

.reply-list {
	display: flex;
	margin-bottom: 30px;
	border-bottom: 1px solid black;
	padding-right: 100px;
}
</style>


<div class="entire-box">
	<div class="detail-box con">

		<div class="title-box flex flex-jc-sb">
			<h1 style="">
				제목:
				<%=article.getTitle()%></h1>
			<h3 style="">
				작성일 :
				<%=article.getRegDate()%></h3>
		</div>
		<h3 align="right">
			작성자:
			<%=article.getExtra().get("writer")%></h3>
		<h3 align="right">
			조회수:
			<%=article.getHit()%></h3>
		<div class="tools flex flex-jc-e">
		<%
						if ((boolean) article.getExtra().get("deleteAvailable") || loginedMemberId == 1) {
					%>
			<a onclick="if( confirm('게시물을 삭제하시겠습니까?') == false )return false;"
				href="./doDelete?id=<%=article.getId()%>"><i style="color: #630808; padding:0 10px;'" class="fas fa-trash-alt"></i></a>
		<%
			}
		%>
		<%
						if ((boolean) article.getExtra().get("deleteAvailable") || loginedMemberId == 1) {
					%>
			<a onclick="if( confirm('게시물을 수정하시겠습니까?') == false )return false;"
				href="./modify?id=<%=article.getId()%>"><i style="color:grey; padding:0 10px;" class="fas fa-pen-fancy"></i></a>
		
		<%
			}
		%>
			
		</div>
		
		<script type="text/x-template" id="origin1" style="display: none;"><%=article.getBodyForXTemplate()%></script>

		<div id="viewer1"></div>
	</div>
</div>

<div class="writeReply-form-box con">
	<form action="doWriteReply" method="POST" class="writeReply-form form1"
		onsubmit="submitReplyForm(this); return false;">
		<input type="hidden" name="id" value=<%=article.getId()%> />
		<div class="form-row flex">
			<textarea name="body" placeholder="댓글을 입력해주세요."
				style="width: 100%; height: 100px"></textarea>

			<div class="input block">
				<input type="submit" value="등록" style="height: 110px;" />
			</div>
		</div>
	</form>
</div>

<div class="reply-list-box-1 con table-box">

	<h1 class="text-align-left">📝 댓글</h1>
	<%
		for (ArticleReply articleReply : articleReplies) {
	%>
	<table class="reply-list">
		<tr>
			<th>🇳🇴</th>
			<td><%=articleReply.getId()%></td>
			<th>작성자</th>
			<td><%=articleReply.getMemberNickname()%></td>
			<th>작성일</th>
			<td><%=articleReply.getRegDate()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5"><%=articleReply.getBody()%></td>

			<%
				}
			%>
		
	</table>
</div>

<script>
	var WriteReplyFormSubmitted = false;

	function submitWriteReplyForm(form) {
		if (WriteReplyFormSubmitted) {
			alert('처리 중입니다.');
			return;
		}

		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('댓글을 입력해주세요.');
			form.body.focus();

			return;
		}

		form.submit();
		WriteReplyFormSubmitted = true;
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>