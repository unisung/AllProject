<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String id="";
 	Cookie[] cookies = request.getCookies();//쿠키가져오기
 	if(cookies!=null){
 		for(int i=0;i<cookies.length;i++){
 			if(cookies[i].getName().equals("id")){//쿠키들 중에 name이 "id"이 것의 값을 얻기.
 				id=cookies[i].getValue();
 			}
 		}
 		if("".equals(id)) response.sendRedirect("loginForm.jsp");
 	}else{
 		response.sendRedirect("loginForm.jsp");
 	}
 %>
 <h2>쿠키를 사용한 간단한 회원인증</h2>
 <b><%=id %></b>님이 로그인 하였습니다.<br>
 <form action="cookieLogout.jsp" method="post">
   <input type="submit" value="로그아웃">
 </form>
</body>
</html>