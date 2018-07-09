<%@page import="ch01.PersonalInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   		PersonalInfo  pinfo 
   		       = (PersonalInfo)request.getAttribute("pinfo");
   %>
      이름:${pinfo.name}<br>
    성별:${pinfo.gender=="m"?"남자":"여자"}<br>
    나이:${pinfo.age }<br>
</body>
</html>