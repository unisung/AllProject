<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Book bookLists[] =null;	   
int number = 0;
String book_kindName="";

BookDao   dao = BookDao.getInstance();
    bookLists = dao.getBooks(1+"00",3); 
  out.println(bookLists[0].getBook_id());
%>
</body>
</html>