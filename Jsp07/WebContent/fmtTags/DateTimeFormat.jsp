<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<c:set var="date" value="<%=new Date() %>"/>
   <!-- type:date(날짜),time(시간),datetime(날짜시간:both) -->
  [S]<fmt:formatDate value="${date}" type="both" 
                     dateStyle="short" timeStyle="short"/><br>
  [M]<fmt:formatDate value="${date}" type="both"
  				     dateStyle="medium" timeStyle="medium"/><br>
  [L]<fmt:formatDate value="${date}" type="both"
                     dateStyle="long" timeStyle="long"/><br>
  [F]<fmt:formatDate value="${date}" type="both"
                     dateStyle="full" timeStyle="full"/><br>                     				     
                     
</body>
</html>