<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>
.table-box {
	padding: 0 10px;
	max-width: 1000px;
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

#paging {
	text-align: center;
	margin: 20px 0;
	margin-bottom: 20px;
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
}

.write-box>a:hover {
	background: #0096E7;
}

.search-box {
	margin-bottom: 30px;
}

.searchBar {
	height: 36px;
	width: 400px;
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
<!--
</style>
<%
List<Article> articles = (List<Article>) request.getAttribute("articles");
int totalPage = (int) request.getAttribute("totalPage");
int paramPage = (int) request.getAttribute("page");
String cateItemName = (String) request.getAttribute("cateItemName");
%>
<div class="article-list-box-1 table-box">

	<h1 class="text-align-center">📋 게시판 : ${cateItemName}</h1>
	<h3 class="text-align-right">🔢 총 개수: ${totalCount}</h3>

	<table>
		<thead>
			<tr height="50">
				<th>🇳🇴</th>
				<th>📅 등록일</th>
				<th class="visible-on-md-up">📆 수정일</th>
				<th>🔤 제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr height="100">
				<td><a href="./detail?id=<%=article.getId()%>"><%=article.getId()%></a></td>
				<td><%=article.getRegDate().substring(0, 10)%></td>
				<td class="visible-on-md-up"><%=article.getUpdateDate().substring(0, 10)%></td>
				<td class="title" style="font-weight: bold"><a
					href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getExtra().get("writer")%></td>
				<td><%=article.getHit()%></td>
				<td width="">
					<%
						if ((boolean) article.getExtra().get("deleteAvailable") || loginedMemberId == 1) {
					%> <a
					onclick="if( confirm('게시물을 삭제하시겠습니까?') == false )return false;"
					href="./doDelete?id=<%=article.getId()%>">⛔</a>
				</td>
				<%
					}
				%>
				<td width="">
					<%
						if ((boolean) article.getExtra().get("modifyAvailable") || loginedMemberId == 1) {
					%><a href="./modify?id=<%=article.getId()%>">✍</a>
				</td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>

<!-- 페이징 -->
<div id="paging">
	<ul>
		<%
			if (paramPage != 1) {
		%>
		<li><a
			href="./list?cateItemId=${param.cateItemId}&page=<%= paramPage -1 %>"
			class="btn">PREV</a></li>
		<%
			}
		%>
		<%
			for (int i = 1; i <= totalPage; i++) {
		%>
		<li class="<%=i == paramPage ? "current" : ""%>"><a
			href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=<%=i%>"
			class="block"><%=i%></a></li>
		<%
			}
		%>
		<%
			if (paramPage != totalPage) {
		%>
		<li><a
			href="./list?cateItemId=${param.cateItemId}&page=<%= paramPage + 1 %>"
			class="btn">NEXT</a></li>
		<%
			}
		%>
	</ul>
</div>

<div class="con search-box flex flex-jc-c">
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

<div class="con write-box">
	<a href="${pageContext.request.contextPath}/s/article/write">글쓰기</a>
</div>

<%@ include file="/jsp/part/foot.jspf"%>