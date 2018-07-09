<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 <c:set var=변수명 value="값" scope=범위 /> -->
  <c:set var="code" value="80012" scope="request"/>
  <c:set var="name" value="온습도계" scope="request"/>
  <c:set var="price" value="15000" scope="request"/>
  <jsp:forward page="ProductINfoView.jsp"/>
</body>
</html>