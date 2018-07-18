<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
  <h2>로그인 폼</h2>
  <form method="post" action="cookieLoginPro.jsp">
   <fieldset>
   <legend>입력</legend>
   <p>
   <label>아이디</label>
   <input type="text" name="id" maxlength="20" autofocus required>
   </p>
   <p>
   <label>패스워드</label>
   <input type="password" name="password" maxlength="20" required>
   </p>
   </fieldset>
   <p>
   <input type="submit" value="로그인">
   <input type="reset" value="취소">
   <!-- BOM(브라우저가 가지있는 객체 모델) location.href='이동할 경로' -->
   <input type="button" value="회원가입" onclick="location.href='insertMemberForm.jsp'">
   </p>
  </form>
</body>
</html>