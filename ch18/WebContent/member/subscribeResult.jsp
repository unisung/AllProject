<%@page import="model.Member"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
회원id:${member.id}<br>
회원이름:${member.name}<br>
회원우편번호:${member.zipno}<br>
회원주소1:${member.address1}<br>
회원주소2:${member.address2}<br>
회원생일:${member.birth}<br>
회원전화번호:${member.tel1}-${member.tel2}-${member.tel3}<br>
회원email:${member.email}<br><br>
<a href="${path}/shop/shopMain.jsp">로그인 하기</a>
