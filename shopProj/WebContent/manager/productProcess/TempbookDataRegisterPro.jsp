<%@page import="dao.BookDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* for(int i=1;i<50;i++){
		Book  book = new Book();
		book.setBook_kind("100");
		book.setBook_title("book_title"+i);
		book.setBook_price(i*1000);
		book.setBook_count(i*10);
		book.setAuthor("author"+i);
		book.setPublishing_com("publishing_com"+i);
		book.setPublishing_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		book.setBook_image("filename"+i);
		book.setBook_content("book_content"+i);
		book.setDiscount_rate(0);
		
		book.setReg_date(new java.sql.Date(new Date().getTime()));
		
		BookDao bookProcess = BookDao.getInstance();
		 bookProcess.insertBook(book);
	} */

	for(int i=1;i<50;i++){
		Book  book = new Book();
		book.setBook_kind("200");
		book.setBook_title("book_title"+i);
		book.setBook_price(i*1000);
		book.setBook_count(i*10);
		book.setAuthor("author"+i);
		book.setPublishing_com("publishing_com"+i);
		book.setPublishing_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		book.setBook_image("filename"+i);
		book.setBook_content("book_content"+i);
		book.setDiscount_rate(0);
		
		book.setReg_date(new java.sql.Date(new Date().getTime()));
		
		BookDao bookProcess = BookDao.getInstance();
		 bookProcess.insertBook(book);
	}
	
	for(int i=1;i<50;i++){
		Book  book = new Book();
		book.setBook_kind("300");
		book.setBook_title("book_title"+i);
		book.setBook_price(i*1000);
		book.setBook_count(i*10);
		book.setAuthor("author"+i);
		book.setPublishing_com("publishing_com"+i);
		book.setPublishing_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		book.setBook_image("filename"+i);
		book.setBook_content("book_content"+i);
		book.setDiscount_rate(0);
		
		book.setReg_date(new java.sql.Date(new Date().getTime()));
		
		BookDao bookProcess = BookDao.getInstance();
		 bookProcess.insertBook(book);
	}


%>
</body>
</html>