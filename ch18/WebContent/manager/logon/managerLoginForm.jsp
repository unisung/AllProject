<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>메니저 로그인 폼</title>
</head>
<body>
<form action="managerLoginPro.jsp" name="form1" method="post" 
                                                      onsubmit="return chk()">
<table border="1" bgcolor="yellow" align="center">
    <tr><td>아이디</td><td><input type="text" name="id" maxlength="10"></td></tr>
    <tr><td>패스워드</td><td><input type="password" name="password" maxlength="10"></td></tr>
    <tr><td colspan=2 align="center">
           <input type="submit" value="메니저 로그인">
    </td></tr>
</table>                                                      
</form>
</body>
</html>