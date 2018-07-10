<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="date" value="<%=new Date()%>"/>
<h3>우리나라의 포맷</h3>
<fmt:setLocale value="ko_kr"/><!--setLocale설정 이후부터 적용  -->
금액:<fmt:formatNumber value="1000000" type="currency"/><br>
일시:<fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/><br>

<!-- 포멧형식이 ko -> us -->
<h3>미국의 포맷</h3>
<fmt:setLocale value="en_us"/><!--setLocale설정 이후부터 적용  -->
금액:<fmt:formatNumber value="1000000" type="currency"/><br>
일시:<fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/><br>

<!-- 포멧형식이 us -> jp -->
<h3>일본의 포맷</h3>
<fmt:setLocale value="ja_jp"/><!--setLocale설정 이후부터 적용  -->
금액:<fmt:formatNumber value="1000000" type="currency"/><br>
일시:<fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/><br>


</body>
</html>