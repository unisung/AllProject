<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	MemberDao dao = new MemberDao();
    int result = dao.deleteMember(id);
    if(result>0){
    	session.invalidate();
    	out.print("<script>");
    	out.print("alert('회원탈퇴 완료!');");
    	out.print("location.href='main.jsp';");
    	out.print("</script>");
    }else{
    	out.print("<script>");
    	out.print("alert('회원탈퇴 처리중 문제가 발생하였습니다.');");
    	out.print("location.href='main.jsp';");
    	out.print("</script>");
    }
%>
</body>
</html>