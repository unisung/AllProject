<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <c:forEach  var="cnt" begin="1" end="10" step="1">
           ${cnt}<br>
     </c:forEach>
     <br><br>
     <!-- 변수 선언 cnt -->
     <c:forEach  var="cnt" begin="1" end="10" step="2">
           ${cnt}<br>
     </c:forEach>
      <br><br>
      <!-- varStatus 반복자역할 index순번 -->
      <c:forEach varStatus="i" begin="1" end="10" step="1">
           ${i.index}<br>
           ${i.current} 현재 for문의 해당하는 번호
		   ${i.index} 0부터의 순서
			${i.count} 1부터의 순서
			${i.first} 첫 번째인지 여부
			${i.last} 마지막인지 여부
			${i.begin} for문의 시작 번호
			${i.end} for문의 끝 번호
			${i.step}
      </c:forEach>
      <br>
      
      <c:forEach var="cnt" begin="1" end="10">
          <font size="${cnt}">야호</font><br>
      </c:forEach>
      
       
</body>
</html>