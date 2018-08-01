<%@page import="dao.CategoryDao"%>
<%@page import="model.Book"%>
<%@page import="dao.BookDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getServletContext().getContextPath();
	String book_kind = request.getParameter("book_kind");
	String book_id = request.getParameter("book_id");
   	String id="";
   	
   	int buy_Price=0;
   	/* session 체크 */
   	id = session.getAttribute("id")==null?"not":(String)session.getAttribute("id");
   	System.out.println("id="+id);
   	/* 카테고리 및 도서 정보 조회 */
   	String book_kindName ="";
   	BookDao dao = BookDao.getInstance();
   	/* 도성정보 추출 */
   	Book book = dao.getBookInfo(Integer.parseInt(book_id));
   	CategoryDao cateDao = CategoryDao.getInstance();
   	 book_kindName= cateDao.getBook_kindName(book_kind);
   	
   	 /* request에 속성으로 객체 저장 */
   	 request.setAttribute("book", book);
   	 request.setAttribute("id", id);
   	 request.setAttribute("book_kind", book_kind);
   	 request.setAttribute("book_kindName", book_kindName);
   	 request.setAttribute("path", path);
%>
<html><head><title>Book Content</title>
<style>
body{
  font-size: 9pt;
   background-color: #e0ffff;
   text-align: center;
}
table{
	background-color: #e0ffff;
}
td{
	font-size: 9pt;
	background-color: #b0e0e6;
}
select{
	font-size: 9pt;
}
.value_c{
  background-color: rgba(214,219,204,1);
}
.value_d{
 background-color: rgba(134,229,127,1);
}
</style>
<script>
function chk(){
	var buy_count  = parseInt(document.inform.buy_count.value);
	var book_count = parseInt(document.inform.book_count.value);
	if(buy_count > book_count){
		alert("구매 수량은 재고 수량을 초과하면 안됩니다.");
		document.inform.buy_count.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form action="cartInsert.jsp" name="inform" method="post" onsubmit="return chk()">
<table border="0" width="650" cellspacing="5" cellpadding="5" align="center">
<tr height="30">
<td rowspan="6" width="150" align="center" valign="middle">
 <img src="${path}/imageFile/${book.book_image}" border="0" width="150" height="200">
</td>
<td width="500"><font size="+1"><b>${book.book_title}</b></font>
</td>
</tr>
<tr><td><b>저자:${book.author}</b></td></tr>
<tr><td><b>출판사:${book.publishing_com}</b></td></tr>
<tr><td><b>출판일:${book.publishing_date}</b></td></tr>
<tr><td>정가:<s>
<fmt:formatNumber value="${book.book_price}" 
                 pattern="###,##0"/></s>원<br>
판매가:
<b>
<fmt:formatNumber value="${book.book_price*(100-book.discount_rate)/100}" 
                pattern="###,##0"/>원
</b>
</td>
<td>
<b>재고수량:<input type="text" size="5" name="book_count" 
                            value="${book.book_count}" disabled>권</b><br>
<b>수량:<input type="text" size="5" name="buy_count" value="1">권
</b>
<!-- 로그인 안된 경우 -->
<c:if test="${id=='not'}">
	<c:if test="${book.book_count==0}">
	 <b>일시품절</b>
	</c:if>
</c:if>
<!-- 로그인 된 경우 -->
<c:if test="${id!='not'}">
  <c:if test="${book.book_count==0}"><!-- 재고가 없는 경우 -->
    <b>일시 품절</b>
  </c:if>
  <!-- 재고가 있을 때 -->
  <c:if test="${book.book_count>0}">
    <input type="hidden" name="book_id" value="${book.book_id}">
    <input type="hidden" name="book_image" value="${book.book_image}">
    <input type="hidden" name="book_title" value="${book.book_title}">
    <input type="hidden" name="buy_price" value="${book.book_price}">
    <input type="hidden" name="book_kind" value="${book.book_kind}">
    
   <input type="submit" value="장바구니에 담기">
  </c:if>
</c:if>
<input type="button" value="목록으로" 
                   onclick="location.href='list.jsp?book_kind=${book_kind}'">
<input type="button" value='메인으로'
                   onclick="location.href='shopMain.jsp'">                   
</td>
</tr>
<tr>
<td colspan=2><br>${book.book_content}</td>
</tr>
</table>
</form>
</body>
</html>