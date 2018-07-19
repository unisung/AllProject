<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
<%
	Cookie cookie1 = new Cookie("path1","경로:/Jsp09/path1");
    cookie1.setPath("Jsp09/path1");/* url내의 특정 uri */
    response.addCookie(cookie1);
    
    Cookie cookie2 = new Cookie("path2","경로:");
    response.addCookie(cookie2);
    
    Cookie cookie3 = new Cookie("path3","경로:/");
    cookie3.setPath("/");/* url내의 특정 uri */
    response.addCookie(cookie3);
    
    Cookie cookie4 = new Cookie("path4","경로:/Jsp09/path2");
    cookie4.setPath("/Jsp09/path2");/* url내의 특정 uri */
    response.addCookie(cookie4);

%>
<h3>쿠키 경로 설정</h3>
<%=cookie1.getName() %>=<%=cookie1.getValue() %>
[<%=cookie1.getPath() %>]
<br>
<%=cookie2.getName() %>=<%=cookie2.getValue() %>
[<%=cookie2.getPath() %>]
<br>
<%=cookie3.getName() %>=<%=cookie3.getValue() %>
[<%=cookie3.getPath() %>]
<br>
<%=cookie4.getName() %>=<%=cookie4.getValue() %>
[<%=cookie4.getPath() %>]
<br>
<a href="viewCookies.jsp">쿠키목록</a>
</body>
</html>