<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <h3>값 보기</h3>
    page객체 값:${pageScope.num1}<br>
    request객체 값:${requestScope.num1}<br>
    session객체 값:${sessionScope.num1}<br>
    application객체 값:${applicationScope.num1}<br>
    <br>
    <c:remove var="num1" scope="request"/>
    request객체 값:${requestScope.num1}<br><!-- 삭제됨 -->
    session객체 값:${sessionScope.num1}<br>
    application객체 값:${applicationScope.num1}<br>
    
    <c:remove var="num1" scope="session"/>
    request객체 값:${requestScope.num1}<br><!-- 삭제됨 -->
    session객체 값:${sessionScope.num1}<br><!-- 삭제됨 -->
    application객체 값:${applicationScope.num1}<br>
    
    <c:remove var="num1" scope="application"/>
    request객체 값:${requestScope.num1}<br><!-- 삭제됨 -->
    session객체 값:${sessionScope.num1}<br><!-- 삭제됨 -->
    application객체 값:${applicationScope.num1}<br><!-- 삭제됨 -->
    
    
</body>
</html>