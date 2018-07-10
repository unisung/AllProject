<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="num" value="1234567"/>
  첫번째 수:<fmt:formatNumber value="1234500" groupingUsed="true"/><br>
  두번째 수:<fmt:formatNumber value="3.14158" pattern="#.##"/><br><!-- 값이 있은부분만 유효 -->
  세번째 수:<fmt:formatNumber value="10.5" pattern="#.00"/><br><!-- 소수점2자리까지 유효 -->
  네번째 수:<fmt:formatNumber value="${num}" groupingUsed="true"/>
</body>
</html>