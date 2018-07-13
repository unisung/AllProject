<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
#deptTable{
width: 100%;
border-spacing: 0;
}
#deptTable th{
padding-top: 10px;
padding-bottom: 10px;
border-bottom: 1px solid #999;
}
#deptTable .no{
width: 4%;
}
#deptTable .dname{
width: 4%;
}
#deptTable .loc{
width: 5%;
}
#deptTable .title{
width: 20%;
text-align: left;
}

#deptTable .odd{
 background: #eee;
}
#deptTable td {
 text-align:center;
}
</style>
<title>Insert title here</title>
</head>
<body>
    <%
       //입력파라미터 정보 얻기
       String no 
            = request.getParameter("no")==null?"0":request.getParameter("no");
       String dname 
            = request.getParameter("dname")==null?"":request.getParameter("dname");
       String loc 
            = request.getParameter("loc")==null?"":request.getParameter("loc");
       
      //초기 파라미터 읽어오기
       String driver = application.getInitParameter("Driver");
       String url = application.getInitParameter("url");
       String user =application.getInitParameter("user");
       String password = application.getInitParameter("password");
       
       
       String sql="insert into dept(no,dname,loc) "
    		     +" values("+no+",'"+dname+"','"+loc+"')";
       out.print(sql);
       
       //1.db접속-1.드라이버 로딩
        Class.forName(driver);
       //2.연결맺기
        Connection conn = DriverManager.getConnection(url, user, password);
       //3.쿼리객체생성
        Statement stmt=conn.createStatement();
       //4.쿼리문 실행
       try{
    	   ResultSet rs=stmt.executeQuery("select count(*) from dept where no="+no);
/*     	   out.print("no="+no);
    	   out.print("sql="+sql); */
    	   //커서의 시작위치는 0번째 행이므로 
    	   //rs.next()메소드를 이용하여 1번째 행으로 이동 후 처리해야함. 
    	   rs.next();
    	   if(rs.getInt(1)>0){//입력한코드가 존재할때 처리부분.
    		   out.print("<script>");
    		   out.print("alert('입력한 부서번호는 존재하는 번호입니다.');");
    		   out.print("history.back();");
    		   out.print("</script>");
    	   }else{//입력한 코드가 없을 때 처리 부분시작.
    	  stmt= conn.createStatement();
          int result = stmt.executeUpdate(sql);
         if(result>0){
        	 stmt=conn.createStatement();
        	  rs = stmt.executeQuery("select * from dept order by no");
/*  -------------------------------------------------------- */        	  
    out.print("<div id='wrap'>");
	out.print("<div id='header'>");
	out.print("<span class='logo'><img src='../img/logo.png' alt='사이트로고'></span>");
	out.print("<h1>도서 정보 조회</h1>");
	out.print("<h2>조회 결과</h2>");
	out.print("</div>");
	out.print("<div class='clear'></div>");
	out.print("<div id='content'>");
	out.print("<table id='deptTable'>");
	out.print("<tr><th class='no'>부서번호</th>");
	out.print("<th class='dname'>부서명</th>");
	out.print("<th class='loc'>위치</th>");       	    
/*  -------------------------------------------------------- */ 
             int row=0;
        	 while(rs.next()){
        		 if(row++%2!=0){
        				out.print("<tr class='odd'>");
        				}else{
        				out.print("<tr class='even'>");
        				}
        		 out.print("<td class='no'>");
        		 out.print(rs.getInt(1)+"</td><td class='dname'>");
        		 out.print(rs.getString(2)+"</td><td class='loc'>");
        		 out.print(rs.getString(3)+"</td></tr>");
        	 }
           out.print("</table>");
 /*  -------------------------------------------------------- */          		 
        			out.print("</div>");/* content끝. */
        			out.print("<div class='clear'></div>");
        			out.print("<div id='footer'><span>2018. choongang All rights reserved.");
        			out.print("</span></div>");/* footer */
        			out.print("</div>");/* wrap끝.  */       		 
/* ------------------------------------------------------------- */        		 
         }else{
        	 out.print("<script>");
        	 out.print("alert('입력실패');");
        	 out.print("</script>");
         }
    	   }////입력한 코드가 없을 때 처리 부분 끝.
       }catch(Exception e){
    	   e.printStackTrace();
    	   out.print("<script>");
    	   out.print("alert('오류발생');");
    	   out.print("history.back();");//javascript의 history객체의 back()메소드
    	   out.print("</script>");
       }finally{
    	   try{
    		   stmt.close();
    		   conn.close();
    	   }catch(Exception e){}
       }
    %>
</body>
</html>