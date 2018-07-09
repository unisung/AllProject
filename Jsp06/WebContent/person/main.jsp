<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:useBean id="loginInfo" 
    class="ch01.PersonalInfo" scope="session"></jsp:useBean>
    ${sessionScope.loginInfo.id==null?"guest":sessionScope.loginInfo.id}님 환영합니다.<br>
    <b><a href="login.html">
   ${sessionScope.loginInfo.id==null?"로그인":"로그아웃"}</a></b>
</body>
</html>