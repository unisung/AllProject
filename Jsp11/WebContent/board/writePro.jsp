<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
   out.print(board.getWriter()+"<br>");
   out.print(board.getSubject()+"<br>");
   out.print(board.getPasswd()+"<br>");
   out.print(board.getContent()+"<br>");
   out.print(board.getEmail()+"<br>");
   out.print(board.getReadcount()+"<br>");
   out.print(board.getRef()+"<br>");
   out.print(board.getRe_step()+"<br>");
   out.print(board.getRe_level()+"<br>");
   out.print(board.getIp()+"<br>");
   out.print(board.getReg_date()+"<br>"); */
   String pageNum = request.getParameter("pageNum");
   board.setIp(request.getRemoteAddr());
   /* out.print(board.getIp()+"<br>"); */
   BoardDao dao = BoardDao.getInstance();
   int result = dao.insert(board);
   if(result>0){
	   out.print("<script>");
	   out.print("alert('게시글 등록 완료');");
	   out.print("location.href='list.jsp?pageNum="+pageNum+"';");
	   out.print("</script>");
   }else{
	   out.print("<script>");
	   out.print("alert('게시글 등록 중 오류 발생');");
	   out.print("history.back();");
	   out.print("</script>");
   }

%>
</body>
</html>