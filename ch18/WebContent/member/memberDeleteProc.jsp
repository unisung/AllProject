<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html><head><title>Insert title here</title>
</head>
<body>
<%
	 String id = request.getParameter("id");
     String password = request.getParameter("password");
     
     MemberDao1 dao = MemberDao1.getInstance();
      int result = dao.userCheck(id, password);
      if(result!=1){
    	  out.print("<script>");
    	  out.print("alert('패스워드가 다릅니다.');");
    	  out.print("history.back();");
    	  out.print("</script>");
      }
      result = dao.deletMember(id);
      if(result>0){
    	  out.print("<script>");
    	  out.print("alert('탈퇴처리되었습니다.');");
    	  out.print("window.location.href='loginform.html';");
    	  out.print("</script>");
      }
%>
</body>
</html>