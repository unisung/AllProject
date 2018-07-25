<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="groupMailSender.jsp" method="post">
  <table border=1>
   <tr>
   <th>제목</th>
   <td>
   <input type="text" name="subject">
   </td>
   </tr>
   <tr>
   <th>내용</th>
   <td>
   <textarea rows="13" cols="40" name="content"></textarea>
   </td>
   </tr>
   <tr align="center">
   <td colspan="2">
   <input type="submit" value="전송">
   <input type="reset" value="다시입력">
   </td>
   </tr>
  </table>
</form>

</body>
</html>