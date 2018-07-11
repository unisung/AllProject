<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>제곱표</h1>
     <util:compute var="num" start="1" end="5">
       ${num}의 세제곱은?${num*num*num}
      <br>     
     </util:compute>
</body>
</html>