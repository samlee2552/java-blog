<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>

.table-box > table {
	width:100%;
	border-collapse:collapse;
	text-align:center;
}

.table-box > table th, .table-box > table td {
	border:1px solid black;
}

.table-box > table th {
	background: linear-gradient(to right, #0082c8, #0082c8);
	color:white;
}

#paging {
  text-align:center;
  margin: 20px 0;
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
<!-- 
</style>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
%>	
	<div class="con">
	<h2>총 게시물 수 : ${totalCount}</h2>
	</div>
	<h1 class="con" style="padding:30px 0">게시물 리스트</h1>

	<div class="article-list-box-1 con table-box">
	<table>
		<thead>
			<tr height="50">
				<th>번호</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr height="100">
				<td><%=article.getId()%></td>
				<td><%=article.getRegDate()%></td>
				<td><%=article.getUpdateDate()%></td>
				<td width="60%"><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
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
      <li><a href="./list?cateItemId=${param.cateItemId}&page=${param.page-1}" class="btn">PREV</a></li>
      	<% for (int i = 1; i <= totalPage; i ++) { %>
     <li class="<%=i == paramPage ? "current" : ""%>"><a href="?cateItemId=${param.cateItemId}&page=<%=i%>" class="num"><%=i%></a></li>
      <% } %>
      <li><a href="./list?cateItemId=${param.cateItemId}&page=${param.page+1}" class="btn">NEXT</a></li>
    </ul>
  </div>
  

	<%@ include file="/jsp/part/foot.jspf"%>