<%@page import="dao.BookDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	BookDao manager = BookDao.getInstance();
	int check = manager.managerCheck(id,password);
	if(check==1){
		session.setAttribute("managerId", id);
		response.sendRedirect("../managerMain.jsp");
		
	}else if(check==0){
		out.print("<script>");
		out.print("alert('비밀번호가 맞지않습니다.');");
		out.print("history.back();");
		out.print("</script>");
		
	}else{
		out.print("<script>");
		out.print("alert('ID가 존재하지않습니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>

