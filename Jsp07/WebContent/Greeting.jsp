<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:choose><!-- case문 -->
   <c:when test="${paran.num==1}">
      처음뵙겠습니다<br>
   </c:when>
   <c:when test="${paran.num==2}">
     오랜만입니다.<br>
   </c:when>
   <c:when test="${paran.num==3}">
      방갑습니다.<br>
   </c:when>
   <c:otherwise>
   	 안녕하세요<br>
   </c:otherwise>
  </c:choose>
</body>
</html>