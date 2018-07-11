<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="num1" type="java.lang.Integer"%>
<%@attribute name="num2" type="java.lang.Integer"%>
<%@variable name-given="maximum" 
            variable-class="java.lang.Integer" scope="AT_END" %>
<%
	 int result;
    if(num1>num2)
    	result=num1;
    else
    	result=num2;
     /* 값을 저장하기 위해 <c:set var 속성 사용> */
%>
<c:set var="maximum" value="<%=result%>"/>