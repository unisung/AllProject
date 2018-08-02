<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
    String list = request.getParameter("list");
	//세션에서 로그인 id 추출
	String buyer = (String)session.getAttribute("id");
	String book_kind = request.getParameter("book_kind");
	
	System.out.println("id="+buyer);
	
	 CartDao dao = CartDao.getInstance();
	int result = 0;
	 //전체인 경우 삭제
	if("all".equals(list)){
		result =dao.deleteAll(buyer);
	}else{//건별 인경우 삭제 
		result = dao.deleteCart(Integer.parseInt(list));
	} 
	 //장바구니 비우기 결과에 따른 처리
	if(result>0){
		out.print("<script>");
		out.print("alert('장바구니 비우기 성공!');");
		out.print("location.href='cartList.jsp?book_kind="+book_kind+"';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('에러발생 콘솔메세지를 확인하세요');");
		out.print("history.back();");
		out.print("</script>");
	}
%>