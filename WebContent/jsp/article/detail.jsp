<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<style>
	.table-box>s {
	width: 100%;
	border-collapse: collapse;
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
						<c:if test="article.extra.deleteAvailable">
						
						<a onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;"
							href="./doDelete?id=${article.id}">삭제</a>
						</c:if>
					</div>
					<div class="inline-block">
						<c:if test="article.extra.modifyAvailable">
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



<%@ include file="/jsp/part/foot.jspf"%>