<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	  String sql ="select eno, ename from emp order by eno";
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  ResultSet rs = pstmt.executeQuery();
	  %>
	  <form action="callableFunction2.jsp">
	  <label>사원리스트</label>
	  <select name="eno">
	  <option value="00">선택</option>
	  <%
	  while(rs.next()){
	  out.print("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>");	  
	  }
	  %>
	  </select>
	  <p>
	  <input type="submit" value="전송">
	  </p>
	  </form>
	  <%
	  conn.close();	  
  }catch(Exception e){
	  out.print(e.getMessage());
  }
    
%>
</body>
</html>