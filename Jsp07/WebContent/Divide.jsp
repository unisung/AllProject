<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str1 = request.getParameter("num1");
    String str2 = request.getParameter("num2");
    int num1=0; int num2=0;
    if(str1!=null && !str1.equals("")){
    	num1 = Integer.parseInt(str1);	
    }
    if(str2!=null && !str2.equals("")){
        num2 = Integer.parseInt(str2);
    }
%>
	  <h2>나눗셈 프로그램</h2>
	  <!-- custom태그를 이용한 catch문
	       로직은 catch절에서 처리
	       예외는 catch다음절에서 처리
	   -->
	  <c:catch var="e">
	     <%=num1%>/<%=num2%>의 결과 <%=num1/num2 %>
	  </c:catch>
	  <%-- <c:if test="${not empty e}">
	  	  에러메세지:${e.message}<br>
	  </c:if> --%>
	  <c:if test="${e!=null}">
	  	  에러메세지:${e.message}<br>
	  </c:if>

</body>
</html>