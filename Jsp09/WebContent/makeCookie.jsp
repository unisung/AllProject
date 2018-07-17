<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키 생성 예제</title>
</head>
<body>
<%
	String cookieName = "id";
    String cookieValue ="hong";
    Cookie cookie = new Cookie(cookieName,cookieValue);//생성시 "id":"hong"
    cookie.setMaxAge(60*3);//생성된 쿠키의 유효기간(초단위)
    cookie.setValue("kim");//쿠키의 값 변경 "hong" -> "kim"
    response.addCookie(cookie);//쿠키 보내기
%>
<h2>쿠키 생성</h2>
"<%=cookieName%>" 쿠키가 생성되었습니다.<br>
<input type="button" value="쿠키의 내용확인" 
          onclick="javascript:window.location='useCookie.jsp'">
</body>
</html>