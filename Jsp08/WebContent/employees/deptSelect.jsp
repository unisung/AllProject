<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
String sql="select * from dept order by no";

//1.db접속-1.드라이버 로딩
 Class.forName(driver);
//2.연결맺기
 Connection conn = DriverManager.getConnection(url, user, password);
//3.쿼리객체생성
 Statement stmt =conn.createStatement();
//4.쿼리문 실행
 ResultSet rs = stmt.executeQuery(sql);
//5.결과받아서 처리
%>
<h2>부서별 사원리스트를 출력합니다.</h2>
<h3>부서코드를 선택하세요</h3>
<form action="empList.jsp" method="get">
  <select name="deptno">
  <option value="0" selected>선택</option>
<%  while(rs.next()){ %>
    <option value=<%=rs.getInt(1)%>><%=rs.getString(2)%></option>
	 <!-- <select name="deptno">
	 <option value="10">홍보</option>
	 <option value="20">회계</option>
	 <option value="30">영업</option> 
	 </select> -->
<%	 
 }
%>
 </select><br>
 <input type="submit" value="전송">
</form> 
</body>
</html>