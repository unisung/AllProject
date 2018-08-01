<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
	String book_kind = request.getParameter("book_kind");
    String buyer = (String)session.getAttribute("id");
%>
<jsp:useBean id="cart" class="model.Cart">
<jsp:setProperty name="cart" property="*"/>
</jsp:useBean>
<%
	cart.setBuyer(buyer);//cart에 구매자 id 설정
/* 	out.print(cart.getBook_id()+"<br>"+
	          cart.getBuy_count()+"<br>"+
	          cart.getBuyer() +"<br>"); */
	 
	 CartDao dao = CartDao.getInstance();
	int result = dao.insertCart(cart);
	if(result>0){
		out.print("<script>");
		out.print("alert('카트에 저장 성공');");
		out.print("location.href='cartList.jsp?book_kind="+book_kind+"';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('카트 저장 중 에러 발생');");
		out.print("history.back();");
		out.print("</script>");
	} 
%>
</body>
</html>