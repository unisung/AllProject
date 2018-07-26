<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Member  member =(Member)session.getAttribute("member");
    String path = request.getContextPath();
    request.setAttribute("path", path);
%>
회원id:${member.id}<br>
회원이름:${member.name}<br>
회원우편번호:${member.zipno}<br>
회원주소1:${member.address1}<br>
회원주소2:${embmer.address2}<br>
회원생일:${member.birth}<br>
회원전화번호:${member.tel1}-${member.tel2}-${member.tel3}<br>
회원email:${member.email}<br><br>
<a href="${path}/shop/shopMain.jsp">로그인 하기</a>
</body>
</html>