<%@page import="dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
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
<!-- useBean  Member member = new model.Member(); -->
<jsp:useBean id="member" class="model.Member">
  <jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
    out.print(member.getId()+"<br>");
    out.print(member.getName()+"<br>");
    out.print(member.getPassword()+"<br>");
    
    
   /* 파라미터로 안넘어온 Date타입의 변수에 값 설정 */
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	  out.print(member.getReg_date()+"<br>"); 
   /* DB처리 객체를 만들어 처리 */
     MemberDao logon = new MemberDao();
    int result = logon.insertMember(member);
    if(result>0){
%>
<jsp:getProperty property="id" name="member"/>님 회원가입을 축하합니다.
<br>
<p>
<a href="cookieMain.jsp">메인으로 이동</a>
</p>
<%}else{%>
<script>
 alert('회원가입실패');
 history.back();
 </script>
<% } %>
</body>
</html>