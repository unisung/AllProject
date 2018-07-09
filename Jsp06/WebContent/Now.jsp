<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%
      	GregorianCalendar now = new GregorianCalendar();
        String date = String.format("%TY년%Tm월%Td일",now,now,now);
        String time = String.format("%Tp%TR",now,now);
        request.setAttribute("date", date);
        request.setAttribute("time",time);
      %>
      [현재시각]${date}${time}
</body>
</html>