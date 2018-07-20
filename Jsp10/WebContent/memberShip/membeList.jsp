<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
margin:0;
} 
#wrap{
 width: 960px;
 background: #fff;
 position: relative;
 margin: 0 atuo;
 border-left: 1px solid #eee;
 border-right: 1px solid #eee;
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
 clear: both;
}
.memberTable{
	width: 100%;
	border-spacing: 0;
}
.memberTable th{
  padding-top: 10px;
  padding-bottom: 10px;
  border-bottom: 1px solid #999;
}
.memberTable .number{
	width: 4%;
}
.memberTable .ids{
	width: 8%;
}
.memberTable .name{
	width: 8%;
}
.memberTable .birth{
	width: 10%;
}
.memberTable .address{
  width: 40%;
}
.memberTable .tel{
 width: 14%;
}
.memberTable .email{
 width: 15%;
}
.memberTable td{
   border-bottom: 1px solid #ddd;
   padding-left: 5px;
}
.memberTable tbody td.name{
	background: #eee;
}

.memberTable .odd{
 background: #eee;
}

.memberTable tbody tr:hover{
  background: #ddd;
}
.memberTable tfoot td{
	color:#ddd;
	background: #333;
	border-bottom: 2px solid #ccc;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
	<span class="logo"><img src="../img/logo.png"></span>
	<h1>회원 리스트 보기</h1>
	<h2>회원 리스트</h2>	
	<div class="clear"></div>
	</div>
<div id="content">
<table cellspacing="0" cellpadding="0" class="memberTable">
<thead>
<tr>
	<th class="number">순번</th>
	<th class="ids">아이디</th>
	<th class="name">이름</th>
	<th class="birth">생년월일</th>
	<th class="addreess">주소</th>
	<th class="tel">전화번호</th>
	<th class="email">이메일</th>
</tr>
</thead>
<tbody>
<%
   MemberDao  dao = new MemberDao();
   List<Member> list = dao.memberList();
   int i=0;
   for(Member m:list){
     if((++i)%2==0)
	  out.print("<tr class='even'>");
     else
      out.print("<tr class='odd'>");
     
    out.print("<td class='number'>"+i+"</td>");
	out.print("<td class='ids'>"+m.getId()+"</td>");   
	out.print("<td class='name'>"+m.getName()+"</td>");   
	out.print("<td class='birth'>"+m.getBirth()+"</td>");   
	out.print("<td class='addreess'>"+m.getAddress1()+"<br>");   
	out.print(m.getAddress2()+"</td>");   
	out.print("<td class='tel'>"+m.getTel1()+"-"+m.getTel2()+"-"+m.getTel3()+"</td>");
	out.print("<td class='email'>"+m.getEmail()+"</td>");
	out.print("</tr>");
   }
   %>
   </tbody>
   <tfoot>
   <tr>
   <td></td>
   <td></td>
   <td></td>
   <td></td>
   <td></td>
   <td></td>
   <td>총<%=i%>건</td>
   </tr>
   </tfoot>
  </table>
 </div><!-- content 끝. -->
 <div id="footer">
  <span> 2018. Choongang. </span>
 </div>
 </div><!-- wrap끝.  -->
</body>
</html>