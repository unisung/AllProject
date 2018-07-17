<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
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
	  //저장할 파일의 위치
	  File file = new File("C:\\Temp\\img\\movie3.jpg");
	  //파일을 읽어들일 입력스트림 생성
	  InputStream is = new FileInputStream(file);
	  //파일의 끝을 알려주는 파일사이즈
	  int fileSize = (int)file.length();
	  String sql = "insert into imgTest(id,photo) values('movie3',?)";
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  //바이너리파일 입력을 위한 변수 세팅setBinaryStream(index,스트림,파일사이즈)
	  pstmt.setBinaryStream(1, is, fileSize);
	  int count = pstmt.executeUpdate();
	  if(count>0) out.print("입력성공!");
	  //자원해제
	  is.close();
	  pstmt.close();
	  conn.close();
  }catch(Exception e){
	  out.print(e.getMessage());
  }
  
  
  
  %>
</body>
</html>