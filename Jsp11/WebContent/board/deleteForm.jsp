<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function chk(){
	var pass1 = document.getElementById("passwd");
	var pass2 = document.getElementById("passwd2");
	if(pass1.value==""){
		alert('비밀번호를 입력하세요');
		pass1.focus();
		return false;
	}
	if(pass2.value==""){
		alert("비밀번호 확인을 입력하세요");
		pass2.focus();
		return false;
	}
	if(pass1.value!=pass2.value){
		alert("비밀번호와 비밀번호 확인 입력값이 서로 다릅니다.");
		pass1.value="";
		pass2.value="";
		pass1.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
   String pageNum = request.getParameter("pageNum");
%>
<h2>게시글 삭제</h2>
<form  action="deletePro.jsp" method="post" onsubmit="return chk()">
<table border=1>
<caption>비밀번호를 입력하세요</caption>
<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
<input type="hidden" name="pageNum" value="<%=request.getParameter("pageNum")%>">
<tr>
 <th>비밀번호</th><td><input type="password" name="passwd" id="passwd"></td>
</tr>
<tr>
 <th>비밀번호확인</th><td><input type="password" name="passwd2" id="passwd2"></td>
</tr>
<tr align="center">
<td colspan=2>
<input type="submit" value="확인">
<input type="reset" value="다시입력">
<input type="button" value="돌아가기" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
</td></tr>
</table>

</form>
</body>
</html>