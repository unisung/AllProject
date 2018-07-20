<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:useBean id="member" class="model.Member">
<jsp:setProperty name="nember" property="*"/>
</jsp:useBean> --%>
<%
request.setCharacterEncoding("utf-8");
/* form의 type='date' 이고 bean의 속성타입이 util.Date 타입인 경우 */
 String date = request.getParameter("birth");
//"yyyy-MM-dd" +getTime() <- "hh:mm:ss"
 java.sql.Date date1 
  = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
 
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
 
 System.out.print("tel1="+member.getTel1());
 
 //회원정보 수정
 MemberDao dao = new MemberDao();
 int result = dao.updateMember(member);
 if(result>0){
	 out.print("<script>");
	 out.print("alert('수정이 완료 되었습니다.');");
	 out.print("location.href='main.jsp';");
	 out.print("</script>");
 }else{
	 out.print("<script>");
	 out.print("alert('수정 실패! ');");
	 out.print("history.back();");
	 out.print("</script>");
 }
%>

</body>
</html>