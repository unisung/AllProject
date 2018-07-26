<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String email = request.getParameter("email");
%>
<%
   MemberDao dao = MemberDao.getInstance();
   //DB처리 작업
   int result = dao.emailCheck(email);
   //결과 >0 이면 사용할수 없음
   if(result>0){
	   out.print("<script>");
	   out.print("alert('사용할수 없는 email 입니다.');");
	   out.print("window.opener.frm.emailId.value='';");
	   out.print("window.opener.frm.emailId.focus();");
	   out.print("window.opener.frm.emailD.value='';");
	   out.print("window.self.close();");/* 자신을 닫기 */
	   out.print("</script>");
   }else if(result==0){//결과가 0 이면 사용가능
	   out.print("<script>");
	   out.print("alert('사용 할수 있는 email 입니다.');");
	   out.print("window.self.close();");
	   out.print("</script>");
   }
   

%>
</body>
</html>