<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
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
text-align:center;	
}

<!--
</style>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
	String cateItemName = (String) request.getAttribute("cateItemName");
	int blockStartNum = (int) request.getAttribute("blockStartNum");
	int blockLastNum = (int) request.getAttribute("blockLastNum");
%>
<div class="article-list-box-1 table-box content">
	<h1 class="text-align-center">📋 게시판 : ${cateItemName}</h1>
	<h3 class="text-align-right">🔢 게시물 수: ${totalCount}</h3>
	<table>
		<thead>
			<tr height="50">
				<th>🇳🇴</th>
				<th class="visible-on-md-up">📅 게시일</th>
				<th>🔤 제목</th>
				<th style="white-space: nowrap">‍✍</th>
				<th style="white-space: nowrap">📈</th>
				<th style="white-space: nowrap">👍</th>
				<%
					if (isLogined) {
				%>
				<th></th>
				<%
					}
				%>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr height="100">
				<td width="10%" style="font-weight: bold"><a
					href="./detail?id=<%=article.getId()%>"><%=article.getId()%></a></td>
				<td class="visible-on-md-up" width="10%"><%=article.getRegDate().substring(0, 10)%></td>
				<td class="title" style="font-weight: bold"><a
					href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td width="9%"><%=article.getExtra().get("writer")%></td>
				<td width="9%"><%=article.getHit()%></td>
				<td width="9%"><%=article.getHit()%></td>
				<%
					if (isLogined) {
				%>
				<td width="9%">
					<%
						if ((boolean) article.getExtra().get("deleteAvailable")
										|| (boolean) article.getExtra().get("modifyAvailable") || loginedMemberId == 1) {
					%>
					<div class="tools flex flex-jc-c">
						<a id="button" href=""><i class="fas fa-ellipsis-h"></i></a> 
						<div class="icon">
							<a onclick="if( confirm('게시물을 삭제하시겠습니까?') == false )return false;"
							href="./doDelete?id=<%=article.getId()%>">⛔</a> 
						</div>
						<div class="icon">
							<a class="visible-on-md-up" onclick="if( confirm('게시물을 수정하시겠습니까?') == false )return false;"
							href="./modify?id=<%=article.getId()%>">📝</a>
						</div>
					</div> <%
 	}
 %>
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
			for (int i = blockStartNum; i <= blockLastNum; i++) {
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