<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<script>
function focusIt(){
	inform.id.focus();
}
</script>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
	//로그인 여부에 따라 처리
   if(session.getAttribute("id")==null){// 로그인 하지 않았으면...
%>
</head>
<body onload="focusIt()"><!-- onload이벤트 - 문서가 로딩완료 직후발생하는 이벤트  -->
<a href="${path}/shop/list.jsp?book_kind=all">전체목록보기</a>
<br>
<form name="inform" method="post" action="${path}/member/LoginProc.jsp">
<table>
 <tr><td>아이디</td>
     <td><input type="text" name="id" size="15" maxlength="12" ></td>
 </tr>
 <tr><td>패스워드</td>
     <td><input type="password" name="password" size="15" maxlength="12">
     </td>
 </tr>
 <tr>
 <td colspan=2>
   <input type="submit" value="로그인">
   <input type="reset" value="지우기">
   <input type="button" value="회원가입" 
      <%--  onclick="location.href='${path}/member/joinProc1.jsp'"> --%>
      onclick="location.href='${path}/member/authent.jsp'">
 </td>
 </tr>       
</table>
</form>
<font color="red"><b>*로그인을 하셔야 쇼핑을 하실수 있습니다.</b></font>
<% }else{ //id가 있는 경우(=로그인한 경우)
	String id = (String)session.getAttribute("id");
    MemberDao dao = MemberDao.getInstance();
    Member member = dao.selectMember(id);
    request.setAttribute("member", member);
%>

<a href="${path}/shop/list.jsp?book_kind=all">전체 목록 보기</a>&nbsp;
<a href="${path}/shop/cartList.jsp?book_kind=all">장바구니 보기</a>&nbsp;
<a href="${path}/shop/buyList.jsp">구매목록 보기</a>&nbsp;
<br><br>
<b>${member.name}</b>님, 즐거운 쇼핑 시간 되세요.
<br>
<input type="button" value="로그아웃" onclick="location.href='${path}/member/logout.jsp'">
<% } %>
</body>
</html>