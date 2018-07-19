<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
 <%
 	//파라미터 받기
 	String id = request.getParameter("id");
   //DB 처리 작업
   MemberDao dao = new MemberDao();
   int result =dao.userCheck(id);
   if(result==1){
	   out.print("<script>");
	   out.print("alert('사용할수 없는 id입니다.');");
	   out.print("window.opener.frm.id.value='';");
	   out.print("window.opener.frm.id.focus();");
	   out.print("window.self.close();");//자신을 닫는 함수
	   out.print("</script>");
   }else if(result==0){
	   out.print("<script>");
	   out.print("alert('사용할수 있는 id입니다.');");
	   out.print("window.opener.frm.password.focus();");
	   out.print("window.self.close();");
	   out.print("</script>");
   }
 
 %>
</body>
</html>