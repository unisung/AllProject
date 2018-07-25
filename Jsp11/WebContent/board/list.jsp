<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body,td{text-align: center;}
.left{  text-align:left; }
</style>
</head>
<body>
 <%
    //페이지 사이즈 설정
 	int pageSize=10;
 	String pageNum = request.getParameter("pageNum");
 	if(pageNum==null||"".equals(pageNum)) pageNum="1";//초기에 파라미터값이 없으면 1페이지로 설정
 	//현재페이지 설정
 	int currentPage = Integer.parseInt(pageNum);
 	//현재페이지의 시작행(시작 글번호)
 	int startRow = (currentPage -1)*pageSize +1;
 	//현재페이지의 마지막행(마지막 글번호)
 	int endRow =currentPage*pageSize;
 	//글 갯수
 	int count=0;
 	//번호
 	int number=0;
 	//글목록 가져오기
 	List<Board> boardList = null;
 	//글목록 가져오기 객체(dao)
 	BoardDao dao = BoardDao.getInstance();
 	//글목록 갯수 가져오기
 	count = dao.getBoardCount();
 	 if(count>0){
 		boardList = dao.getBoards(startRow,endRow);//현재 페이지의 시작글,끝글 가져오기
 	} 
 	//글의 끝 번호 
 	number = count-(currentPage -1)*pageSize;
 %>
 <h2>글목록(전체글:<%=count%>)</h2>
 <table width="700px" align="center">
	 <tr align="right" bgcolor="#fff0b5">
	 <td>
	  <a href="writeForm.jsp">글쓰기</a>
	 </td>
	 </tr>
 </table>
 <%
   if(count==0){%>
  <table width="700px" align="center" border=1> 
   <tr><td>게시판에 저장된 글이 없습니다.</td></tr>
 </table>
 <%}else{%>
    <table border=1 width="700px" align="center">
    <tr height="30" bgcolor="#ffe271">
     <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회</th><th>IP</th></tr>
 <%
 	for(int i=0;i<boardList.size();i++){
 		Board board=(Board)boardList.get(i);
   %>
 	  <tr height="30">
 	  <td><%=number--%>|<%=board.getNum()%></td>
 	  <td width="250" class="left">	
 	<%
 	  int wid=0;
 	if(board.getRe_level()>0){
 		wid=10*(board.getRe_level());
 	%>
 	<img src="../images/level.gif" width="<%=wid%>" height="16">
 	<img src="../images/re.gif">
 	<%}else{%>
 	<img src="../images/level.gif" width="<%=wid%>" height="16">	
 	<%	
 	}
   %>
   <a href="content.jsp?num=<%=board.getNum()%>&pageNum=<%=currentPage%>">
   <%=board.getSubject()%></a>
   <% if(board.getReadcount()>=20){%>
   <img src="../images/hot.gif" border="0" height="16"><%}%>
   </td>	
   <%-- <td><a href="mailto:<%=board.getEmail()%>"><%=board.getWriter()%></a></td> --%>
   <td>
   <a href="sendMailForm.jsp?emailId=<%=board.getEmail()%>
   &writer=<%=board.getWriter()%>
   &pageNum=<%=pageNum%>">
   <%=board.getWriter()%></a>
   </td>
   <td><%=board.getReg_date()%></td><td><%=board.getReadcount() %></td>
   <td><%=board.getIp()%></td>     
   </tr>
   <%} %>
  </table>
<% 
  }%>
  <!-- page navigator -->
  <%
  if(count>0){
	  int pageCount = count/pageSize+(count%pageSize==0?0:1);
	  int startPage = (int)((currentPage-1)/10)*10+1;//현재블럭의 시작페이지
	  int pageBlock=10;
	  int endPage = startPage + pageBlock -1;//현재 블럭의 끝 페이지
	  if(endPage > pageCount) endPage = pageCount;
	  //블럭의 시작페이지가 11페이지 이후면
	  if(startPage>10){%>
	   <a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>	   
       <%
	  }
	  for(int i=startPage;i<=endPage;i++){%>
	  <a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a><%
	  }
	  if(endPage < pageCount){ %>
      <a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
   <%
     }
  }
   %> 
</body>
</html>