<%@page import="model.Book"%>
<%@page import="dao.BookDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../color.jsp" %>
<!-- 메니저 로그인 여부 확인  -->
<%@ include file="../managerSessionChk.jsp" %>
<%
	int book_id = Integer.parseInt(request.getParameter("book_id"));
    String book_kind = request.getParameter("book_kind");
     BookDao dao = BookDao.getInstance();/* 싱글톤의  BookDao객체 호출 */
     Book book = dao.getBookInfo(book_id);
     request.setAttribute("book", book);
     
     request.setAttribute("orgBook_kind",book_kind);
%>
<html><head>
<title>도서 상품 수정 폼</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style type="text/css">body{text-align: center;}</style>
<script type="text/javascript" src="checkScript.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<div align="center"><h2>도서 상품 수정</h2>

<form action="bookUpdatePro.jsp" name="writeForm"
                     enctype="multipart/form-data"   method="post">
<input type="hidden" name="org_book_kind" value="${orgBook_kind}">                     
<table width="500" border="1" bgcolor="<%=bodyback_c%>">
<tr> 
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
     <a href ="../managerMain.jsp"><b>관리자 메인으로 </b></a> &nbsp;
     <a href="bookList.jsp?book_kind=${orgBook_kind}"><b>목록으로</b></a>
    </td>   
<tr>
   <td><b>분류선택</b></td>
    <td>
    		<select name="book_kind">
    			<option value="100" <c:if test="${book.book_kind==100}">selected</c:if>>문학</option>
    			<option value="200" <c:if test="${book.book_kind==200}">selected</c:if>>외국어</option>
    			<option value="300" <c:if test="${book.book_kind==300}">selected</c:if>>컴퓨터</option>
    		</select>
    </td>
</tr>
<tr>	
	<td><b>제목</b></td>
	<td><input type="text" size="50" maxlength="50" name="book_title"
	          value =${book.book_title}>
	        <input type="hidden" name="book_id" value=${book.book_id}>
	</td>
</tr>
<tr>
  <td><b>가격</b></td>
  <td><input type="text" size="10" maxlength="9" name="book_price"
            value=${book.book_price}>원
  
  </td>
  </tr>
  <tr>
  <td><b>수량</b></td>
  <td><input type="text" size="10" maxlength="5" name="book_count"
            value=${book.book_count}>권
    </td>
  </tr>
   <tr>
   <td><b>저자</b></td>
   <td><input type="text" size="10" maxlength="10" name="author"
            value =${book.author}> 
   
   </td>
   </tr>
   <tr>
   <td><b>출판사</b></td>
   <td><input type="text" size="20" maxlength="20" name="publishing_com"
             value=${book.publishing_com}>
  </td>
  </tr>
  <tr>
  <td><b>출판일</b></td>
  <td><input type="date" name="publishing_date"
     value = ${book.publishing_date}>
   </td>  
     </tr>
  <tr>
  <td><b>이미지</b></td>
  <td><input type="file" name="book_image"></td><!-- ${book.book_image} -->
  </tr>
  <tr>
      <td><b>내용</b></td>
      <td><textarea name="book_content" rows="13" cols="40">${book.book_content}</textarea>
      </td>
	</tr>
	<tr>
	<td><b>할인율</b></td>
	<td><input type="text" size="5" maxlength="2" name="discount_rate"
	         value=${book.discount_rate}>%
	</td>
	</tr>         
<tr>
	<td colspan="2" bgcolor="<%=value_c%>" align="center">
	<input type="button" value="도서 상품 수정" onclick="updateCheckForm(this.form)">
	<input type="reset" value="다시작성">
</tr>
</table>
</form>
</div>
</body>
</html>