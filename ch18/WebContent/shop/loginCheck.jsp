<%
	if(session.getAttribute("id")==null)
		response.sendRedirect("shopMain.jsp");
	/* else
		out.print(session.getAttribute("id")); */
%>