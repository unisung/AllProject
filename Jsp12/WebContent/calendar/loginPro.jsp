<%@page import="dto.LoginDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    UserDao dao = UserDao.getInstance();
    LoginDto dto = dao.login(id,password);
    if(dto!=null){
    	session.setAttribute("login", dto);
    	session.setMaxInactiveInterval(30*60);
    	response.sendRedirect("loginA.jsp");
    }
    

%>
</body>
</html>