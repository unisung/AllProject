<%@page import="dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../managerSessionChk.jsp"%>
<%
		/* ~Pro.jsp 부분은 MVC에서 Servlet으로 넘어감 */
		request.setCharacterEncoding("utf-8");
		String sbook_id = request.getParameter("book_id");
		String book_kind = request.getParameter("book_kind");
		if(book_kind==null||"".equals(book_kind)){
			out.print("<script>");
			out.print("alert('book_kind가 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
		int book_id = 0;
		if(sbook_id!=null && !sbook_id.equals("")){
			book_id = Integer.parseInt(sbook_id);
		}else{
			out.print("<script>");
			out.print("alert('book_id가 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
		
 		BookDao dao = BookDao.getInstance();
		int result = dao.deleteBook(book_id); 
		 if(result>0){
 			out.print("<script>");
			out.print("alert('해당 서적 상품을 삭제처리 하였습니다.');");
			out.print("location.href='bookList.jsp?book_kind="+book_kind+"';");
			out.print("</script>");
	 	}else{
			out.print("<script>");
			out.print("alert('삭제실패!... 콘솔 메세지를 확인하세요');");
			out.print("location.href='bookDeleteForm.jsp';");
			out.print("</script>");
		} 
%>