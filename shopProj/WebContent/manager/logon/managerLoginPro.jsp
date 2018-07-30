<%@page import="dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    /* 관리자 로그인시 id, 패스워드를 파라미터로 받아서  관리자 체크 메소드로 인증 처리 */
	String id=request.getParameter("id");
    String password = request.getParameter("password");
    BookDao dao = BookDao.getInstance();
    //관리자 id,패스워드 체크
    int result = dao.managerCheck(id,password);
    if(result==1){//로그인 처리
    	//인증처리 후 session에 관리자 id 등록 후 관리자 메인 화면으로 이동.
       session.setAttribute("managerId", id);
       response.sendRedirect("../managerMain.jsp");
    }else if(result==0){
    	out.print("<script>");
    	out.print("alert('패스워드가 맞지 않습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }else if(result==-1){
    	out.print("<script>");
    	out.print("alert('ID가 존재하지 않습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
%>
</body>
</html>