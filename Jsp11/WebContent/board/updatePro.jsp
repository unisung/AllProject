<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="model.Board">
<jsp:setProperty name="board" property="*"/>
</jsp:useBean>
<%
    /* out.print(board.getNum()+"<br>");
	out.print(board.getSubject()+"<br>");
    out.print(board.getWriter()+"<br>");
    out.print(board.getEmail()+"<br>"); */


   String pageNum = request.getParameter("pageNum");
    BoardDao dao = BoardDao.getInstance();
    //update처리
    int result = dao.updateBoard(board);
    if(result>0){
    	out.print("<script>");
		out.print("alert('수정성공 하였습니다.');");
		out.print("location.href='list.jsp?pageNum="+pageNum+"';");
		out.print("</script>");
    	//response.sendRedirect("list.jsp?pageNum="+pageNum);
    }else if(result==-1){
    	out.print("<script>");
    	out.print("alert('비밀번호가 맞지 않습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }else if(result==0){
    	out.print("<script>");
    	out.print("alert('수정 중 오류가 발생하였습니다.');");
    	out.print("history.back();");
    	out.print("</script>");
    }
%>
</body>
</html>