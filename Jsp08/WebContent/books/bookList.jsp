<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book list 결과</title>
<style>
<style>
 body{
 margin: 0;
 }
 #wrap{
 width: 960px;
 background: #ccc;
 position: relative;
 margin: 0 auto;
 }
 #header{
 background: #eee;
 padding: 20px;
 }
 #header .logo{
 float: left;
 }
 #content{
 padding: 20px;
 }
 #footer{
 background: #000;
 height: 50px;
 text-align: center;
 padding: 20px;
 }
#footer span{
 color: #fff;
}
.clear{
 clear: both;/* float속성제거 */
}
#bookTable{
 width: 100%;
 border-spacing: 0;
}
#bookTable th{
padding-top: 10px;
padding-bottom: 10px;
border-bottom: 1px solid #999;
}
#bookTable .code{
 width: 15%;
}
#bookTable .title{
 width: 50%;
}
#bookTable .writer{
 width: 20%;
}
#bookTable .price{
 width: 10%;
 text-align: right;
}
#bookTable .odd{
 background: #eee;
}
</style>
</head>
<body>
<%
//초기 파라미터 읽어오기
String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("url");
String user =application.getInitParameter("user");
String password = application.getInitParameter("password");

String sql ="select * from books where writer like '";
/* out.print(sql); */

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	String writer = request.getParameter("writer");
	writer = "%"+(writer==null?"":writer.trim())+"%";
	sql = sql + writer+"'";
/* 	out.print(sql+"<br>"); */
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.createStatement();
	rs =stmt.executeQuery(sql);
	out.print("<div id='wrap'>");
	out.print("<div id='header'>");
	out.print("<span class='logo'><img src='../img/logo.png' alt='사이트로고'></span>");
	out.print("<h1>도서 정보 조회</h1>");
	out.print("<h2>조회 결과</h2>");
	out.print("</div>");
	out.print("<div class='clear'></div>");
	out.print("<div id='content'>");
	out.print("<table id='bookTable'>");
	out.print("<tr><th class='code'>코드</th>");
	out.print("<th class='title'>제목</th>");
	out.print("<th class='writer'>저자</th>");
	out.print("<th class='price'>가격</th></tr>");
	int row=0;
	while(rs.next()){
		int col=0;
		if(row++%2!=0){
		%><tr class="odd">
		<%}else{%>
			<tr class="even">
		<%}%>
		<td class='code'><%=rs.getInt(++col)%></td>
		<td class='title'><%=rs.getString(++col) %></td>
		<td class='writer'><%=rs.getString(++col) %></td>
		<td class='price'>
		<fmt:formatNumber value="<%=rs.getString(++col)%>" groupingUsed="true"/>
		</td>
		</tr>
	<%}
	out.print("</table>");
	out.print("</div>");/* content끝. */
	out.print("<div class='clear'></div>");
	out.print("<div id='footer'><span>2018. choongang All rights reserved.");
	out.print("</span></div>");/* footer */
	out.print("</div>");/* wrap끝.  */
}catch(Exception e){
	out.print(e.getMessage());
}finally{
	try{
		rs.close();stmt.close(); conn.close();
	}catch(Exception e){
		out.print(e.getMessage());
	}
}
%>
</body>
</html>