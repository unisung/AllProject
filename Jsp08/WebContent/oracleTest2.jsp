<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    //초기 파라미터 읽어오기
    String driver = application.getInitParameter("Driver");
    String url = application.getInitParameter("url");
    String user =application.getInitParameter("user");
    String password = application.getInitParameter("password");
    String sql="select * from dept";
    
    //1.db접속-1.드라이버 로딩
     Class.forName(driver);
    //2.연결맺기
     Connection conn = DriverManager.getConnection(url, user, password);
    //3.쿼리객체생성
     Statement stmt =conn.createStatement();
    //4.쿼리문 실행
     ResultSet rs = stmt.executeQuery(sql);
     ResultSetMetaData mrs = rs.getMetaData();
    //5.결과받아서 처리
    for(int i=1;i<=mrs.getColumnCount();i++)
    	       out.print(mrs.getColumnName(i).toLowerCase()+"|");
    out.print("<br>");
    while(rs.next()){
    	 int i=0;
    	 out.print(rs.getInt(++i)+"|"+rs.getString(++i)+"|"+rs.getString(++i));
    	 out.print("<br>");
     }
    //6.자원해제
    rs.close();
    stmt.close();
    conn.close();
%>
</body>
</html>