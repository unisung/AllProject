<%@page import="dao.BookDao"%><%@page import="model.Book"%><%@page import="java.util.List"%><%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../managerSessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../style.css" rel="stylesheet" type="text/css">
<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		List<Book> booklist = null;
		int number = 0;
		String book_kind = request.getParameter("book_kind");
		
		if(book_kind==null||"".equals(book_kind)){
			 book_kind = "all";
		}
		
		BookDao dao = BookDao.getInstance();
		int count = dao.getBookCount(book_kind);
		int bookListSize=0;
		if(count>0){
			booklist = dao.getBooks(book_kind);
			bookListSize = booklist.size();
		}
		
		 request.setAttribute("booklist", booklist);
		 request.setAttribute("booklistSize", bookListSize);
		 request.setAttribute("count", count);
		 request.setAttribute("book_kind",book_kind);
		
%>
<html><head><title>도서 등록 리스트</title>
</head>
<body>
<%
	 String book_kindName="";
if(book_kind.equals("100")){   book_kindName="문학";
}else if(book_kind.equals("200")){  book_kindName="외국어";  
}else if(book_kind.equals("300")){  book_kindName="컴퓨터";
}else if(book_kind.equals("all")){  book_kindName="전체";  }
%>
<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<b>${book_kindName} 분류의 목록: 
<%
/* 해당카테고리번호의 서적 상품이 존재할때 처리 */
%>
<c:if test="${count>0}">
      <c:if test="${book_kind== all}">
          ${count}개
		</c:if>
      <c:if test="${book_kind != all}">
          ${booklistSize}개
      </c:if>
</c:if>
</b>
<table width="100%" align="center">
<tr><td align="right"  class="value_c">
       <a href="bookRegisterForm.jsp">책 등록</a> 
 </td></tr></table>
<c:if test="${count==0}">
<table width="100%" border="1" align="center">
		<tr><td align="center">등록된 책이 없습니다</td></tr></table>
</c:if>
<c:if test="${count>0}"><!-- 테이블 시작 -->
<table border="1" width="100%" align="center"> 
    <tr height="30" class="value_c"> 
      <th>번호</th>  <th>책분류</th> <th>제목</th>
      <th>가격</th>  <th>수량</th>  <th>저자</th>
      <th>출판사</th><th>출판일</th> <th>책이미지</th>
      <th>할인율</th><th>등록일</th> <th>수정</th>
      <th>삭제</th>         
    </tr>
<c:forEach  var="book" items="${booklist}" varStatus="i"> <!-- 반복문 시작 --> 
   <tr height="30">
      <td>${i.count}</td> 
      <td>${book.book_kind}</td> 
      <td>${book.book_title}</td>
      <td>${book.book_price}</td> 
      <td>
          <c:if test="${book.book_count==0}">
         <font color="red"><b>일시품절</b></font> 
          </c:if>
          <c:if test="${book.book_count>0}">
      					${book.book_count}
          </c:if>
      </td> 
      <td>${book.author}</td>
      <td>${book.publishing_com}</td>
      <td>${book.publishing_date}</td>
      <td>${book.book_image}</td>
      <td>${book.discount_rate}</td>
      <td>${book.reg_date}</td>
      <td>
         <a href="bookUpdateForm.jsp?book_id=${book.book_id}&book_kind=${book_kind}">수정</a></td>
      <td width="50">
         <a href="bookDeleteForm.jsp?book_id=${book.book_id}&book_kind=${book_kind}">삭제</a></td>    
  </tr>
    </c:forEach><!-- 반복문 끝. -->
</table>
</c:if><!-- 테이블 끝  -->
<br><a href="../managerMain.jsp"> 관리자 메인으로</a> 
</body>
</html>