<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String result = request.getParameter("result");
  if(result.equals("success")) out.print("회원가입 축하합니다<br>");
  else{
	  out.print("<script>");
	  out.print("alert('가입시 문제가 발생하였습니다.');");
	  out.print("window.location.href='PersonalInfo.jsp';");
	  out.print("</script>");
     }
 %>
</body>
</html>