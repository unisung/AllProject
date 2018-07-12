<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body{
margin: 0;
}
#wrap{
	width: 960px;
	background: #fff;
	position: relative;
	margin: 0 auto;/* 위/아래 0, 좌/우 자동(중앙) */
	border-left:1px solid #eee; 
	border-right:1px solid #eee; 
}
#header{
	background: #eee;
}
#header .logo{
   float: left;
}
#content{
 padding:20px;
}
#footer{
  background: #000;
  height: 50px;
  text-align: center;
  padding: 20px;
}
#footer span{
  color:#fff;
}
.clear{
clear: both;/* float속성 제거 */
}
.empTable{
 width: 100%;
 border-spacing: 0;
}
.empTable th{
  padding-top: 10px;
  padding-bottom: 10px;
  border-bottom: 1px solid #bdbdbd;
  text-align: center;
}

.empTable .eno{
 width: 15%;
}
.empTable .ename{
width: 20%;
}
.empTable .sal{
width: 15%;
}
.empTable .job{
width: 20%;
}
.empTable .hdate{
width: 30%;
}
.empTable .odd{
 background: #eee;
}
.odd .eno, .odd .ename, .odd .sal, .odd .job,.odd .ename, .odd .hdate {
 background: #ccc;
}

tr{
text-align:center;
}
</style>
<title>Insert title here</title></head><body>
<%
//초기 파라미터 읽어오기
String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("url");
String user =application.getInitParameter("user");
String password = application.getInitParameter("password");

String deptno=""; //부서번호 받을 변수

deptno =request.getParameter("deptno");
String sql = "select * from emp where dno="+deptno+" order by eno ";
/* out.print(sql); */


Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	rs=stmt.executeQuery(sql);
	%>
<div id="wrap">
    <div id="header">
      <span class="logo"><img src="../img/logo.png" alt="사이트 로고"></span>
      <h1>사원리스트</h1>
      <h2>부서별 사원리스트</h2>
      <div class="clear"></div>
      <hr>
    <div id="content">  
    </div>	
	<table class="empTable" cellspacing="0" cellpadding="0">
	<caption>
	 <h3>사원 리스트</h3>
	</caption>
	<tr>
	<th class="eno">사원번호</th>
	<th class="ename">사원명</th>
	<th class="sal">급여</th>
	<th class="job">업무</th>
	<th class="hdate">입사일자</th>
	</tr>
	<%
	int cnt=0;
	while(rs.next()){
		if(cnt++%2!=0){%>
	<tr class="odd">
	  <%} else{ %>	
	<tr class="even">
	  <%} %>
	<td class="eno"><%=rs.getInt(1)%></td>
	    <td class="ename"><%=rs.getString(2)%></td>
	    <td class="sal"><%=rs.getInt(6)%></td>
	    <td class="job"><%=rs.getString(3)%></td>
	    <td class="hdate"><%=rs.getString(5)%></td>
	</tr>
	<% 	
	}
}catch(Exception e){
	out.print("<b>"+e.getMessage()+"<b>");
}finally{
	try{
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		out.print(e.getMessage());
	}
}
%>
</table>
</div><!--content끝.  -->
<div id="footer">
 <span>2018. Choongang All rights Reserved. </span>
</div>
</div><!-- wrap 끝. -->
</body>
</html>