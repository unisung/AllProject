<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>book list 결과</title>
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
#bookTable .seq{
 width: 4%;
}
#bookTable .bookno{
 width: 4%;
}
#bookTable .code{
 width: 5%;
}
#bookTable .title{
 width: 20%;
 text-align: left;
}
#bookTable .writer{
 width: 15%;
}
#bookTable .price{
 width: 4%;
 text-align: right;
}
#bookTable .odd{
 background: #eee;
}
#bookTable td {
  text-align:center;
}

</style>
</head>
<body>
<%
//페이지 설정
int pageSize = 10;
String pageNum = request.getParameter("pageNum");
//파라미터값이 없거나 빈문자열("")이면 pageNum을 첫페이지(1)로 설정
if(pageNum==null || pageNum.equals("")) pageNum="1";
int currentPage = Integer.parseInt(pageNum);
//현재페이지의 시작번호
int startRow = (currentPage -1)*pageSize +1;//
//현재페이지의 마지막번호
int endRow = currentPage * pageSize;


//초기 파라미터 읽어오기
String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("url");
String user =application.getInitParameter("user");
String password = application.getInitParameter("password");

String writer = request.getParameter("writer");//
//null이나 빈문자열("")인 경우=>"","%": null값과 다른 문자열의 결과는 null
// null+ "%" => null 연산불가
writer = "%"+(writer==null?"":writer.trim())+"%";//"%값%"

/* String sql ="select * from books where writer like '"; */
String sql = "select rownum, a.rn, a.code, a.name, a.writer, a.price "
           + " from (select rownum rn, books.*" 
           + " from books " 
           + " where writer like '"+ writer+"' "   
           + " order by code) a "
           + " where rn between "+startRow+" and "+endRow;

/* out.print(sql+"<br>");  */

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	
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
	out.print("<tr><th class='seq'>순번</th>");
	out.print("<th class='bookno'>번호</th>");
	out.print("<th class='code'>코드</th>");
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
		<td class='seq'><%=rs.getInt(++col) %></td>
		<td class='bookno'><%=rs.getInt(++col) %></td>
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