<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	  String pgm = request.getParameter("pgm");
      if(pgm==null||"".equals(pgm)){
    	  pgm = "introList.jsp";
      }
        request.setAttribute("pgm", pgm);
%>
<html><head>
<title>Book Shop Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="850" border="1" cellpadding="2" cellspacing="0">
       <tr><td><img src="../module/logo.jpg" width="150" height="120">
              </td>
              <td><jsp:include page="../module/top.jsp"/>
              </td>
       </tr>	
       <tr><td valign="top">
              <jsp:include page="../module/left.jsp"/>
              </td>
              <td width="700" valign="top">
              <jsp:include  page="${pgm}" /><!-- 메인 페이지 -->
              </td>
	  </tr>
	  <tr><td valign="top" align="center">
	        <img src="../module/logo.jpg" width="90" height="60">
	        </td>
	        <td width="700" valign="top">
	        <jsp:include page="../module/bottom.jsp"  flush="false" />
	        </td>
	  </tr>      
	</table>
</body>
</html>