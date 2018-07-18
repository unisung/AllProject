<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션 사용 예제</title>
</head>
<body>
    <%
    	String id  ="hongkd";
        String password = "1234";
        
        session.setAttribute("id", id);
        session.setAttribute("password",password);
    %>
    세션에 id와 password 속성을 설정하였씁니다<br>
    <!-- window.location =페이지명 -->
   <input type="button" value="세션의 설정된 속성확인" 
                      onclick="javascript:window.location='viewSession.jsp'">
</body>
</html>