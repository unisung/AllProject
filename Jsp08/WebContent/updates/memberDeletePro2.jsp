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
	
	String memberId = request.getParameter("id")==null ? "" : request.getParameter("id");
	String pwd = request.getParameter("pwd")==null ?"" : request.getParameter("pwd");
	String sql="delete from member where id='"+memberId+"'";
	String sqlPwd = "select password from member where id='"+memberId+"'";
	
	//1.db접속-1.드라이버 로딩
    Class.forName(driver);
   //2.연결맺기
    Connection conn = DriverManager.getConnection(url, user, password);
   //3.쿼리객체생성
    Statement stmt =conn.createStatement();
   //4.쿼리문 실행
   //4-1.id와 password확인 
   out.print(sqlPwd);
    ResultSet rs = stmt.executeQuery(sqlPwd);
   if(rs.next()){//id가 존해하면...
	   String dbPwd = rs.getString(1);
	   if(dbPwd.equals(pwd)){//id도 같고, password도 같으면...
		   request.setAttribute("id", memberId);
	       RequestDispatcher dispatcher
	        = request.getRequestDispatcher("memberDeleterConfirm.jsp");
	       dispatcher.forward(request, response);
		   /* int result = stmt.executeUpdate(sql);
	       if(result>0){
	    	   out.print("<script>");
	    	   out.print("alert('회원탈퇴 처리를 완료했습니다.');");
	    	   out.print("</script>"); 
	       }else{
	    	   out.print("<script>");
	    	   out.print("alert('회원탈퇴 처리 실패하였습니다.');");
	    	   out.print("</script>");
	       }*/
	   }else{//패스워드가 다르면
		   out.print("<script>");
		   out.print("alert('입력한 패스워드 다릅니다.');");
		   out.print("history.back();");
		   out.print("</script>");
		   
	   }
   }else{//id가 없으면
	   out.print("<script>");
   	   out.print("alert('id를 확인하세요');");
   	   out.print("history.back();");
       out.print("</script>");
   } 
%>
</body>
</html>