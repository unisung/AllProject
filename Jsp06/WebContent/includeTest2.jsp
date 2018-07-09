<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
     <%
        request.setCharacterEncoding("utf-8");
     	String name = "GilDong";
     	String pageName = "includedTest2.jsp";
     %>
     포함하는 페이지 includeTest2.jsp입니다<br>
     포함되는 페이지에 파라미터값을 전달합니다<br>
   <hr>
   <jsp:include page="<%=pageName%>" flush="false">
	   <jsp:param value="<%=name %>" name="name"/>
	   <jsp:param name="pageName" value="<%=pageName%>"/>
   </jsp:include>
   <hr>
   includeTest2.jsp의 나머지 내용입니다.
    
</body>
</html>