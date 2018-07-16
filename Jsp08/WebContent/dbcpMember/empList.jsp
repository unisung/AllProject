<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	   Connection conn=null;
       String sql = "select * from emp where eno=?";
      try{
    	  Context init = new InitialContext();
    	  DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	  conn = ds.getConnection();
    	  PreparedStatement pstmt = conn.prepareStatement(sql);
    	  
    	  String id = request.getParameter("id");
    	  if(id!=null && !id.equals("")){
    		pstmt.setString(1,id);
    		ResultSet rs = pstmt.executeQuery();
    		if(rs.next()){
    			out.print(rs.getString("eno")+":"+rs.getString("ename")+":"+
    					 rs.getString("job")+":"+rs.getString("hiredate")+":"+
    			         rs.getInt("salary"));
    		}
    	  }
      }catch(Exception e){
    	  out.print(e.getMessage());
      }
 
 %>
</body>
</html>