<%@page import="dao.MemberDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member">
<jsp:setProperty name="member" property="id" param="id"/>
<jsp:setProperty name="member" property="name" param="name"/>
<jsp:setProperty name="member" property="password" param="password"/>
<jsp:setProperty name="member" property="zipno" param="zipno"/>
<jsp:setProperty name="member" property="address1" param="address1"/>
<jsp:setProperty name="member" property="address2" param="address2"/>
<jsp:setProperty name="member" property="tel1" param="tel1"/>
<jsp:setProperty name="member" property="tel2" param="tel2"/>
<jsp:setProperty name="member" property="tel3" param="tel3"/>
<jsp:setProperty name="member" property="email" param="email"/>
</jsp:useBean>
<%
member.setEmail(request.getParameter("emailId")+"@"
        +request.getParameter("emailD"));
Date date = 
new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth"));
member.setBirth(date);
  
  /* System.out.println(member.getId());
  System.out.println(member.getPassword());
  System.out.println(member.getName());
  System.out.println(member.getZipno());
  System.out.println(member.getAddress1());
  System.out.println(member.getAddress2());
  System.out.println(member.getTel1());
  System.out.println(member.getTel2());
  System.out.println(member.getTel3()); 
  System.out.println(member.getBirth());
  System.out.println(member.getEmail()); */
  
  MemberDao dao = MemberDao.getInstance();
  int result = dao.insertMember(member);
  if(result>0){
	 session.setAttribute("member", member);
	 response.sendRedirect("subscribeResult.jsp");
  }else{
	  out.print("<script>");
	  out.print("alert('회원가입 실패');");
	  out.print("history.back();");
	  out.print("</script>");
  }
%>
</body>
</html>