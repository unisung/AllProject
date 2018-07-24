<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function writeSave(){
	//value.length=0, value=="", (!value), (value==null)
 if(document.writeForm.writer.value==""){
	 alert("작성자를 입력하세요.");
	 document.writeForm.writer.focus();
	 return false;
 }
 if(document.writeForm.subject.value==""){
	 alert("제목을 입력하세요");
	 document.writeForm.subject.focus();
	 return false;
 }
 if(document.writeForm.content.value==""){
	 alert("내용을 입력하세요");
	 document.writeForm.content.focus();
	 return false;
 }
 if(document.writeForm.passwd.value==""){
	 alert("비밀번호를 입력하세요");
	 document.writeForm.passwd.focus();
	 return false;
 }
 if(document.writeForm.passwd2.value==""){
	 alert("비밀번호 확인을 입력하세요");
	 document.writeForm.passwd2.focus();
	 return false;
 }
 if(document.writeForm.passwd.value!=document.writeForm.passwd2.value){
	 alert("비밀번호 와 비밀번호 확인 값이 서로 다릅니다.");
	 document.writeForm.passwd.value="";
	 document.writeForm.passwd2.value="";
	 document.writeForm.passwd.focus();
	 return false;
 }
 return true;
}
</script>
</head>
<body>
<%
    //글번호 와 글그룹 번호 초기화
	int num=0,ref=1,re_step=0,re_level=0;
	//페이지 번호 초기화
    String pageNum=request.getParameter("pageNum");
	//파라미터로 받은 페이지 번호가 없으면 1페이지로 설정
    if(pageNum==null||"".equals(pageNum)) pageNum="1";
	//파라미터로 받은 글번호가 없으면 신규글,글번호가 있으면 답변글 
    if(request.getParameter("num")!=null){//답변글
    	num=Integer.parseInt(request.getParameter("num"));
        ref=Integer.parseInt(request.getParameter("ref"));
        re_step=Integer.parseInt(request.getParameter("re_step"));
        re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
<h3>글쓰기</h3>
<form method="post" action="writePro.jsp?pageNum=<%=pageNum%>"
                      name="writeForm" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">
<table width="400" border="1" align="center">
 <tr>
  <td align="center" colspan="2"><a href="list.jsp">글목록</a></td> 
 </tr>
 <tr><th>이름</th>
 <td><input type="text" size="20" maxlength="20" size="20" name="writer"></td>
 </tr>
 <tr><th>제목</th>
 <%if(request.getParameter("num")==null){ %>
 <td><input type="text" size="50" maxlength="50" size="50" name="subject"></td>
 <%}else{%>
 <td><input type="text" size="50" maxlength="50" name="subject" value="[답변]"></td>
 <%}%>
 </tr>
 <tr>
 <th>Email</th>
 <td>
 <input type="text" size="40" maxlength="40" name="email">
 </td>
 </tr>
 <tr>
 <th>내용</th>
 <td><textarea rows="13" cols="40" name="content"></textarea></td>
 </tr>
 <tr>
 <th>비밀번호</th>
 <td><input type="password" name="passwd" maxlength="20" size="20"></td>
 </tr>
 <tr>
 <th>비밀번호 확인</th>
 <td><input type="password" name="passwd2" maxlength="20" size="20"></td>
 </tr>
 <tr align="center">
 <td colspan=2>
 <input type="submit" value="글쓰기">
 <input type="reset"  value="다시작성">
 <input type="button" value="목록보기" onclick="window.location='list.jsp'">
 </td>
 </tr>

</table>






</form>
</body>
</html>