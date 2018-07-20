<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   
   out.print("id="+id+"<br>");
   out.print("password="+password);
   
   if(id==null || "".equals(id))
	   id="";
   if(password==null||"".equals(password))
	  password="";
   
   MemberDao dao = new MemberDao();
   //result가 -1이면 id가 없음, 1이면 로그인 성공, 0이면 패스워드가 다름.
   int result = dao.userCheck(id,password);
   if(result==1){
	   session.setAttribute("id", id);
	   session.setAttribute("password", password);
	   response.sendRedirect("main.jsp");
   }else if(result==0){
	out.print("<script>");
	out.print("alert('패스워드가 다릅니다.');");
	out.print("history.back();");
	out.print("</script>");
   }else if(result==-1){
	out.print("<script>");
	out.print("alert('id가 존재하지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
   }
%>
</body>
</html>