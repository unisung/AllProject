<%@page import="java.sql.*"%><%@page import="javax.sql.*"%><%@page import="javax.naming.*"%>
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
          String sql = "select * from emp where dno=?";
          String deptNo = request.getParameter("deptNo");
         try{
		//context.xml에서 db정보 얻기
    	  Context init = new InitialContext();
    	  DataSource  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	  conn = ds.getConnection();
    	 //connect얻어서 db쿼리 작업
    	  PreparedStatement pstmt 
    	        = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
    			                             ResultSet.CONCUR_UPDATABLE);
    	  pstmt.setString(1,deptNo);  
    	  ResultSet rs = pstmt.executeQuery();
    	  
    	  ResultSetMetaData rsmd = rs.getMetaData();
    	  out.print("컬럼수:"+rsmd.getColumnCount()+"<br>");
    	  for(int i=1;i<=rsmd.getColumnCount();i++){
    		 out.print(rsmd.getColumnName(i)+"&nbsp;&nbsp;&nbsp;&nbsp;");
    	  }
    	  out.print("<br>");
    	  for(int i=1;i<=rsmd.getColumnCount();i++){
    		 out.print(rsmd.getColumnTypeName(i)+"&nbsp;&nbsp;&nbsp;&nbsp;");
    	  }
    	  out.print("<br>");
    	  rs.first();
    	  out.print(rs.getInt(1)+","+rs.getString(2)+","
    	             +rs.getInt("salary")+","+rs.getString("hiredate")+"<br>");
    	  rs.last();
    	  out.print(rs.getInt(1)+","+rs.getString(2)+","
 	             +rs.getInt("salary")+","+rs.getString("hiredate")+"<br>");
    	  rs.absolute(3);
    	  out.print(rs.getInt(1)+","+rs.getString(2)+","
  	             +rs.getInt("salary")+","+rs.getString("hiredate")+"<br>");    	  
         }catch(Exception e){
        	 out.print(e.getMessage());
         }
%>
</body>
</html>