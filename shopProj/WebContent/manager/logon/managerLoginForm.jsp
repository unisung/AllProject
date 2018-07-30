<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인 폼</title>
</head>
<body>
 <form action="managerLoginPro.jsp" name="form1" method="post">
 <table border=1 bgcolor="yellow" align="center">
 	<tr><td>아이디</td><td><input type="text" name="id" maxlength="15" required></td>
 	</tr>
 	<tr><td>패스워드</td><td><input type="password" name="password" maxlength="15" required>
 	</td>
 	</tr>
 	<tr>
 	<td colspan=2 align="center">
 	<input type="submit" value="메니저 로그인">
 	</td>
 	</tr>
 </table>
 </form>
</body>
</html>