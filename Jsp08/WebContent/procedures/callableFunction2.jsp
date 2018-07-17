<%@page import="java.sql.Types"%><%@page import="java.sql.CallableStatement"%><%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%><%@page import="javax.naming.InitialContext"%><%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn;
  try{
	  Context init = new InitialContext();
	  DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	  conn = ds.getConnection();
	  //
	  String call ="{? = call emp_info(?)}";
	  CallableStatement cstmt = conn.prepareCall(call);
	  //in 파라미터 값 설정
	  cstmt.setInt(2,7369);
	  cstmt.registerOutParameter(1, Types.VARCHAR);
	  
	  cstmt.execute();
	  out.print("result="+cstmt.getString(1));
	  conn.close();	  
  }catch(Exception e){
	  out.print(e.getMessage());
  }
    

%>
</body>
</html>