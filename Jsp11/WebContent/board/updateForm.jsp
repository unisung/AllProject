<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function chk(){
 var pass1 = document.getElementById("passwd");
 var pass2 = document.getElementById("passwd2");
 if(pass1.value!=pass2.value){
	 alert('비밀번호와 비밀번호 확인 입력값이 서로 다릅니다.');
	 pass1.value="";
	 pass2.value="";
	 pass1.focus();
	 return false;
 }
 return true;
}	
</script>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.getBoard(num);
%>
</head>
<body>
<form method="post" action="updatePro.jsp" onsubmit="return chk()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table border=1>
<caption>게시판 내용 수정</caption>
<tr><th>제목</th>
    <td><input type="text" name="subject" value="<%=board.getSubject()%>" required></td>
</tr> 
<tr><th>작성자</th>
    <td><input type="text" name="writer" value="<%=board.getWriter()%>" readonly></td>
</tr>
<tr><th>이메일</th>
<td><input type="text" name="email" value="<%=board.getEmail()%>" required></td> 
</tr>

<tr><th>내용</th>
<td><textarea rows="13" cols="40" name="content" required><%=board.getContent()%></textarea>
</td>
</tr>

<tr><th>비밀번호</th>
<td><input type="password" name="passwd" id="passwd" required></td>
</tr>
<tr><th>비밀번호 확인</th>
<td><input type="password" name="passwd2" id="passwd2"  required></td>
</tr>
<tr>
<th colspan=2>
<input type="submit" value="확인">
<input type="reset" value="다시입력">
</th>
</tr>
</table>
</form>
</body>
</html>