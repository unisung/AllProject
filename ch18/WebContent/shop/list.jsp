<%@page import="model.PagingBean"%>
<%@page import="util.Paging"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String book_kind = request.getParameter("book_kind");

	String path = request.getContextPath();
	List<Book> bookList = null;
	Book book = null;
	String book_kindName = "";
	
	/* 페이징 설정*/
	int pageSize= 10;
	int BLOCKSIZE=10;//한 블럭당 출력되는 페이지 수
	String pageNum = request.getParameter("pageNum");

	
	BookDao dao = BookDao.getInstance();
	int count = dao.getBookCount(book_kind);
	
	Paging pg = new Paging();
    PagingBean pb = pg.getPaging(pageNum, pageSize, BLOCKSIZE, count);
	bookList = dao.getBooks(book_kind,pb.getStartRow(),pb.getEndRow());
	
	if (book_kind.equals("100")) {
		book_kindName = " 문학";
	} else if (book_kind.equals("200")) {
		book_kindName = "외국어";
	} else if (book_kind.equals("300")) {
		book_kindName = "컴퓨터";
	} else if (book_kind.equals("all")) {
		book_kindName = "전체";
	}

	
	request.setAttribute("pageCount", pb.getPageCount());
	request.setAttribute("startPage",pb.getStartPage());
	request.setAttribute("BLOCKSIZE",BLOCKSIZE);
	request.setAttribute("endPage",pb.getEndPage());
	request.setAttribute("path", path);
	request.setAttribute("book_kind", book_kind);
	request.setAttribute("count",count);
	request.setAttribute("bookList", bookList);
	request.setAttribute("book_kindName", book_kindName);
%>
<html><head><title>도서 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <table width="850">
  		<tr><td><img src="../module/logo.jpg" width="150" height="120">
  		 	</td>
  		 	<td><jsp:include page="../module/top.jsp"/></td>
  		 </tr>
  		 <tr><td width="150" valign="top">
  		       <jsp:include page="../module/left.jsp" flush="false"/>
  		       </td>
  		       <td width="700" valign="top">

  <h3>${book_kindName}분류의 목록</h3>
  <a href="${path}/shop/shopMain.jsp"><b>메인으로</b></a>
  <c:if test="${!empty bookList}">
  <c:forEach var="book" items="${bookList}">
	<table width="600" align="center">
		<tr height="30">
		<td rowspan="4" width="100" align="center" valign="middle">
		<a href="${path}/shop/bookContent.jsp?book_id=${book.book_id}&book_kind=${book_kind}">
		<img src="${path}/imageFile/${book.book_image}" border="0" width="60" height="90">
		</a>
		</td>
		<td width="350"><font size="+1"><b>
		<a href="${path}/shop/bookContent.jsp?book_id=${book.book_id}&book_kind=${book_kind}">
			${book.book_title}
		</a>
		</b></font>
		</td>
		<td rowspan="4" width="100" align="center" valign="middle">
		<c:if test="${book.book_count==0}">
	            <b>일시품절</b>
	    </c:if>
	    <c:if test="${book.book_count>0}">
	            &nbsp;
	    </c:if>
	      </td>
	      </tr>
	      <tr height="30">
		            <td  width="350">출판사:${book.publishing_com}</td>
		            </tr>
		            <tr height="30">
		            <td  width="350">저자:${book.author}</td>
		            </tr>
		            <tr height="30">
		            <td width="350">정가:
		             <s>
		             <fmt:formatNumber value="${book.book_price}" pattern="###,##0" /></s>
		             	원<br>
		             	판매가:<b>
		             <fmt:formatNumber 
		                      value="${ book.book_price*(100-book.discount_rate)/100}" 
		                      pattern="###,##0"/>
		              </td> 
		              </tr> 		            
	</table><!--목록상세 테이블 끝.  -->
	</c:forEach><!--목록상세 반복 끝.  -->
	<div align="center"><font size="4"><b>
  <c:if test="${startPage>BLOCKSIZE}">
  <a href="list.jsp?pageNum=${startPage-BLOCKSIZE}&book_kind=${book_kind}">[이전]</a>
  </c:if>
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
  		<a href="list.jsp?pageNum=${i}&book_kind=${book_kind}">${i}</a>
  </c:forEach>
  <c:if test="${endPage < pageCount}">
  <a href="list.jsp?pageNum=${startPage+BLOCKSIZE}&book_kind=${book_kind}">[다음]</a>
  </c:if>
  </b></font>
	</div>
	</c:if>
  	<br>
</td>
 </tr>

 <tr><td valign="top" align="center">
   <img src="../module/logo.jpg" width="90" height="60"></td>
   <td width="700" valign="top">
   <jsp:include page="../module/bottom.jsp" flush="false"/>
  	</td>
  	</tr>	 
  </table>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>