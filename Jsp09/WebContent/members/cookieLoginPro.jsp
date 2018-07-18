<%@page import="util.CookieBox"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
%>
 <jsp:useBean id="member" class="model.Member">
  <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
 <% 
     /* out.print(member.getId()+"<br>");
     out.print(member.getPassword()+"<br>"); */
     MemberDao dao = new MemberDao();
    int check = dao.userCheck(member.getId(),member.getPassword());
    out.print(check);
    if(check==1){
    	/* Cookie cookie = new Cookie("id",member.getId());
    	   cookie.setMaxAge(60*20);//60초*20 유효 */
    	response.addCookie(CookieBox.createCookie("id", id, 60*20));
    	response.addCookie(CookieBox.createCookie("password", member.getPassword(), 60*20));
    	response.sendRedirect("cookieMain.jsp");
    }else if(check==0){ %>
    	<script>
    	alert('비밀번호가 다릅니다.');
    	history.back();//history(브라우저 객체 모델BOM)
    	</script>
   <% 	
    }else{%>
     <script>
       alert('id가 존재하지 않습니다.');
       history.back();
     </script>	
    <%}
%>
</body>
</html>