<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 세션 체크 --> 
<%@ include file="../managerSessionChk.jsp" %>   
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록</title>
<script>
function checkForm(writeForm){
	if(!writeForm.book_kind.value){
		alert("책의 분류를 선택하세요");
		writeForm.book_kind.focus();
		return false;
	}
	if(!writeForm.book_title.value){
		alert("책의 제목을 입력하세요.");
		writeForm.book_title.focus();
		return false;
	}
	if(!writeForm.book_price.value){
		alert("책의 가격을 입력하세요.");
		writeForm.book_price.focus();
		return false;
	}
	if(!writeForm.book_count.value){
		alert("책의 수량을 입력하세요.");
		writeForm.book_count.focus();
		return false;
	}
	if(!writeForm.author.value){
		alert("저자를 입력하세요.");
		writeForm.author.focus();
		return false;
	}
	if(!writeForm.publishing_com.value){
		alert("출판사를 입력하세요.");
		writeForm.publishing_com.focus();
		return false;
	}
	if(!writeForm.publishing_date.value){
		alert("출판일을 입력하세요.");
		writeForm.publishing_date.focus();
		return false;
	}
	if(!writeForm.book_image.value){
		alert("이미지를 선택하세요.");
		writeForm.book_image.focus();
		return false;
	}
	if(!writeForm.book_content.value){
		alert("내용 요약을 등록하세요.");
		writeForm.book_content.focus();
		return false;
	}
	if(!writeForm.discount_rate.value){
		alert("내용 요약을 등록하세요.");
		writeForm.discount_rate.focus();
		return false;
	}
	
	//도서 가격체크
	//isNaN(값): 값이 숫자가 아니면 true( Not a Number)
	if(isNaN(writeForm.book_price.value)){
		alert("책의 가격은 숫자입니다.");
		writeForm.book_price.value="";
		writeForm.book_price.focus();
		return false;
	}
	//수량 숫자여부 체크
	if(isNaN(writeForm.book_count.value)){
		alert("책의 수량은 숫자입니다.");
		writeForm.book_count.value="";
		writeForm.book_count.focus();
		return false;
	}
	//할인율 숫자 여부 체크
	if(isNaN(writeForm.discount_rate.value)){
		alert("할인율은 숫자입니다.");
		writeForm.discount_rate.value="";
		writeForm.discount_rate.focus();
		return false;
	}
	//경로 설정
/* 	if(true)
	writeForm.action="bookRegisterPro1.jsp";
	else */
	writeForm.action="bookRegisterPro.jsp";
	//전송처리
	writeForm.submit();
}
</script>
</head>
<body>
<div align="center"><h2>도서 등록</h2>
<!-- <form action="bookRegisterPro.jsp" name="writeForm" 
                     enctype="multipart/form-data" method="post" onsubmit="checkFrom(this.form)">
 -->
 <form action="" name="writeForm" 
               enctype="multipart/form-data" method="post">
<table border=1 width=500>
<tr>
  <td align="right" colspan="2" bgcolor="yellow">
    <a href="../managerMain.jsp"><b>관리자 메인으로...</b></a>
  </td>
</tr>
<tr><td><b>분류 선택</b></td>
<td>
 <select name="book_kind">
 	<option value="100">문학</option>
 	<option value="200">외국어</option>
 	<option value="300">컴퓨터</option>
 </select>
</td>
<tr><td><b>제목</b></td>
<td><input type="text" size="50" maxlength="50" name="book_title" required></td>
</tr>
<tr><td><b>가격</b></td>
<td><input type="text" size="10" maxlength="9" name="book_price" required>원</td>
</tr>
<tr><td><b>수량</b></td>
<td><input type="text" size="10" maxlength="5" name="book_count" required>권</td>
</tr>
<tr><td><b>저자</b></td>
<td><input type="text" size="10" maxlength="30" name="author" required></td>
</tr>
<tr>
<tr><td><b>출판사</b></td>
<td><input type="text" size="20" maxlength="30" name="publishing_com" required></td>
</tr>
<tr>
<td><b>출판일</b></td>
<td><input type="date" name="publishing_date" required></td>
</tr>
<tr><td><b>표지 이미지</b></td>
<td><input type="file" name="book_image" required></td>
</tr>
<tr><td><b>내용 요약</b></td>
<td><textarea rows="13" cols="40" name="book_content" required></textarea>
</td>
</tr>
<tr><td><b>할인율</b></td>
<td><input type="text" size="5" maxlength="2" name="discount_rate" value="0" required>%
</td>
</tr>
<tr align="center">
<td colspan=2>
<input type="button" value="책등록" onclick="checkForm(this.form)">
<!-- <input type="submit" value="책등록"> -->
<input type="reset" value="다시 작성">
</td>
</tr>
</table>                     
</form>
</div>
</body>
</html>