<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../managerSessionChk.jsp" %>
<%
	String sBook_id= request.getParameter("book_id");
	//파라미터로 넘어온 book_id가 없을 때
    if(sBook_id==null||"".equals(sBook_id)){
    	out.print("<script>");
    	out.print("alert('북상품 id가 없습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }else{
      int book_id = Integer.parseInt(sBook_id);
      request.setAttribute("book_id", book_id);
    }
	
	String book_kind = request.getParameter("book_kind");
	if(book_kind==null||"".equals(book_kind)){
		out.print("<script>");
		out.print("alert('분류코드가 없습니다.');");
		out.print("history.back();");
		out.print("</script>");
	}else{
		request.setAttribute("book_kind", book_kind);
	}
%>
<script>
function chk(form){
	var yesNo = confirm("정말삭제하시겠습니까?");
	if(yesNo == true){//yes
		form.action = "bookDeletePro.jsp";
		form.submit();
	}else{//no
		history.back();
	}
}
</script>
<html>
<body>
<h2>도서 상품 삭제</h2>
<a href="bookList.jsp?book_kind="${book_kind}">목록으로</a><p>
<p><h3>삭제할 서적 상품 번호: ${book_id}</h3>
<form action="" name="deleteForm" method="post">
<input type="hidden" name="book_id" id="book_id" value="${book_id}">
<input type="hidden" name="book_kind" id="book_kind" value="${book_kind}">
<input type="button" value="삭제" onclick="chk(this.form)">
</form>
</body>
</html>