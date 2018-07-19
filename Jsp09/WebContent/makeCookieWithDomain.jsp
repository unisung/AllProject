<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
<%
    /* setDomain(특정 domain주소); 
       - 잘못된 domain 처리 안됨.
     */
	Cookie cookie1 = new Cookie("id","madvirus");
	//http://www.k.somehost.com, http://m.somehost.com,
    cookie1.setDomain("www.naver.com");
    response.addCookie(cookie1);
  
    Cookie cookie2 = new Cookie("only","onlycookie");
    response.addCookie(cookie2);
    
    Cookie cookie3 = new Cookie("invalid","invalidcookie");
    cookie3.setDomain("javacan.tistory.com");//특정도메인으로만 쿠키 전달
    response.addCookie(cookie3);

%>
다음과 같이 쿠키를 생성하였습니다.
<%=cookie1.getName()%>=<%=cookie1.getValue()%>
[<%=cookie1.getDomain()%>]
<br>
<%=cookie2.getName()%>=<%=cookie2.getValue()%>
[<%=cookie2.getDomain()%>]
<br>
<%=cookie3.getName()%>=<%=cookie3.getValue()%>
[<%=cookie3.getDomain()%>]
 <br> 
</body>
</html>