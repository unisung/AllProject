<%@tag import="java.util.Map"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ tag dynamic-attributes="attrs" %>
<Font color=${attrs.color}>
<%
	Map attrs=(Map)jspContext.getAttribute("attrs");
    String str=(String)attrs.get("size");
    int size=Integer.parseInt(str);
    for(int cnt=0;cnt<size;cnt++)
    	out.print("=");
    out.print("<br>");
%>
</Font>