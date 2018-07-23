<%@page import="java.sql.Connection"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
  	  Connection conn= BoardDao.getInstance().getConnection();
      if(conn!=null)
    	  out.print("db접속 성공");
      else
    	  out.print("db접속 실패");
  %>
</body>
</html>