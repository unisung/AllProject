<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- url 포함시키기, <c:url value="경로" var="경로값"
         <c:param name="쿼리1" value="값1">
         <c:param name="쿼리2" value="값2">
    -->
 <c:url value="http://search.daum.net/search" var="searchUrl">
    <c:param name="w" value="blog"></c:param>
    <c:param name="q" value="공원"></c:param>
 </c:url>
 
 <ul>
    <li>통합검색<a href=${searchUrl}>찾기</a></li>
    <li><c:url value="/use_if_tag.jsp"/></li>
    <li><c:url value="./use_if_tag.jsp"/></li>
 </ul>
</body>
</html>