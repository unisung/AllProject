<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=id %>님 환영합니다.<p>
<table>
 <tr>
 <td>
 <input type="button" onclick="location.href='deleteMember.jsp'" value="회원탈퇴"></input>
 </td>
 <td>
 <input type="button" onclick="location.href='updateMemberForm.jsp'" value="회원수정"></input>
 </td>
 <td>
 <input type="button" onclick="location.href='membeList.jsp'" value="회원리스트"></input>
 </td>
 <td>
 <input type="button" onclick="location.href='logout.jsp'" value="로그아웃"></input>
 </td>
 </tr>
</table>
</body>
</html>