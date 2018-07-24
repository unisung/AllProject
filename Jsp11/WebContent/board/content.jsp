<%@page import="model.Board"%><%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.getBoard(num);
    if(board==null){
    	out.print("데이타가 없습니다.");
    }else{
    	 System.out.println("content="+board.getContent().replace("\n", "<br>"));
    	dao.updateCount(num);
    	out.print("<table border=1 width=500>");
    	out.print("<caption>게시판 글 내용보기</caption>");
    	out.print("<tr><th width='80'>제목</th><td>"+board.getSubject()+"</td></tr>");
    	out.print("<tr><th>작성자</th><td>"+board.getWriter()+"</td></tr>");
    	out.print("<tr><th>조회수</th><td>"+board.getReadcount()+"</td></tr>");
    	out.print("<tr><th>작성일</th><td>"+board.getReg_date()+"</td></tr>");
    	out.print("<tr><th>IP</th><td>"+board.getIp()+"</td></tr>");
    	out.print("<tr><th>내용</th><td><pre>"+board.getContent()+"</pre></td></tr>");
    	out.print("<tr align='center'><td colspan=2>");
    	out.print("<input type='button' value='목록'"); 
    	out.print(" onclick=location.href='list.jsp?pageNum="+pageNum+"'>");
    	out.print("<input type='button' value='수정'"); 
        out.print(" onclick=location.href='updateForm.jsp?num="+num+"&pageNum="+pageNum+"'>");
    	out.print("<input type='button' value='삭제' ");
    	out.print(" onclick=location.href='deleteForm.jsp?num="+num+"&pageNum="+pageNum+"'>");
    	out.print("<input type='button' value='답변' ");
    	out.print(" onclick=location.href='writeForm.jsp?pageNum="+pageNum+"&num="
    	          +num+"&ref="+board.getRef()
    	          +"&re_step="+board.getRe_step()+"&re_level="+board.getRe_level()+"'>");
    	out.print("</td></tr></table>");
    }


%>
</head>
<body>

</body>
</html>