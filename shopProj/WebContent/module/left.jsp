<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String path = application.getContextPath();
  	request.setAttribute("path", path);
%>
<p><b>도서분류</b></p>
<a href="${path}/shop/list.jsp?book_kind=all">전체 목록보기</a><br>
<a href="${path}/shop/list.jsp?book_kind=100">문학</a><br>
<a href="${path}/shop/list.jsp?book_kind=200">외국어</a><br>
<a href="${path}/shop/list.jsp?book_kind=300">컴퓨터</a><br>