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
       //입력파라미터 정보 얻기
       String no 
            = request.getParameter("no")==null?"0":request.getParameter("no");
       String dname 
            = request.getParameter("dname")==null?"":request.getParameter("dname");
       String loc 
            = request.getParameter("loc")==null?"":request.getParameter("loc");
       
      //초기 파라미터 읽어오기
       String driver = application.getInitParameter("Driver");
       String url = application.getInitParameter("url");
       String user =application.getInitParameter("user");
       String password = application.getInitParameter("password");
       
       
       String sql="insert into dept(no,dname,loc) "
    		     +" values("+no+",'"+dname+"','"+loc+"')";
       out.print(sql);
       
       //1.db접속-1.드라이버 로딩
        Class.forName(driver);
       //2.연결맺기
        Connection conn = DriverManager.getConnection(url, user, password);
       //3.쿼리객체생성
        Statement stmt =conn.createStatement();
       //4.쿼리문 실행
       try{
        int result = stmt.executeUpdate(sql);
         if(result>0){
        	 out.print("<script>");
        	 out.print("alert('입력성공');");
        	 out.print("</script>");
         }else{
        	 out.print("<script>");
        	 out.print("alert('입력실패');");
        	 out.print("</script>");
         }
       }catch(Exception e){
    	   out.print(e.getMessage());
       }finally{
    	   try{
    		   stmt.close();
    		   conn.close();
    	   }catch(Exception e){}
       }
    %>
</body>
</html>