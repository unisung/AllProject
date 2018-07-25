<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 메니저 id 로그인 체크 확인 -->
<%@ include file="../managerSessionChk.jsp" %>
<%
    String sbook_id = request.getParameter("book_id");
    if(sbook_id==null || "".equals(sbook_id)){
    	out.print("<script>");
    	out.print("alert('북상품 id가 없습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }else{
    	int book_id = Integer.parseInt(sbook_id);
    	request.setAttribute("book_id", book_id);
     }
    
    String book_kind = request.getParameter("book_kind");
    
    if(book_kind==null||"".equals(book_kind)){
    	out.print("<script>");
    	out.print("alert('북상품 카테고리가 없습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
    request.setAttribute("book_kind", book_kind);
    
%>
<html><head><title>도서 상품 삭제</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="checkScript.js"></script>
</head>
<body>
   <h2>도서 상품 삭제</h2>
   <a href="bookList.jsp?book_kind=${book_kind}">목록으로</a><p>
      					<!-- chk() 메소드 , 삭제여부를 물어보는 popup창 을 보여주고
   					        yes/no  yes면 삭제 처리로 no면 리스트로 되돌리기 -->
   <p><h3>삭제할 서적 상품 번호:${book_id}</h3>  
   <form action="#" name="deleteForm" method="post">
   <input type="hidden" name="book_id" id="book_id" value="${book_id}"> 					        
   <input type="hidden" name="book_kind" id="book_kind" value="${book_kind}"> 					        
   <input type="button" value="삭제" 
         onclick="chk(this.form)">
           <%-- onclick="location.href='bookDeletePro.jsp?book_id=${book_id}&book_kind=${book_kind}';"> --%>
   </form>
</body>
</html>