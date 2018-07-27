<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    MemberDao dao = MemberDao.getInstance();
    int result = dao.userCheck(id, password);
    if(result==1){//아디와 비번 모두 맞은 경우
       //로그인 처리
       session.setAttribute("id", id);
       session.setAttribute("password", password);
       response.sendRedirect(path+"/shop/shopMain.jsp");
    }else if(result==0){//아이디는 맞지만, 비번이 다른경우
    	out.print("<script>");
    	out.print("alert('패스워드를 확인하세요');");
    	out.print("history.back();");
    	out.print("</script>");
    }else{//아이디가 없는 경우
    	out.print("<script>");
        out.print("alert('없는 id입니다.');");
        out.print("history.back();");
        out.print("</script>");
    }
%>
</body>
</html>