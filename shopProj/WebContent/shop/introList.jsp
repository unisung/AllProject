<%@page import="dao.BookDao"%><%@page import="java.util.ArrayList"%><%@page import="java.util.List"%><%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Book> bookLists = new ArrayList<Book>(); 
	/* Book bookLists[]=null; */
    BookDao dao = BookDao.getInstance();

    String book_kindName="";
    for(int i=1;i<=3;i++){
    bookLists = dao.getBookLists(i+"00",2);//
    
    if(bookLists.get(0).getBook_kind().equals("100")){
    	book_kindName="문학";
    }else if(bookLists.get(0).getBook_kind().equals("200")){
    	book_kindName="외국어";
    }else if(bookLists.get(0).getBook_kind().equals("300")){
    	book_kindName="컴퓨터";
    }
    
  /*   String book_kind = bookLists[0].getBook_kind(); */
  String book_kind = bookLists.get(0).getBook_kind();
    
    request.setAttribute("book_kind", book_kind);
    request.setAttribute("bookLists", bookLists);
    request.setAttribute("book_kindName", book_kindName);

    }
%>
<br>
<font size="+1"><b>${book_kindName}분류의 신간 목록:
  <a href="list.jsp?book_kind=${book_kind}"><b>더보기</b></a>
</b></font>
<c:forEach var="book" items="${bookLists}">
<c:if test="${!empty book}">
 <table border="0" width="600" align="center">
 <tr height="30">
 <td rowspan="4" width="100" align="center" valign="middle">
 <a href="shopMain.jsp?pgm=bookContent.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">
 <img src="../imgeFile/${book.book_image}" border="0" width="60" height="90">
 </a>
 </td>
 <td width="350"><font size="+1"><b>
 <a href="shopMain.jsp?pgm=bookContent.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">
 ${book.book_title}
 </a>
 </b></font>
 </td>
 <td rowspan=4 width="100" align="center" valign="middle">
 <c:if test="${book.book_count==0}">
 	<b>일시품절</b>
 </c:if>
 <c:if test="${book.book_count>0}">
 	<b>&nbsp;${book.book_count}</b>
 </c:if>
 </td>
 <tr height="30">
 <td width="350">출판사:${book.publishing_com}</td>
 </tr>
 <tr>
 <td width="350">저자:${book.author}</td>
 </tr>
 <tr height="30">
 <td width="350">정가:
 <s><fmt:formatNumber value="${book.book_price}" pattern="###,##0"/></s>
 원<br>
 판매가:<b>
 <fmt:formatNumber value="${book.book_price*(100-book.discount_rate)/100}" pattern="###,##0"/>
 </b>
 </td>
 </tr>
 </table>
</c:if>
</c:forEach>

  
</body>
</html>