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
    	PrintWriter writer = null;
      try{
    	  String filePath = application.getRealPath("/WEB-INF/"+id+".txt");
    	  writer = new PrintWriter(filePath);
    	  writer.println(" 아이디: "+id);
    	  writer.println("패스워드: "+password);
    	  writer.println("이름:"+name);
    	  result="success";
      }catch(Exception e){
    	  result = "fail";
      }finally{
   		try{
   			writer.close();
   		}catch(Exception e){
   			
   		}
      }//finally 끝.
    }else{
    	out.print("<script>");
    	out.print("alert('약관에 미동의 하였습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
    //세션의 값을 사용 후 세션제거
    //session.invalidate();
    response.sendRedirect("Result.jsp?result="+result); 
%>
</body>
</html>