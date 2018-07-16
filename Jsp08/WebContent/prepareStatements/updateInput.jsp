<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%><%@page import="java.sql.DriverManager"%><%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function chk(){
	if(document.forms[0].pwd1.value!=document.forms[0].pwd2.value){
		alert('입력한 비번과 확인번호가 서로다릅니다.');
		document.forms[0].pwd1.value='';
		document.forms[0].pwd2.value='';
		document.forms[0].pwd1.focus();
		return false;
	}
	return true;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//초기 파라미터 읽어오기
	String driver = application.getInitParameter("Driver");
	String url = application.getInitParameter("url");
	String user =application.getInitParameter("user");
	String password = application.getInitParameter("password");
	
	PreparedStatement pstmt = null;
	String sql="select * from member order by id";
	
	//1.db접속-1.드라이버 로딩
	 Class.forName(driver);
	//2.연결맺기
	 Connection conn = DriverManager.getConnection(url, user, password);
	//3.쿼리객체생성
	 pstmt =conn.prepareStatement(sql);
	//4.
%>
</head>
<body>
<form action="membeUpdate.jsp" onsubmit="chk()">
  <fieldset>
    <legend>회원정보 수정</legend>
    <p>
    <label>id</label>
    <select name="members">
    <%
    try{
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
		   	out.print(" <option value="+rs.getString(1)+">"+rs.getString(1)+"</option>");
		}	
	}catch(Exception e){
	   out.print(e.getMessage());
	}
    %>
    </select>
    </p>
    <p>
    <label>이름</label>
    <input type="text" name="name">
    </p>
    <p>
    <label>전화번호</label>
    <input type="text" name="pno">
    </p>
    <p>
    <label>주소</label>
    <input type="text" name="address">
    </p>
  </fieldset>
  <fieldset>
   <legend>비밀번호 수정</legend>
   <p>
   <label>비밀번호</label>
   <input type="password" name="pwd1">
   </p>
   <p>
   <label>비밀번호확인</label>
   <input type="password" name="pwd2">
   </p>
  </fieldset>
 <p>
  <input type="submit" value="전송">
 </p>
</form>

</body>
</html>