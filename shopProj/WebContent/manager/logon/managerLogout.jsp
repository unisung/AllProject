<%@ page contentType="text/html; charset=UTF-8" %>
<%
    /* 생성된 세션 정보 삭제 처리 */
	session.invalidate();
    
   out.print("<script>");
   out.print("alert('로그아웃되었습니다.');");
   out.print("location.href='../managerMain.jsp';");
   out.print("</script>");
%>
