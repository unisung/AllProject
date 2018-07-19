<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
String id = request.getParameter("id");
%>
<script>
  function cl(){
	 opener.document.frm.id.value="<%=id%>";
	 window.close();//현재창(자신)을 닫음
  }
</script>
</head>
<body>
<%   
    
	 MemberDao dao = new MemberDao();
      int result = dao.userCheck(id);//id존재여부 확인 메소드 */
     if(result==1){%>
    	 이미 있는 아이디 입니다.<br>
    	 다른 아이디를 입력하세요<p>
   <form><!-- form에 action이 없으면 자신으로 되돌아감.  -->
    <table>
      <tr><th>아이디</th>
      <td><input type="text" name="id"></td></tr>
      <tr><th colspan=2><input type="submit" value="확인"></th></tr>
    </table>
   </form> 	 
    <%}else{%>
    <b><%=id %></b>는
    사용가능한 ID입니다.<p>
    <button onclick="cl()">닫기</button>
  <%} %>
</body>
</html>