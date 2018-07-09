<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%

     String id =(String)session.getAttribute("id");
    if(id==null) response.sendRedirect("login.html");
    
	String pageFile = request.getParameter("page");
    if(pageFile==null){
    	pageFile ="newitem";
    }
%>
</head>
<body>
      <table width="960px" border="1" 
                     color="gray" algin="center" height="620px">
        <tr>
          <td colspan=2 height="43px" align="left">
              <jsp:include page="top.jsp"/>
          </td>
        </tr>
        <tr>
          <td width="15%" align="right" valign="top">
            <jsp:include page="left.jsp"/>
          </td>
          
          <td align="center">
            <jsp:include page='<%=pageFile+".jsp"%>'/><!-- newitem.jsp -->
          </td>
        </tr>
        <tr>
        <td colspan=2>
          <jsp:include page="bottom.jsp"/>
        </td>
        </tr>
      </table>
</body>
</html>