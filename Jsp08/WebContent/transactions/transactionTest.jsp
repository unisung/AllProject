<%@page import="java.sql.*"%><%@page import="javax.sql.*"%><%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=null;
String sql1 = "select * from student where num=?";
String sql2 = "insert into student(num,name) values(3,'홍길동')";
String deptNo = request.getParameter("deptNo");
try{
//context.xml에서 db정보 얻기
Context init = new InitialContext();
DataSource  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
conn = ds.getConnection();
//자동 커밋 기능 disable시킴.
conn.setAutoCommit(false);
//connect얻어서 db쿼리 작업
PreparedStatement pstmt = conn.prepareStatement(sql2);
pstmt.executeUpdate();
pstmt.close();

pstmt = conn.prepareStatement(sql1);
pstmt.setInt(1,3);
ResultSet rs = pstmt.executeQuery();
if(!rs.next()){
	conn.rollback();
	out.print("<h3>데이터 입력에 문제가 발생하였습니다.롤백하겠습니다.</h3>");
}else{
	conn.commit();
	out.print("<h3>데이터 입력이 모두 완료되었습니다.</h3>");
	pstmt.close();
	conn.setAutoCommit(true);//자동 커밋 기능 활성화
}
}catch(Exception e){
	conn.rollback();
	out.print("<h3>데이타 입력 실패</h3>");
	e.printStackTrace();
}finally{
	conn.close();
}
%>
</body>
</html>