<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="scriptless" %><!-- 태그사이에 body가 삽입가능 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="start" type="java.lang.Integer" %>
<%@attribute name="end" type="java.lang.Integer" %>
<%@attribute name="var" required="true"  rtexprvalue="false"%>
<%@variable name-from-attribute="var"  alias="number"
		  variable-class="java.lang.Integer" scope="NESTED" %>
<%
	for(int i=start;i<=end;i++){%>
		<c:set var="number" value="<%=i%>" />
		<jsp:doBody/>
	<% }%>	  
