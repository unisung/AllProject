<%@page import="dao.MemberDao1"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%

	//파라미터 받기
	String id = request.getParameter("id");

	//DB처리 작업dao 생성 
           MemberDao1 dao = MemberDao1.getInstance();
		    int result = dao.userCheck(id);//userCheck()오버로딩
	    	/* 집계함수로 조회된 데이타의 값 비교 : id가 있으면 1  */
	    	 if(result==2){
	    	out.print("<script>");
	    	out.print("alert('사용할수 있는 id입니다.');");
	    	/* 부모창의 특정요소에 값 지정
	    		window.opener.frm.요소명.속성;
	    	*/
	    	out.print("window.opener.frm.password.focus();");
	    	/* 자기자신을 닫을 때 window.self.close() */
	    	out.print("window.self.close();");
	    	out.print("</script>");
	    	}else{/* 있으면 결과값은 2 */
	    		out.print("<script>");
		    	out.print("alert('사용할수 없는 id입니다.');");
		    	/* 부모창의 특정요소에 값 지정
	    		window.opener.frm.요소명.속성;
	    	    */
		    	out.print("window.opener.frm.id.value='';");
		    	out.print("window.opener.frm.id.focus();");		    	
		    	out.print("window.self.close();");
		    	out.print("</script>");
	    	}
%>