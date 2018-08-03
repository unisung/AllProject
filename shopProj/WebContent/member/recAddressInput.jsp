<%@page import="dao.ReceiverDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
	String id= request.getParameter("buyer");
    String name = request.getParameter("name");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");
    String zipno= request.getParameter("zipno");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
%>
<jsp:useBean id="receiver" class="model.Receiver">
<jsp:setProperty name="receiver" property="*"/>
</jsp:useBean>

<%
         
   /*  out.print("id="+receiver.getId()+"<br>");
    out.print("name="+receiver.getName()+"<br>"); */
    /* out.print("tel="+tel1+"-"+tel2+"-"+tel3+"<br>");
    out.print("zipno="+zipno+"<br>");
    out.print("address="+address1+":"+address2+"<br>"); 
     */
    ReceiverDao  dao = ReceiverDao.getInstance();
    int result = dao.insertReceiverInfo(receiver);
    
    if(result>0){
    	out.print("<script>");
    	out.print("alert('배송지 정보 추가성공');");
    	out.print("history.back();");
    	out.print("</script>");
    }else{
    	out.print("<script>");
    	out.print("alert('배송지 정보 추가실패');");
    	out.print("history.back();");
    	out.print("</script>");
    }
    
    
    
    
    
    



%>
</body>
</html>