<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>
.table-box {
	padding: 0 10px;
	margin-left: auto;
	margin-right: auto;
}

.table-box>table {
	width: 100%;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	border-collapse: collapse;
	text-align: center;
}

.table-box>table th, .table-box>table td {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.table-box>table th {
	background: linear-gradient(to right, #0082c8, #0082c8);
	color: white;
}

.title {
	font-weight: bold;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 150px;
}

#paging {
	text-align: center;
	margin: 40px 0 30px 0;
}

#paging ul {
	display: inline-block;
}

#paging ul>li {
	display: inline-block;
	padding: 0 20px;
}

#paging ul>li>a {
	padding: 0 10px;
}

#paging ul>li:hover>a {
	background-color: #0082c8;
	color: white;
}

#paging ul>li.current>a {
	color: #f12711;
}

#paging ul>li.current:hover>a {
	background-color: inherit;
}

#paging .btn {
	border: 1px solid #afafaf;
	border-radius: 15%;
	padding: 0 10px;
}

.con>h1 {
	margin-top: 5%;
}

.write-box {
	text-align: center;
	display: block;
}

.write-box>a {
	display: inline-block;
	background: #0082c8;
	color: white;
	padding: 10px;
	margin-bottom: 100px;
	width: 150px;
	border-radius: 8px;
}

.write-box>a:hover {
	background: #0096E7;
}

.search-box {
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
}

.searchBar {
	height: 36px;
	width: 300px;
}

.searchBar:hover {
	-webkit-box-shadow: 0px 4px 5px 3px rgba(219, 219, 219, 1);
	-moz-box-shadow: 0px 4px 5px 3px rgba(219, 219, 219, 1);
	box-shadow: 0px 4px 5px 3px rgba(219, 219, 219, 1);
}

.title>a:hover {
	text-decoration: underline;
	color: #5A5A5A;
}

.searchButton {
	width: 40px;
	height: 40px;
	border: 1px solid #00B4CC;
	background: #0082c8;
	text-align: center;
	color: #fff;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
	font-size: 20px;
}

.tools>.icon {
	display: none;
	padding: 0 4px;
}

.tools:hover .icon {
	display: inline-block;
}

.tools:hover>#button {
	display: none;
}

.tools {
	text-align: center;
}
<!--
</style>

<div class="article-list-box-1 table-box content">
	<h1 class="text-align-center">📋 게시판 : ${cateItemName}</h1>
	<h3 class="text-align-right">🔢 게시물 수: ${totalCount}</h3>
	<table>
		<thead>
			<tr height="50">
				<th>🇳🇴</th>
				<th class="visible-on-md-up">📅 게시일</th>
				<th>🔤 제목</th>
				<th title="작성자">‍✍</th>
				<th title="조회수">📈</th>
				<th title="추천수">👍</th>
				<c:if test="${isLogined}">
					<th></th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
				<tr height="100">
					<td width="" style="font-weight: bold"><a
						href="./detail?id=${article.id}">${article.id}</a></td>
					<td width="12%" class="visible-on-md-up">${article.regDate.substring(0, 10)}</td>
					<td title="${article.title}" class="title"><a
						href="./detail?id=${article.id}">${article.title}</a></td>
					<td width="12%">${article.extra.writer}</td>
					<td width="">${article.hit}</td>
					<td width="">${article.like}</td>
					<c:if test="${isLogined}">
						<td width="7%">
							<div class="tools flex flex-jc-c">
								<c:if
									test="${article.extra.deleteAvailable || loginedMemberId == 1}">
									<a id="button" href=""><i class="fas fa-ellipsis-h"></i></a>
									<div class="icon">
										<a
											onclick="if( confirm('게시물을 삭제하시겠습니까?') == false )return false;"
											href="./doDelete?id=${article.id}">⛔</a>
									</div>
								</c:if>
								<c:if
									test="${article.extra.modifyAvailable || loginedMemberId == 1}">
									<div class="icon">
										<a class="visible-on-md-up"
											onclick="if( confirm('게시물을 수정하시겠습니까?') == false )return false;"
											href="./modify?id=${article.id}">📝</a>
									</div>
								</c:if>
							</div>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 페이징 -->
<div id="paging">
	<ul>
		<c:if test="${page != 1}">
			<li><a
				href="./list?cateItemId=${param.cateItemId}&page=${page - 1}"
				class="btn">PREV</a></li>
		</c:if>
		<c:forEach var="i" begin="${blockStartNum}" end="${blockLastNum}"
			step="1">
			<li class="${i == page ? 'current' : '' }"><a
				href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=${i}"
				class="block">${i}</a></li>
		</c:forEach>
		<c:if test="${page != totalPage }">
			<li><a
				href="./list?cateItemId=${param.cateItemId}&page=${page+1}"
				class="btn">NEXT</a></li>
		</c:if>
	</ul>
</div>
<div class="content search-box flex flex-jc-c">
	<form action="${pageContext.request.contextPath}/s/article/list">
		<input type="hidden" name="page" value="1" /> <input type="hidden"
			name="cateItemId" value="${param.cateItemId}" /> <input
			type="hidden" name="searchKeywordType" value="title" /> <input
			class="searchBar" type="text" name="searchKeyword"
			value="${param.searchKeyword}" placeholder="검색어를 입력해주세요." />
		<button type="submit" class="searchButton">
			<i class="fa fa-search"></i>
		</button>
	</form>
</div>
<div class="content write-box">
	<a href="${pageContext.request.contextPath}/s/article/write">글쓰기</a>
</div>
<%@ include file="/jsp/part/foot.jspf"%>