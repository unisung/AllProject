<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	   BoardDao dao = BoardDao.getInstance();
	   Board board = new Board();
	   for(int i=100;i<1000;i++){
		   board.setWriter("글쓴이"+i);
		   board.setSubject("글제목"+i);
		   board.setContent("글내용 "+i);
		   board.setEmail("kk"+i+"@"+"kk.com");
		   board.setPasswd("1234");
		   board.setNum(0);//신규글 - 글번호 0
		   board.setIp("127.0.0.1");
		   
		   dao.insert(board);
	   }
%>
입력성공
</body>
</html>