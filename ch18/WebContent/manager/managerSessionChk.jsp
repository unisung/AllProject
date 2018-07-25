<%
	String managerId="";
	/* 어플리케이션의 전체경로  */
    String path = application.getContextPath();
	managerId = (String)session.getAttribute("managerId");
	if(managerId ==null || managerId.equals("")){
		response.sendRedirect(path+"/manager/logon/managerLoginForm.jsp");
	}
%>