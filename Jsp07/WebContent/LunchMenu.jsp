<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>오늘의 메뉴
불고기백반
오므라이스
콩국수
<body>
  <%
  	String arr[] = {"불고기백반","오므라이스","콩국수"};
    request.setAttribute("menu",arr);
    RequestDispatcher dispatcher
      = request.getRequestDispatcher("LunchMenuView.jsp");
    dispatcher.forward(request, response);
  %>
</body>
</html>