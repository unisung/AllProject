<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag body-content="empty" %>
<%@attribute name="color" %>
<%@attribute name="size" type="java.lang.Integer" %>
<font color="${color}">
<%
	for(int cnt=0;cnt<size;cnt++)
		out.print("-");
    out.print("<br>");
%>
