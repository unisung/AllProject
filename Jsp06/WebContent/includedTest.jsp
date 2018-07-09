<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포함되는 페이지</title>
</head>
<body>
     <%
     	String name = request.getParameter("name");
     %>
     포함되는 페이지 includedTest.jsp 입니다<p>
     <b><%=name %></b>님 반갑습니다.
     <hr>
</body>
</html>