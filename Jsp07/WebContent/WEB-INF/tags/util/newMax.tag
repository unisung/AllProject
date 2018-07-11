<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="var" required="true" rtexprvalue="false" %>
<%@attribute name="num1" type="java.lang.Integer" %>
<%@attribute name="num2" type="java.lang.Integer" %>
<%@variable name-from-attribute="var" alias="maximum" 
		 variable-class="java.lang.Integer" scope="AT_END" %>
<%
	int result;
if(num1>num2)
	result=num1;
else
	result=num2;
%>
<c:set var="maximum" value="<%=result%>"/>		 
