<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%   /* dbcp(DataBase Connection Pool방식 접속) */
 	 Connection conn =null;
    try{
    	Context init = new InitialContext();
    	String reSourceName = "jdbc/OracleDB";
    	DataSource ds 
    	= (DataSource)init.lookup("java:comp/env/"
    	  +reSourceName);
    	conn = ds.getConnection();
        
    	out.print("<h3>DB에 연결되었습니다.</h3>");
    }catch(Exception e){
    	out.print("<h3>연결 실패 하였습니다.</h3>");
    }
 %>
</body>
</html>