<%@page import="dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
  Object obj = session.getAttribute("login");
  LoginDto login = (LoginDto)obj;
%>
<%=login.getId()%>(<%=login.getName()%>)님 반갑습니다.<br>
<a href="logout.jsp">로그아웃</a><br>
<a href="calendar.jsp">일정관리</a><br>
</body>
</html>