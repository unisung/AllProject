<%@page import="java.util.Date"%><%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	HashMap<String,Object> mapData = new HashMap<>();
 	mapData.put("name","홍길동");
 	mapData.put("today",new Date());
 %>
 <!--  custom태그의 배열 선언 -->
 <c:set var ="intArray" value="<%=new int[]{1,2,3,4,5}%>"/>
 <!--  map 선언 -->
 <c:set var="map" value="<%=mapData %>"/>
 <h4>1부터 100까지의 홀수의 합</h4>
 
 <c:set var="sum" value="0"/><!-- sum 선언 초기값 0 -->
 <c:forEach var="i" begin="1" end="100" step="2">
     <c:set var="sum" value="${sum+i}" /><!-- 반복문 sum선언 sum+i를 대입  -->
 </c:forEach>
 결과:${sum}
 <br>
 <h4>구구단</h4>
 <ul>
   <c:forEach var="i" begin="1" end="9" step="1">
        <li>4*${i}=${4*i}</li>
   </c:forEach>
 </ul>
 
 <br>
 <h4>int형 배열</h4>
 <c:forEach var="i" items="${intArray}" begin="2" end="4" varStatus="status">
     ${status.index} - ${status.count}-[${i}]<br>
 </c:forEach>
 <br>
 
 <h4>Map</h4>
 <!--  map출력 key속성값, value속성값 -->
 <c:forEach var="i" items="${map}">
 	${i.key} =${i.value}<br>
 </c:forEach>
 
 
</body>
</html>