<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	CookieBox cb = new CookieBox(request);//내장객체request를 매개변수로 넘김
 	out.print("name의 쿠키값:"+cb.getValue("name")+"<br>");
 	out.print("아이디의 쿠키값:"+cb.getValue("아이디")+"<br>");
 %>
</body>
</html>