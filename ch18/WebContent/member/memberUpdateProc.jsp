<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html><head><title>회원정보 수정</title></head>
<body>
<%
	 request.setCharacterEncoding("utf-8");
     String emailId = request.getParameter("emailId");
     String emailD = request.getParameter("emailD");
%>
<jsp:useBean id="member" class="model.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
        member.setEmail(emailId+"@"+emailD);
	 	MemberDao1 dao = MemberDao1.getInstance();
	 	//회원 본인여부 확인
	 	if(dao.userCheck(member.getId(), member.getPassword())!=1){
	 		out.print("<script>");
	 		out.print("alert('패스워드가 맞지않습니다.');");
	 		out.print("history.back();");
	 		out.print("</script>");
	 	}
	 	
       int result = dao.updateMember(member);
       if(result>0){
    	   out.print("<script>");
    	   out.print("alert('수정완료');");
    	   out.print("window.location.href='memberList.jsp';");
    	   out.print("</script>");
       }else{
    	   out.print("<script>");
    	   out.print("alert('수정실패');");
    	   out.print("history.back();");
    	   out.print("</script>");
       }
%>
</body>
</html>