<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
<c:set var="date" value="<%=new Date()%>">
</c:set>
[오늘의 날짜]<fmt:formatDate value="${date}" type="date" pattern="yyyy/MM/dd(E)"/><br>
[현재의 시간]<fmt:formatDate value="${date}" type="time" pattern="hh:mm:ss"/><br>
</body>
</html>