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
         
         //name이 없을 때가 문제.. 
         String sql="update member set ";
                sql+=(name==null||name.equals(""))?"":"name='"+name;
                sql+=(pno==null|pno.equals(""))?"":"',pno='"+pno;
                sql+=(address==null||address.equals(""))?"":"',address='"+address;
                sql+=(pwd==null||pwd.equals(""))?"":"',password='"+pwd; 
                sql+="' where id='"+id+"'";
                out.print(sql);
         
        /*  //1.db접속-1.드라이버 로딩
          Class.forName(driver);
         //2.연결맺기
          Connection conn = DriverManager.getConnection(url, user, password);
         //3.쿼리객체생성
          Statement stmt =conn.createStatement();
         //4.쿼리실행
         int result = stmt.executeUpdate(sql);
         try{
         if(result>0){
        	 out.print("<script>");
        	 out.print("alert('수정성공');");
        	 out.print("</script>");
         }
         }catch(Exception e){
        	 out.print("<script>");
        	 out.print("alert('수정실패');");
        	 out.print("history.go(-1);");
        	 out.print("</script>");
         }finally{
        	 try{
        		 stmt.close();
        		 conn.close();
        	 }catch(Exception e){
        		 
        	 } 
         } */
     %>
</body>
</html>