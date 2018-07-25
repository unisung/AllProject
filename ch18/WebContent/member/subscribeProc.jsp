<%@page import="dao.MemberDao1"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member"/>
<jsp:setProperty property="*" name="member"/>
<%

	System.out.println(member.getId());
	System.out.println(member.getPassword());
	System.out.println(member.getName());
	System.out.println(member.getBirth());
	System.out.println(member.getZipno());
	System.out.println(member.getAddress1());
	System.out.println(member.getAddress2());

	
	
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String emailId = request.getParameter("emailId");
	String emailD = request.getParameter("emailD");
	String email = emailId+"@"+emailD;
	member.setTel1(tel1);
	member.setTel2(tel2);
	member.setTel3(tel3);
	
	member.setEmail(email);
	
%>
<%
    /* 회원가입 처리 */
     MemberDao1 dao = MemberDao1.getInstance();
      int result= dao.insertMember(member);
      if(result>0){
    	  session.setAttribute("member", member);
		response.sendRedirect("subscribeResult.jsp");
      }else{
		out.print("<script>");
		out.print("alert('입력실패!');");
		out.print("history.back();");
		out.print("</script>");
      } 	  
%>