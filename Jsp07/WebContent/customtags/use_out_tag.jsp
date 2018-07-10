<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	FileReader reader = null;/* 문자단위 데이타 입력스트림 */
	try{
		String path = request.getParameter("path");
		reader = new FileReader(getServletContext().getRealPath(path));
%>
<pre>
   소스코드 =<%=path%>
   <c:out value="<%=reader%>" escapeXml="true"/>
</pre>
<%
	}catch(Exception e){
%>
 에러:<%=e.getMessage()%>
 <%		
	}finally{
	 try{	
		reader.close();
	}catch(Exception e){
	    e.getMessage();	
	 }
	}
%>
</head>
<body>
   
</body>
</html>