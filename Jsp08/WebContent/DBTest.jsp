<%@page import="java.sql.Connection"%><%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터베이스로 접속하기</title>
</head>
<body>
     <h3>데이터베이스 연결 테스트</h3>
     <%
         String driver = application.getInitParameter("Driver");
         String url = application.getInitParameter("url");
         String user=application.getInitParameter("user");
         String password=application.getInitParameter("password");
         out.print(driver+"<br>");
         out.print(url+"<br>");
         out.print(user+"<br>");
         out.print(password+"<br>");
         try{
        //드라이버 로드
         Class.forName(driver);
        //DB연결객체 얻기
         Connection conn=DriverManager.getConnection(url,user,password);
        if(conn!=null){
        	out.print("WebDb에 연결했습니다.");
        	conn.close();
        	out.print("WebDb에서 연결을 끊었습니다.");
        }else{
        	out.print("WebDb 연결을 할 수 없습니다.");
        } 
         }catch(Exception e){
        	 e.printStackTrace();
         }
     %>
</body>
</html>