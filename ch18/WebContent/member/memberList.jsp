<%@page import="java.util.ArrayList"%><%@page import="model.Member"%><%@page import="dao.MemberDao1"%><%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	   String id = (String)session.getAttribute("id");

		if(id==null|id.equals("")){
			out.print("<script>");
			out.print("alert('먼저 로그인 해주세요');");
			out.print("location.href='loginform.html';");
			out.print("</script>");
		}else{
		  		MemberDao1 dao = MemberDao1.getInstance();	
		     ArrayList<Member> list = dao.getMemberList();
		     request.setAttribute("list", list);
		}
%>
<!-- 회원리스트 출력 : id, name, birth, email, regdate  table로 출력-->
<c:if test="${empty list}">
<h3>회원리스트가 없습니다.</h3>
</c:if>
<c:if test="${!empty list}">
		<table border="1" bgcolor="yellow">
		<caption><h3>회원 리스트</h3></caption>
		<tr><th>순번</th><th>id</th><th>회원명</th><th>생일</th>
		      <th>email</th><th>가입일자</th></tr>
	<c:forEach var="m" items="${list}" varStatus="status">
		 <tr><td>${status.count}</td>
		        <td><a href="memberUpdateform.jsp?id=${m.id }">${m.id}</a></td>
		        <td>${m.name}</td>
		       <td>${m.birth}</td>
		       <td>${m.email}</td>
		       <td>${m.regdate}</td>
		 </tr>
    </c:forEach>
    </table>
</c:if>
