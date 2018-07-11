<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>최대값 구하기</h1>
     <h3>최대값 구하기</h3>
     <util:max num1="${param.num1}" num2="${param.num2}"/>
      최대값:${maximum}

</body>
</html>