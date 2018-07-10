<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- choose when~otherwise  -->
   <c:choose>
     <c:when test="${param.name=='bk'}"><!--문장내("'인용문'"),'"인용문"'  -->
        <b>당신의 이름은 ${param.name }입니다.</b>
     </c:when>
     <c:when test="${param.age>20}">
        <b>당신은 성인입니다.</b><br>
     </c:when>
     <c:when test="${not empty param.id}">
         <b> 안녕하세요 ${param.id }님</b><br>
     </c:when>
     <c:otherwise>
       당신은 'bk'가 아니고 20세 이상도 아닙니다.
     </c:otherwise>
   </c:choose>
</body>
</html>