<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="num1" value="7"/>
<c:set var="num2" value="9"/>
<%-- <c:set var="result" value="${num1*num2}"/> --%>

${num1}과 ${num2 }의 곱의 결과${result}${num1*num2}
</body>
</html>