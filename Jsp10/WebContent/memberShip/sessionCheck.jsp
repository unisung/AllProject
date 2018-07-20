<%
	String id=(String)session.getAttribute("id");
    if(id==null|| "".equals(id))
    	response.sendRedirect("loginForm.jsp");
%>