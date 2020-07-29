<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<style>
/* cus */
.write-form-box {
    margin-top: 30px;
    padding:5px;
    margin-bottom:50px;
}
</style>
<!-- 글쓰기 폼  -->
<div class="write-form-box content">
	<form action="doWrite" method="POST" class="write-form form1" onsubmit="submitWriteForm(this); return false;">
		<div class="form-row">
			<div class="label">카테고리 선택</div>
			<div class="input">
				<select name="cateItemId">
					<%
						for (CateItem cateItem : cateItems) {
					%>
					<option value="<%=cateItem.getId()%>"><%=cateItem.getName()%></option>
					<%
						}
					%>

				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="label">제목</div>
			<div class="input">
				<input name="title" type="text" placeholder="제목을 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">내용</div>
			<div class="input">
				  <input name="body" type="hidden">
 				 	 <div id="editor1"></div>
			</div>
		</div>
		<div class="form-row">
			<div class="label"></div>
			<div class="input">
				<input type="submit" value="전송" /> <a href="list">취소</a>
			</div>
		</div>
	</form>
</div>


<script>
var editor1 = new toastui.Editor({
	  el: document.querySelector("#editor1"),
	  height: "500px",
	  initialEditType: "markdown",
	  previewStyle: "vertical",
	  initialValue: "# 안녕",
	  plugins: [toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, replPlugin, codepenPlugin]
	});

/* 여기서 부터 */
var onBeforeUnloadSetted = false;
var onBeforeUnload = function(e) {
  return '떠나시겠습니까?'; // 요새 브라우저는 이 메시지가 아닌 자체의 메세지가 나옵니다.
};

function applyOnBeforeUnload() {
  if ( onBeforeUnloadSetted ) return;
  $(window).bind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 등록
  onBeforeUnloadSetted = true;
}

function removeOnBeforeUnload() {
  $(window).unbind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 해제
  onBeforeUnloadSetted = false;
}
/* 여기까지는 라이브러리 */

/* 이 밑은 활용 예 */
var WriteForm__submitDone = false;

function WriteForm__submit(form) {
  if ( WriteForm__submitDone ) {
    alert('처리중입니다.');
    return;
  }
  
  form.name.value = form.name.value.trim();
  
  if ( form.name.value.length == 0 ) {
    alert('이름좀...');
    form.name.focus();
    return;
  }
  
  // 폼을 발송하기 전에는, 페이지 이동을 참견하는 녀석을 꺼버린다.
  removeOnBeforeUnload();
  form.submit();
  WriteForm__submitDone = true;
}

function WriteForm__init() {
  // 폼의 특정 요소를 건드리(?)면, 그 이후 부터 외부로 이동하는 것에 참견하는 녀석을 작동시킨다.
  $('form.write-form input, form.write-form textarea').keyup(function() {
    applyOnBeforeUnload();
  });
}

WriteForm__init();
</script>


<%@ include file="/jsp/part/foot.jspf"%>