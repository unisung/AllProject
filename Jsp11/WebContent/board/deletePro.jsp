<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    String passwd =request.getParameter("passwd");
    String pageNum = request.getParameter("pageNum");
    BoardDao dao = BoardDao.getInstance();
    int result = dao.deleteBoard(num, passwd);
    if(result>0){
    	out.print("<script>");
    	out.print("alert('삭제를 완료하였습니다.');");
    	out.print("location.href='list.jsp?pageNum="+pageNum+"';");
    	out.print("</script>");
    }else if(result==0){
    	out.print("<script>");
    	out.print("alert('삭제 중 오류가 발생하였습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }else if(result==-1){
    	out.print("<script>");
    	out.print("alert('비밀번호가 맞지 않습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
%>
</body>
</html>