<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookies[] = request.getCookies();
   if(cookies!=null){
	   for(int i=0;i<cookies.length;i++){
		   if(URLDecoder.decode(cookies[i].getName(),"utf-8").equals("이름")){
			   out.print("쿠키값:"+URLDecoder.decode(cookies[i].getValue(),"utf-8"));
		   }
		   /* if(cookies[i].getName().equals("name")){
			   out.print("쿠키값:"+URLDecoder.decode(cookies[i].getValue(),"utf-8"));
		   } */
	   }
   }
%>
</body>
</html>