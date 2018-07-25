<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html><head><title>로그인 처리</title>
</head>
<body>
<%
     String path = request.getContextPath();
System.out.println("path="+path);
     request.setCharacterEncoding("utf-8");
	 String id = request.getParameter("id");
     String password = request.getParameter("password");
     
     MemberDao1 dao = MemberDao1.getInstance();
      int result = dao.userCheck(id, password);
     if(result ==1){//정상이면
    	 		/* 세션에 id와 password값 설정 후 main페이지로 이동 */
    		 session.setAttribute("id", id);
             session.setAttribute("password", password);
             response.sendRedirect(path+"/shop/shopMain.jsp");
     }else if(result==0){
    	 out.print("<script>");
    	 out.print("alert('패스워드가 다릅니다.');");
    	 out.print("history.back();");
    	 out.print("</script>");
     }else if(result==2){
    	 out.print("<script>");
    	 out.print("alert('없는 id입니다.');");
    	 out.print("history.back();");
    	 out.print("</script>");
     }
%>
</body>
</html>