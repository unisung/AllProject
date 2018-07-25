<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../managerSessionChk.jsp" %>
<%@ include file="../../color.jsp" %>
<html><head>
<title>상품등록</title>
<script type="text/javascript" src="checkScript.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<div align="center"><h2>책 등록</h2>
<form action="bookRegisterPro.jsp" name="writeform" 
                                                 enctype="multipart/form-data" method="post">
	<table border="1" width="500">
		<tr><td align="right" colspan="2" bgcolor="<%=value_c%>">
		       <a href="../managerMain.jsp"><b>관리자 메인으로</b></a></td>
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
		    <td><input type="text" size="50" maxlength="50" name="book_title"></td>
		    </tr>
		    <tr>
		    <td><b>가격</b></td>
		    <td><input type="text" size="10" maxlength="9" name="book_price">원</td>
		    </tr>     
	        <tr><td><b>수량</b></td>
	        <td><input type="text" size="10" maxlength="5" name="book_count">권</td>
	        </tr>
	        <tr>
		    <td><b>저자</b></td>
		    <td><input type="text" size="10" maxlength="30" name="author"></td>
		    </tr>     
	        <tr><td><b>출판사</b></td>
	        <td><input type="text" size="20" maxlength="30" name="publishing_com"></td>
	        </tr>
	        <tr><td><b>출판일</b></td>
	        <td><input type="date" name="publishing_date"></td>
	        </tr>
	        <tr>
	        <td><b>이미지</b></td>
	        <td><input type="file" name="book_image"></td>
	        </tr>
	        <tr><td><b>내용</b></td>
	        <td><textarea rows="13" cols="40" name="book_content"></textarea>
	        </tr>
	        <tr><td><b>할인율</b></td>
	        <td><input type="text" size="5" maxlength="2" name="discount_rate"
	                     value="0">%</td>
	        </tr>
	        <tr>
	        <td colspan="2" bgcolor="<%=value_c%>" align="center">
	         <input type="button" value="책등록" onclick="checkForm(this.form)">
	         <input type="reset" value="다시작성">
	</table>
</form>


</div>

</body>
</html>