<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function focusIt(){
		inform.id.focus();
	}
</script>
<%
		String path = request.getContextPath();
         request.setAttribute("path", path);
         if(session.getAttribute("id")==null){
%>
</head>
<body onload="focusIt()">
	<a href="${path}/shop/list.jsp?book_kind=all">전체목록보기</a>
	<br>
	<form name="inform" method="post" action="${path}/member/LoginProc.jsp">
		<table>
			<tr><td>아이디:</td>
			       <td><input type="text" name="id" size="15" maxlength="12"></td>
			</tr>
			<tr><td>패스워드:</td>
			       <td><input type="password" name="password" size="15" maxlength="12">
			       </td>
			</tr>
			<tr><td colspan="2" align="center">
			        <input type="submit" value="로그인">
			        <input type="reset" value="지우기">
			        <input type="button" value="회원가입" onclick="location.href='${path}/member/joinProc1.jsp'">
			</table>
		</form>
		<font color="red"><b>* 로그인을 하셔야 쇼핑을 하실수 있습니다*</b></font>

<% }else{ 
			String id = (String)session.getAttribute("id");
%>
       <a href="${path}/shop/list.jsp?book_kind=all">전체목록보기</a>&nbsp;
       <a href="${path}/shop/cartList.jsp?book_kind=all">장바구니보기</a>&nbsp;
       <a href="${path}/shop/buyList.jsp">구매목록보기</a>&nbsp;
       <br><br>
       <b>${id}</b>님 , 즐거운 쇼핑시간 되세요.
       <br>
       <input type="button" value="로그아웃" onclick="location.href='${path}/member/logout.jsp'">
      
<%} %>       		
</body>
</html>
