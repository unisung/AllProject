<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>최대값 구하기</h2>
  <c:if test="${param.num1 - param.num2 >=0}">
   		${param.num1}
   </c:if>
   <c:if test="${param.num1 -param.num2  <0 }">
        ${param.num2}
   </c:if>
</body>
</html>