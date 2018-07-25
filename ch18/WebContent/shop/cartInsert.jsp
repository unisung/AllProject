<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="loginCheck.jsp" %>
<%
	  request.setCharacterEncoding("utf-8");
     String book_kind = request.getParameter("book_kind");
     String buyer = (String)session.getAttribute("id");
%>
<jsp:useBean id="cart" class="model.Cart"/>
<jsp:setProperty property="*" name="cart"/>
<%
		cart.setBuyer(buyer);/* cart에 id 설정 */
		CartDao dao = CartDao.getInstance();
		int result = dao.insertCart(cart);
		if(result>0){
			out.print("<script>");	
			out.print("alert('카트저장 성공!');");	
			out.print("location.href='cartList.jsp?book_kind="+book_kind+"';");	
			out.print("</script>");	
			//response.sendRedirect("cartList.jsp?book_kind="+book_kind);
		}
		else{
			out.print("<script>");
			out.print("alert('에러가 발생하였습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
%>
