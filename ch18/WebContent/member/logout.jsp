<%@ page contentType="text/html; charset=UTF-8"  %>
<%
		String path = request.getContextPath();
		//세션 정보 삭제
		session.invalidate();
		
		out.print("<script>");
		out.print("alert('로그아웃 되었습니다.');");
		out.print("location.href='"+path+"/shop/shopMain.jsp';");
		out.print("</script>");
%>
<h2>로그아웃</h2>
