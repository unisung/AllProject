<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="managerSessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <b>관리자 작업중...</b>
 <input type="button" value="로그아웃" 
                    onclick="location.href='logon/managerLogout.jsp'"><br>
<table border="0" width="300">
<tr><td align="center" bgcolor="yellow">상품관련 작업</td>
</tr>
<tr><td><a href='productProcess/bookRegisterForm.jsp'>상품등록</a></td>
</tr>
<tr><td><a href='productProcess/bookList.jsp?book_kind=all'>상품수정/삭제</a>
</td>
</tr>
</table>
<table width="300">
<tr><td align="center">구매된 상품관련 작업</td>
</tr>
<tr>
  <td><a href='../orderedProduct/orderedList.jsp'>전체구매목록 확인</a></td>
</tr>
</table>                    
</body>
</html>