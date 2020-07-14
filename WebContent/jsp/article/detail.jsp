<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 제이쿼리 로딩 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
<!-- detail javascript 플러그인 추가 -->
<script type="text/x-template"
	src="${pageContext.request.contextPath}/resource/js/article/detail.js"></script>


<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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

.comment-form-box {
    margin-top: 30px;
    padding:5px;
    margin-bottom:50px;
  }

.form1 .form-row>.input>input,.form1 .form-row>.input>textarea {
    display: block; width: 100%; box-sizing: border-box; padding: 10px;
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
			<h3 align="right">조회수: <%=article.getHit()%></h3>


		<script type="text/x-template" id="origin1" style="display: none;"><%=article.getBody()%></script>

		<div id="viewer1"></div>
	</div>
</div>

<div class="comment-form-box con">
	<form action="doWriteReply" method="POST"target="_blank" class="comment-form form1" onsubmit="submitWriteForm(this); return false;">
    <div class="form-row flex">
			<textarea name="comment" placeholder="댓글을 입력해주세요." style="width:100%"></textarea>
      <div class="form-row">
        <div class="input">
				  <input type="submit" value="등록" style="height:100px"/>
			  </div>
</div>


<script>
	var editor1__initialValue = $('#origin1').html().trim();
	var editor1 = new toastui.Editor({
		el : document.querySelector('#viewer1'),
		initialValue : editor1__initialValue,
		viewer : true,
		plugins : [ toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin,
				replPlugin, codepenPlugin ]
	});
</script>

<script>
var joinFormSubmitted = false;

function submitJoinForm(form) {
  if ( joinFormSubmitted ) {
    alert('처리 중입니다.');
    return;
  }
  
  form.comment.value = form.comment.value.trim();
  if ( form.comment.value.length == 0 ) {
    alert('댓글을 입력해주세요.');
    form.comment.focus();
    
    return;
  }
  
  form.submit();
  joinFormSubmitted = true;
}
</script>

<%@ include file="/jsp/part/foot.jspf"%>