<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.addCookie(CookieBox.createCookie("name", "일지매"));
	response.addCookie(CookieBox.createCookie("아이디", "아이디-일지매"));
%>
쿠키저장 성공<p>
<a href="cookieBoxView.jsp">쿠키보기</a>
</body>
</html>