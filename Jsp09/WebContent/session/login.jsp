<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	 String id = request.getParameter("id");
     session.setAttribute("id", id);
     session.setMaxInactiveInterval(30);//세션의 유지시간을 설정 단위(초)
     out.print(session.getMaxInactiveInterval()+"<br>");
     out.print(id+"님 환영합니다.<br>");
%>
<a href="login.html">로그인 페이지로</a>

</body>
</html>