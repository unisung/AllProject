<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="pinfo" class="ch01.ProductInfo" scope="request"></jsp:useBean>
    코드<jsp:getProperty property="code" name="pinfo"/>
   제품명<jsp:getProperty property="name" name="pinfo"/>
   <br>
   가격<jsp:getProperty property="price" name="pinfo"/> 
</body>
</html>