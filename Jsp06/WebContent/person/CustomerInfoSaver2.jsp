<%@page import="ch01.PersonalInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
      String name =request.getParameter("name");
      String gender = request.getParameter("gender");
      String age = request.getParameter("age");
      int intAge = Integer.parseInt(age);
      
      /* PersonalInfo pinfo = new PersonalInfo();
      pinfo.setName(name);
      pinfo.setGender(gender);
      pinfo.setAge(Integer.parseInt(age));
      
      request.setAttribute("pinfo", pinfo);
      RequestDispatcher dispatcher
       = request.getRequestDispatcher("CustomerInfoView.jsp");
      dispatcher.forward(request, response); */
   %>
<jsp:useBean id="pinfo" class="ch01.PersonalInfo" 
             scope="request" /><!-- pinfo = new PersonalInfo(); -->
<%-- <jsp:setProperty property="name" name="pinfo" param="name"/><!-- setName()호출 -->
<!-- setName(request.getPrameter("name"); -->
<jsp:setProperty property="gender" name="pinfo" param="gender"/><!-- setGender() -->
<jsp:setProperty property="age" name="pinfo" param="age"/><!-- setAge -->             
 --%>

<jsp:setProperty property="name" name="pinfo" value="<%=name%>" /><!-- setName()호출 -->
<!-- setName(request.getPrameter("name"); -->
<jsp:setProperty property="gender" name="pinfo" value="<%=gender%>"/><!-- setGender() -->
<jsp:setProperty property="age" name="pinfo" value="<%=intAge%>"/>
<!-- pinfo.setAge(intAge) -->             

<jsp:forward page="CustomerInfoView2.jsp"></jsp:forward>              
</body>
</html>











