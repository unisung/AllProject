<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

String sql ="select password from member where id='";
/* out.print(sql); */

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	 String id = request.getParameter("id");
	 String pwd =request.getParameter("password");
	 if(id==null || id.equals("")){
		 out.print("<script>");
		 out.print("alert('id를 입력하세요');");
		 out.print("history.back();");
		 out.print("</script>");
	 }
	 if(pwd==null || pwd.equals("")){
		 out.print("<script>");
		 out.print("alert('패스워드를 입력하세요');");
		 out.print("history.back();");
		 out.print("</script>");
	 }
	 
	 sql+=id+"'";
	 out.print(sql+"<br>");
	 
	//DB조회
	conn = DriverManager.getConnection(url,user,password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(rs.next()){//결과값이 있으면-password를 읽어왔으면(id가 존재하면)
		if(pwd.equals(rs.getString(1))){//id와패스워드가 맞는지
			out.print("로그인 되었습니다.");
		}else{//id는 맞지만 패스워드가 다른경우
			out.print("<script>");
			out.print("alert('패스워드가 일치하지않습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
	}else{//id가 없는 경우
		out.print("<script>");
		out.print("alert('id가 존재하지 않습니다.');");
		out.print("history.go(-1);");
		out.print("</script>");
	}
}catch(Exception e){
	out.print(e.getMessage());
}
%>
</body>
</html>