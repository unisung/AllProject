<%
    /* 관리자 세션 체크  */
    String managerId="";
   String path = application.getContextPath();
   managerId=(String)session.getAttribute("managerId");//"manageId" 이름으로 체크
   if(managerId==null||"".equals(managerId)){
	   response.sendRedirect(path+"/manager/logon/managerLoginForm.jsp");
   }
%>