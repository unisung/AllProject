<%@page import="java.util.Enumeration"%>
<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String agree = request.getParameter("agree");
    out.print("agree="+agree+"<br>");
    
  String result = null;
    if("Y".equals(agree)){
    	String id = (String)session.getAttribute("id");
    	String password = (String)session.getAttribute("password");
    	String name = (String)session.getAttribute("name");
    	/* out.print("id="+id);
    	out.print("name="+name);
    	Enumeration em = session.getAttributeNames();
    	while(em.hasMoreElements()){
    		out.print(em.nextElement().toString());
    	} */
      try{
    	   MemberDao dao = new MemberDao();
    	   Member member = new Member();
    	   member.setId(id);
    	   member.setName(name);
    	   member.setPassword(password);
    	   
    	   result = dao.insertMember(member)>0?"success":"fail";
    	   
      }catch(Exception e){
    	  result = "fail";
      }finally{
   		try{
   		}catch(Exception e){}
      }//finally 끝.
    }else{
    	out.print("<script>");
    	out.print("alert('약관에 미동의 하였습니다.');");
    	out.print("location.href='PersonalInfo.jsp'");
    	out.print("</script>");
    }
    //세션의 값을 사용 후 세션제거
    session.invalidate();
    out.print("<script>");
    out.print("location.href=Result.jsp?result="+result);
    out.print("</script>");
    //response.sendRedirect("Result.jsp?result="+result); 
%>
</body>
</html>