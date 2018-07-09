<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 body{
  margin: 0;
 }
 #wrap{
 	width: 960px;
 	background: #fff;
 	position: relative;
 	left:50%;
 	margin-left:-480px;
 	border-left: 1px solid #eee;
 	border-right: 1px solid #eee;
 }
 #header{
 	background: #eee;
 	padding:20px;
 }
 #header .logo{
   float: left;
 }
 /* header 끝. */
 #content{
 	padding: 20px;
 }
/* content 끝. */
#footer{
background: #000;
height: 50px;
text-align: center;
padding: 20px;
}
#footer span{
	color:#fff;
}
/* footer끝. */
.clear{
	clear: both;
} 
.memberTable{
 width: 100%;
 border-spacing: 0;
}
.memberTable .odd{
	background: gray;
}
.memberTable .even{
	background: white;
}
.memberTable th{
  padding-top: 10px;
  padding-bottom: 10px;
  border-bottom: 1px solid #999;
}
.memberTable td{
  text-align: center;
  padding-left:0px;
   border-bottom: 1px solid #999;
}
.memberTable .name{
  text-align: center;
  padding-left:0px;
}
.memberTable .comment{
  height: 100px;
}
#words{
  vertical-align: top;
  border-left: 1px solid #999;
}
</style>
</head>
<body>
      <%
      	 String name = request.getParameter("name");
         String id = request.getParameter("id");
         String password = request.getParameter("pwd1");
         String phone1 = request.getParameter("phohe1");
         String phone2 = request.getParameter("phohe2");
         String phone3 = request.getParameter("phohe3");
         String gender = request.getParameter("gender");
         String comment = request.getParameter("comment");
      %>
  <div id="wrap">
     <div id="header">
        <a href="template.jsp"><span class="logo">
        <img src="img/logo.png" alt="사이트로고"></span></a>
        <h1>회원가입현황</h1>
        <h2>회원정보</h2>
        <div class="clear"></div>
     </div>
     <div id="content">
      <table cellspacing="0" cellpadding="0" class="memberTable">
        <thead>
          <tr>
             <th>이름</th><th>아이디</th><th>비번</th><th>전화번호</th><th>성별</th>
          </tr>
        </thead>
        <tbody>
             <tr class="odd">
              <td class="name"><%=name %></td>
              <td><%=id %></td>
              <td><%=password %></td>
              <td><%=phone1==null?"":phone1%><%=phone2==null?"":"-"+phone2%><%=phone3==null?"":"-"+phone3%></td>
              <td><%=gender.equals("m")?"남자":"여자" %></td>
             </tr>
        </tbody>
        <tfoot>
        <tr class="comment">
           <td>하고싶은말</td>
           <td colspan=4 id="words"><%=comment %></td>
        </tr>
        </tfoot>
      </table>
     </div>
     <div id="footer">
     <span>2018.CSS Members All rights reserved. </span>
     </div>
  </div>
  
</body>
</html>