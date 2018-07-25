<%@page import="dao.CartDao"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ include file="loginCheck.jsp" %>
<%
	String list = request.getParameter("list");
    String buyer = (String)session.getAttribute("id");
    String book_kind = request.getParameter("book_kind");
    CartDao dao = CartDao.getInstance();
    int result=0;
	
    if(list.equals("all"))
		result = dao.deleteAll(buyer);//해당id의 모든 카트 정보 삭제
	else
		result = dao.deleteCart(Integer.parseInt(list));//특정 카트 정보 삭제
	    if(result>0){
	    	out.print("<script>");
	    	out.print("alert('장바구니 비우기 성공!');");
	    	out.print("location.href='cartList.jsp?book_kind="+book_kind+"';");
	    	out.print("</script>");
	    }else{
	    	out.print("<script>");
	    	out.print("alert('에러발생 콘솔 메세지를 보세요.')");
	    	out.print("history.back();");
	    	out.print("</script>");
	    }
%>





