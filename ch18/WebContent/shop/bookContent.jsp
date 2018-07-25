<%@page import="model.Book"%><%@page import="dao.BookDao"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/* project uri 경로명 */
    String path = request.getServletContext().getContextPath();
	String book_kind = request.getParameter("book_kind");
    String book_id = request.getParameter("book_id");
    String id="";
    int buy_price = 0;
    /* session - id 체크 */
    if(session.getAttribute("id")==null)
    	id="not";
    else
    	id= (String)session.getAttribute("id");
    /* 카테고리 및 도서 정보 조회 */
    String book_kindName="";
    BookDao dao = BookDao.getInstance();
    /* 도서 상품 정보 추출  */
    Book book = dao.getBookInfo(Integer.parseInt(book_id));
    if(book_kind.equals("100"))
    	book_kindName="문학";
    else if(book_kind.equals("200"))
    	book_kindName="외국어";
    else if(book_kind.equals("300"))
    	book_kindName="컴퓨터";
     
    /* request에 속성 저장  */
    request.setAttribute("book", book);
    request.setAttribute("id","hong");
    request.setAttribute("book_kind",book_kind);
    request.setAttribute("path", path);
    
%>
<html><head><title>Book shop</title>
<script type="text/javascript">
function chk(){
	var buy_count = parseInt(document.inform.buy_count.value);
	var book_count=parseInt(document.inform.book_count.value);
	if(buy_count > book_count){
		alert("구매 수량은 재고 수량을 초과하면 안됩니다.");
		document.inform.buy_count.focus();
		return false;
	}	
	return true;
}
</script>

</head>
<link href="style.css" rel="stylesheet" type="text/css"><body>
<form name="inform" method="post" action="cartInsert.jsp" onsubmit="return chk()">
<table border="0" width="650" cellpadding="5" cellspacing="5" align="center">
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
                  <fmt:formatNumber  value="${book.book_price}" pattern="###,##0"/>원
                   </s><br>
              판매가:<b>
              	  <fmt:formatNumber value="${book.book_price*(100-book.discount_rate)/100}"
              	                               pattern="###,##0"/>원
              </b>
        </td>     
        <td>  <b>재고수량:<input type="text" size="5" name="book_count" value="${book.book_count}" disabled>개</b><br>
                 <b>수량:<input type="text" size="5" name="buy_count" value="1">개</b>         
				   <c:if test="${id=='not' }">
				   	    <c:if test="${book.book_count==0 }">
				   	    	<b>일시품절</b>
				   	    </c:if>
				   </c:if>
				   <c:if test="${id!='not'}">
				       <c:if test="${book.book_count<=0}">
				            <b>일시품절</b>
				       </c:if>
				       <c:if test="${book.book_count>0}">
				          <input type="hidden" name="book_id" 		value="${book.book_id}">
				          <input type="hidden" name="book_image" 	value="${book.book_image}">
				          <input type="hidden" name="book_title" 		value="${book.book_title}">
				          <input type="hidden" name="buy_price" 		value="${book.book_price}">
				          <input type="hidden" name="book_kind" 	value="${book.book_kind }">
				          
				          <input type="submit" value="장바구니에 담기">
				        </c:if>   
				   </c:if>
				   <input type="button" value="목록으로" 
				             onclick="location.href='list.jsp?book_kind=${book_kind}'">
				   <input type="button" value="메인으로"
				             onclick="location.href='shopMain.jsp'"> 
 		</td>
 		</tr>
 		<tr>
 		<td colspan="2"><br>${book.book_content}</td>
 		</tr> 
</table>
</form>
</body>
</html>