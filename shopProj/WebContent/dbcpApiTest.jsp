<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Context  init = null;
    Connection  conn =null;
try{
	 init = new InitialContext();
	 DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	  conn = ds.getConnection();
	 if(conn!=null)
		 out.print("접속 성공!");
	 else
		 out.print("접속 실패!!!");
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(conn!=null) conn.close();
	}catch(Exception e){}
}
%>
</body>
</html>