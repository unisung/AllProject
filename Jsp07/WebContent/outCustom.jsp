<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <c:out value="출력내용" > 
	     <c:out value="출력내용" escapeXml="false" 특수문자 제외>
	     <c:out value="출력내용" default="값" 출력내용일 없을 때 값을 출력>
	 -->
   <h3>fONT 태그에 대하여</h3>
   <c:out value="<FONT size=7>커다란 글씨</FONT>는 다음과 같은 출력을 합니다.">
   </c:out>
   <br><br>
   <c:out value="<FONT sixe=7>커다란 글씨</FONT>" escapeXml="false"></c:out>
   <br><br>
   안녕하세요<c:out value="${param.id}" default="guest"/>님

</body>
</html>