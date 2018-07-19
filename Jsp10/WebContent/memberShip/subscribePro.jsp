<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:useBean id="member" class="model.Member">
  <jsp:setProperty  name="member" property="*"/>
</jsp:useBean> --%>
<%
    request.setCharacterEncoding("utf-8");
   /* form의 type='date' 이고 bean의 속성타입이 util.Date 타입인 경우 */
    String date = request.getParameter("birth");
    Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
    
    Member member = new Member();
    member.setBirth(date1);
    
    
    member.setId(request.getParameter("id"));
    member.setName(request.getParameter("name"));
    member.setPassword(request.getParameter("password"));
   
    member.setTel1(request.getParameter("tel1"));
    member.setTel2(request.getParameter("tel2"));
    member.setTel3(request.getParameter("tel3"));
    member.setZipcode(request.getParameter("zipcode"));
    member.setAddress1(request.getParameter("address1"));
    member.setAddress2(request.getParameter("address2"));
   
    String email = request.getParameter("emailId")
    		     +"@"
    		     +request.getParameter("emailID");
    member.setEmail(email);
    
    /* out.println(member.getId()+"<br>");
	out.println(member.getName()+"<br>");
	out.println(member.getPassword()+"<br>");
	out.println(member.getBirth()+"<br>");
	out.println(member.getEmail()+"<br>");
	out.println(member.getTel1()+"<br>");
	out.println(member.getTel2()+"<br>");
	out.println(member.getTel3()+"<br>");
	out.println(member.getZipcode()+"<br>");
	out.println(member.getAddress1()+"<br>");
	out.println(member.getAddress2()+"<br>");
	 */
	MemberDao dao = new MemberDao();
	 int result=dao.insertMember(member);
	 
	 if(result>0){
		 out.print("<script>");
		 out.print("alert('회원가입을 축하드립니다.');");
		 out.print("location.href='subscribeForm.jsp';");
		 out.print("</script>");
	 }else{
		 out.print("<script>");
		 out.print("alert('회원가입 실패');");
		 out.print("history.back();");
		 out.print("</script>");
	 }
%>
</body>
</html>