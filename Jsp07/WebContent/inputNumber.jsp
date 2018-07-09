<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	int num1=7,num2=9;
    %>
    포워딩하는 페이지 maxnum.jsp입니다<br>
   <jsp:forward page="maxnum.jsp">
     <jsp:param value="<%=num1%>" name="num1"/>
     <jsp:param value="<%=num2%>" name="num2"/>
    </jsp:forward>
</body>
</html>