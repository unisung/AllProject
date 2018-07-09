<%@page import="ch01.PersonalInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:useBean id="pinfo" class="ch01.PersonalInfo" 
               scope="session"></jsp:useBean>
  <jsp:setProperty property="*" name="pinfo"/>
  <jsp:getProperty property="name" name="pinfo"/>  
  <jsp:getProperty property="gender" name="pinfo"/>  
  <jsp:getProperty property="age" name="pinfo"/>  
      
 <jsp:forward page="CustomerInfoView2.jsp"></jsp:forward>
</body>
</html>











