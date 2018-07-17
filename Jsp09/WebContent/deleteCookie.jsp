<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie(URLEncoder.encode("이름","utf-8"),"임꺽정");
	cookie.setMaxAge(60*60);//유효기간 설정
	//cookie.setMaxAge(0);//쿠키삭제
	//cookie.setMaxAge(-1);//브라우저 종류시 쿠키도 삭제
	response.addCookie(cookie);
%>
쿠키가 삭제되었습니다.
<a href="cookView.jsp">쿠키보기</a>
</body>
</html>