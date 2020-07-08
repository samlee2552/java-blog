<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>
.table-box {
	padding:0 10px;
}

.table-box > table {
	width:100%;
	border-top:3px solid black;
	border-bottom:3px solid black;
	border-collapse:collapse;
	text-align:center;
}

.table-box > table th, .table-box > table td {
	border-top:1px solid black;
	border-bottom:1px solid black;
}

.table-box > table th {
	background: linear-gradient(to right, #0082c8, #0082c8);
	color:white;
}

#paging {
  text-align:center;
  margin: 20px 0;
  margin-bottom:20px;
}

#paging ul {
  display:inline-block;
}

#paging ul > li {
  display:inline-block;
  padding: 0 20px;
}

#paging ul > li > a {
  padding:0 10px;
}

#paging ul > li:hover > a {
  background-color:#0082c8;
  color:white;
}

#paging ul > li.current > a {
	color:#f12711;
}

#paging ul > li.current:hover > a {
	background-color:inherit;
}

#paging .btn {
  border:1px solid #afafaf;
  border-radius:15%;
  padding:0 10px;
}

.con > h1 {
	margin-top:5%;
}


.write-box {
	text-align:center;
	display:block;
	
}

.write-box > a {
	display:inline-block;
	background: linear-gradient(to right, #0082c8, #0082c8);
	color:white;
	padding:10px;
}

.search-box {
	margin-bottom:30px;
}


<!-- 
</style>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");

%>	
	<div class="article-list-box-1 con table-box">

	<h1 class="text-align-center">📋 게시판 : ${cateItemName}</h1>
		<h3 class="text-align-right">🔢 총 개수: ${totalCount}</h3>

	<table>
		<thead>
			<tr height="50">
				<th>🇳🇴</th>
				<th>📅 등록일</th>
				<th class="visible-on-md-up">📆 수정일</th>
				<th>🔤 제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr height="100">
				<td><%=article.getId()%></td>
				<td><%=article.getRegDate()%></td>
				<td class="visible-on-md-up"><%=article.getUpdateDate()%></td>
				<td width="40%" style="font-weight:bold"><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td>1</td>
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
      <li><a href="./list?cateItemId=${param.cateItemId}&page=<%= paramPage -1 %>" class="btn">PREV</a></li>
      	<% for (int i = 1; i <= totalPage; i ++) { %>
    <li class="<%=i == paramPage ? "current" : ""%>"><a
			href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=<%=i%>" class="block"><%=i%></a></li>
      <% } %>
      <li><a href="./list?cateItemId=${param.cateItemId}&page=${param.page+1}" class="btn">NEXT</a></li>
    </ul>
  </div>
  
  <div class="con search-box flex flex-jc-c">

	<form action="${pageContext.request.contextPath}/s/article/list">
		<input type="hidden" name="page" value="1" /> <input type="hidden"
			name="cateItemId" value="${param.cateItemId}" /> <input
			type="hidden" name="searchKeywordType" value="title" /> <input
			type="text" name="searchKeyword" value="${param.searchKeyword}" />
		<button type="submit">검색</button>
	</form>
</div>

	<div class="con write-box">
			<a href="${pageContext.request.contextPath}/s/article/write">글쓰기</a>
	</div>

	<%@ include file="/jsp/part/foot.jspf"%>