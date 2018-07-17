<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
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
    /* Database Connection Pool 방식 
       /WEB-INF/context.xml 파일 생성
       db접속 정보를 context.xml파일에서 읽어옴.
    */
	Connection conn;
   try{
	   //전송된 파라미터 값 받기
	   String sNum1 = request.getParameter("num1");
	   String sNum2 = request.getParameter("num2");
	   sNum1 = sNum1.length()==0?"0":sNum1;
	   sNum2 = sNum2.length()==0?"0":sNum2;
	   int num1 = Integer.parseInt(sNum1);
	   int num2 = Integer.parseInt(sNum2);
	   
	   Context init = new InitialContext();
	   String dbName = "jdbc/OracleDB";//context에서 "java:comp/env/jdbc/OracleDB"을 찾아서
	                                   //정보를 넘겨줌
	   DataSource ds = (DataSource)init.lookup("java:comp/env/"+dbName);
	   conn = ds.getConnection();//pool로 부터 connection객체 빌려옴
	   out.print("DB접속 성공!<br>");
	   /* 프로시져 콜 실행 */
	   String call = "{call plus(?,?,?)}";
	   /* 프시져 실행 객체 생성 */
	   CallableStatement cstmt =conn.prepareCall(call);
	   //binding변수 채우기
	   cstmt.setInt(1, num1);
	   cstmt.setInt(2, num2);
	   
	   //out parameter값: registerOutParameter()
	   cstmt.registerOutParameter(3, Types.NUMERIC);
	   
	   //실행
	   cstmt.execute();
	   //실행후 결과 값 얻기
	   int result = cstmt.getInt(3);
	   out.print("결과값: "+result+"<br>");
	   
	   conn.close();//접속해제가 되면 connection객체는 다시 pool로 되돌아감.
	   out.print("DB접속 종료!");
   }catch(Exception e){
	   out.print("DB접속 실패!");
	   out.print(e.getMessage());
   }
%>
</body>
</html>