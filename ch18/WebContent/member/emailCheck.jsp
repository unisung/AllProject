<%@page import="dao.MemberDao1"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	//파라미터 받기

        String emailId = request.getParameter("email");
        System.out.println("email="+emailId);
     //email 조회    
        MemberDao1 dao = MemberDao1.getInstance();
        int result = dao.emailCheck(emailId); // email이 존재하지 않으면:1, 존재하면 2(사용불가)
        
	    	 if(result==1){//사용가능 :1 
	    	out.print("<script>");
	    	out.print("alert('사용할수 있는 email입니다.');");
	    	out.print("window.self.close();");
	    	out.print("</script>");
	    	}else if(result==2){//사용 불가 :2
	    		out.print("<script>");
		    	out.print("alert('사용할수 없는 email입니다.');");
		    	out.print("window.opener.frm.emailId.value='';");
		    	out.print("window.opener.frm.emailId.focus();");
		    	out.print("window.opener.frm.emailD.value='';");
		    	out.print("window.self.close();");
		    	out.print("</script>");
	    	}
%>