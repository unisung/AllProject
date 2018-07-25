<%@ page contentType="text/html; charset=UTF-8" %>
<%
	 String id = (String)session.getAttribute("id");
     String password = (String)session.getAttribute("password");
	//session에서 id를 얻어서 값비교 후 id가 null이면 다시 로그인 폼으로 이동.
/* 	 if("".equals(id)||id==null)
		response.sendRedirect("loginform.html");  */
	
 		if(id==null||id.equals(""))//비교연산자 || 사용 
			response.sendRedirect("loginform.html"); 
%>
<h2>${id}님 환영합니다.</h2>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><p>
<input type="button" value="정보 수정" onclick="location.href='updateForm.jsp'"><p>
<input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'"><p>
<input type="button" value="회원리스트" onclick="location.href='memberList.jsp'"><p>