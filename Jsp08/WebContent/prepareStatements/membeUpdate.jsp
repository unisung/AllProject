<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%
         String id=request.getParameter("members");
         String name=request.getParameter("name");
         String pno = request.getParameter("pno");
         String address = request.getParameter("address");
         String pwd = request.getParameter("pwd1");
         
         //초기 파라미터 읽어오기
         String driver = application.getInitParameter("Driver");
         String url = application.getInitParameter("url");
         String user =application.getInitParameter("user");
         String password = application.getInitParameter("password");
         
         PreparedStatement pstmt =null;
         int result=0;
         String sql="update member set name=?,password=?,pno=?,address=? where id=?";
         String dbInfo="select * from member where id=?";
        
         try{
         //1.db접속-1.드라이버 로딩
         Class.forName(driver);
        //2.연결맺기
         Connection conn = DriverManager.getConnection(url, user, password);
        //3.쿼리객체생성
         //name이 없을 때가 문제.. 
         
         pstmt = conn.prepareStatement(dbInfo);
         pstmt.setString(1,id);
         ResultSet rs = pstmt.executeQuery();
         rs.next();
         String dBName = rs.getString("name");
         String dBPass=rs.getString("password");
         String dBPno = rs.getString("pno");
         String dBAddress = rs.getString("address");
         //4.쿼리실행
         pstmt.close();
         
         System.out.println("name="+name.length());
         System.out.println("pwd="+pwd.length());
         System.out.println("pno="+pno.length());
         System.out.println("address="+address.length());
         
         System.out.println("name="+name.equals(""));
         System.out.println("pwd="+pwd.equals(""));
         System.out.println("pno="+pno.equals(""));
         System.out.println("address="+address.equals(""));
         
         //넘어온 파라미터가 null은 아니지만
         //빈 문자열("")로 넘어온 경우
         //문자열의 길이가 0이 되므로 length()를 사용하여 체크
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, name.length()==0?dBName:name);
         pstmt.setString(2, pwd.length()==0?dBPass:pwd);
         pstmt.setString(3, pno.length()==0?dBPno:pno);
         pstmt.setString(4,address.length()==0?dBAddress:address);
         pstmt.setString(5,id);
         
         result = pstmt.executeUpdate();
         if(result>0){
        	 out.print("<script>");
        	 out.print("alert('수정성공');");
        	 out.print("</script>");
         }
         }catch(Exception e){
        	 System.out.println(e.getMessage());
        	 out.print("<script>");
        	 out.print("alert('수정실패');");
        	 out.print("history.go(-1);");
        	 out.print("</script>");
         }finally{
        	 try{
        		 pstmt.close();
        		// conn.close();
        	 }catch(Exception e){
        		 
        	 } 
         } 
     %>
</body>
</html>