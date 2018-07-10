<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="date" value="<%=new Date()%>"/>
<h2>세계시 프로그램</h2>
서울:<fmt:formatDate value="${date}" type="both"/><br><br>

<fmt:timeZone value="Asia/Hong_Kong">
홍콩:<fmt:formatDate value="${date}" type="both"/><br><br>
</fmt:timeZone>

<fmt:timeZone value="Europe/London">
런던:<fmt:formatDate value="${date}" type="both"/><br><br>
</fmt:timeZone>

<fmt:timeZone value="America/New_York">
뉴욕:<fmt:formatDate value="${date}" type="both"/><br><br>
</fmt:timeZone>

</body>
</html>