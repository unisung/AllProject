<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    String option = request.getParameter("favor");
    BoardDao dao = BoardDao.getInstance();
    String ip = request.getRemoteAddr()==null?"127.0.0.1":request.getRemoteAddr();
    String id = request.getParameter("id")==null?"":request.getParameter("id");
    
    int result = dao.updateFavor(num, ip, id, option);
    if(result>0)
    	response.sendRedirect("list.jsp?pageNum="+pageNum);
%>
</body>
</html>