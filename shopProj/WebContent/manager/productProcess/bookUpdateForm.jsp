<%@page import="model.Book"%><%@page import="dao.BookDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 매니저 로그인 여부 확인 -->
<%@ include file="../managerSessionChk.jsp" %>    
<html><head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function updateCheckForm(writeForm){
	if(!writeForm.book_kind.value){
		alert("책의 분류를 선택하세요");
		writeForm.book_kind.focus();
		return false;
	}
	if(!writeForm.book_title.value){
		alert("책의 제목을 입력하세요");
		writeForm.book_title.focus();
		return false;
	}
	if(!writeForm.book_price.value){
		alert("책의 가격을 입력하세요");
		writeForm.book_price.focus();
		return false;
	}
	if(!writeForm.book_count.value){
		alert("책의 가격을 입력하세요");
		writeForm.book_count.focus();
		return false;
	}
	if(isNaN(writeForm.book_price.value)){
		alert('책의 가격은 숫자입니다.');
		writeForm.book_price.value="";
		writeForm.book_price.focus();
		return false;
	}
	if(isNaN(writeForm.book_count.value)){
		alert('책의 수량은 숫자입니다.');
		writeForm.book_count.value="";
		writeForm.book_count.focus();
		return false;
	}
	if(!writeForm.author.value){
		alert('저자를 입력하세요');
		writeForm.author.focus();
		return false;
	}
	if(!writeForm.publishing_com.value){
		alert('출판사를 입력하세요');
		writeForm.publishing_com.focus();
		return false;
	}
	if(!writeForm.publishing_date.value){
		alert('출판일을 입력하세요');
		writeForm.publishing_date.focus();
		return false;
	}
	if(!writeForm.book_content.value){
		alert('출판일을 입력하세요');
		writeForm.book_content.focus();
		return false;
	}
	if(!writeForm.discount_rate.value){
		alert('출판일을 입력하세요');
		writeForm.discount_rate.focus();
		return false;
	}
	if(isNaN(writeForm.discount_rate.value)){
		alert('할인율은 숫자입니다.');
		writeForm.discount_rate.value="";
		writeForm.discount_rate.focus();
		return false;
	}
	
	//이동 경로 설정 action =이동경로;
	writeForm.action = "bookUpdatePro.jsp";
	//이동 submit()
	writeForm.submit();
}
</script>
<%
  int book_id = Integer.parseInt(request.getParameter("book_id"));
  String book_kind = request.getParameter("book_kind");
  BookDao dao = BookDao.getInstance();
  //파라미터로 받은 book_id로 조회
  Book book = dao.getBookInfo(book_id);
  //request에 저장
  request.setAttribute("book", book);
  request.setAttribute("orgBook_kind", book_kind);
%>
</head>
<body>
<h3>도서 상품 수정 폼</h3>
<div align="center">
<form action="" name="writeForm" 
                enctype="multipart/form-data" method="post">
<input type="hidden" name="org_book_kind" value="${orgBook_kind}">
<table width="500" border="1" bgcolor="yellow">
<tr>
 <td align="right" colspan="2">
    <a href="../managerMain.jsp"><b>관리자 메인으로 </b></a>&nbsp;
    <a href="bookList.jsp?book_kind=${orgBook_kind}"><b>목록으로</b></a> 
 </td>
</tr>
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
<td><input type="text" name="book_title" size="50" maxlength="50" value=${book.book_title}>
    <input type="hidden" name="book_id" value=${book.book_id}>
</td>
</tr>
<tr>
<td><b>가격</b></td>
<td><input type="text" size="10" maxlength="9" name="book_price" 
                                              value="${book.book_price}">원
</td>                                              
</tr>
<tr>
<td><b>수량</b></td>
<td>
<input type="text" size="10" maxlength="9" name="book_count" value="${book.book_count}">권
</td>
</tr>
<tr>
<td><b>저자</b></td>
<td>
<input type="text" size="10" maxlength="10" name="author" value="${book.author}">
</td>
</tr>
<tr>
<td><b>출판사</b></td>
<td><input type="text" size="20" maxlength="20" name="publishing_com" value=${book.publishing_com}>
</td>
</tr>
<tr>
<td><b>출판일</b></td>
<td>
<input type="date" size="20" maxlength="20" name="publishing_date" value=${book.publishing_date}>
</td>
</tr>
<tr>
<td><b>이미지</b></td>
<td>
<input type="file" name="book_image">
</td>
</tr>
<tr>
<td><b>내용 요약</b></td>
<td>
<textarea rows="13" cols="40" name="book_content">${book.book_content}</textarea>
</td>
</tr>
<tr>
<td><b>할인율</b></td>
<td>
<input type="text" size="5" maxlength="2" name="discount_rate" value=${book.discount_rate}>%
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="button" value="도서수정" onclick="updateCheckForm(this.form)">
<input type="reset" value="다시작성">
</td>
</tr>
</table>





</form>



</div>
</body>
</html>