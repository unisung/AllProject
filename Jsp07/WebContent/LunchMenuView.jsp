<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h3>오늘의 메뉴</h3>
     <c:if test="${empty menu}">
      <h3>메뉴가 없습니다.</h3><br>
     </c:if>
     <c:if test="${not empty menu}">
     <ul>
     	<c:forEach var="dish" items="${menu}">
     	<li>${dish}</li>
     	</c:forEach>
     </ul>
     </c:if>
</body>
</html>