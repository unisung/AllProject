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
	
	String memberId = request.getParameter("id")==null ? "" : request.getParameter("id");
	String pwd = request.getParameter("pwd")==null ?"" : request.getParameter("pwd");
	
	String sql="delete from member where id=?";
	String sqlPwd = "select password from member where id=?";
	
	//1.db접속-1.드라이버 로딩
    Class.forName(driver);
   //2.연결맺기
    Connection conn = DriverManager.getConnection(url, user, password);
   //3.쿼리객체생성
    PreparedStatement pstmt =conn.prepareStatement(sqlPwd);   
   //4.쿼리문 실행
   //4-1.id와 password확인 
   out.print(sqlPwd);
    pstmt.setString(1,memberId);
    ResultSet rs = pstmt.executeQuery();
   if(rs.next()){//id가 존해하면...
	   String dbPwd = rs.getString(1);
	   if(dbPwd.equals(pwd)){//id도 같고, password도 같으면...
		   out.print("<html>");
		   out.print("<script>");
	       out.print("function chk(){");
	       out.print("var result =confirm('삭제하시겠습니까?');");
	       out.print("if(result==true) {");
	       out.print("   return true;");
	       out.print("} return false;");
	       out.print("}"   );
	   	   out.print("</script>");
		   out.print("<form action='memberDeleterConfirm.jsp' method='get' onsubmit='return chk()'>");
	   	   out.print("<input type='hidden' name='id' value='"+memberId+"'>");
	   	   out.print("<input type='submit' value='확인'>");
		   out.print("</form>");
		   out.print("</html>");
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