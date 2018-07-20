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
#loginForm{
 position: relative;
 width: 50%;
 border: 1px solid #999;
 margin: 0 auto;
 padding: 20px;
}
#loginForm label{
 display: block;
}
#loginForm input{
 width: 96%;
}
#loginForm input[type="text"],#loginForm input[type="password"]{
 padding: 2%;
 color:#666;
 border: none;
 border-right: 1px solid #999;
 border-bottom: 1px solid #999;
}
#loginForm input[type="submit"]{
 width: 100%;
 background: #559;
 border: none;
 color:#fff;
 padding: 10px;
}
#loginForm input[type="submit"]:hover{
background: #99c;
cursor: pointer;
}
</style>
</head>
<body>
<div id="wrap">
<div  id="header">
 <span class="logo"><img src="../img/logo.png" alt="사이트 로고"></span>
 <h1>로그인 메뉴</h1>
 <h2>로그인 폼</h2>
 <div class="clear"></div>
</div>
<div id="content">
  <form action="loginPro.jsp" method="get" id="loginForm">
   <fieldset>
    <legend>로그인</legend>
    <p>
     <label>
      id:
      </label>
     <input type="text" name="id" id="id" autofocus>
    </p>
    <p>
     <label>
      passwrord:
      </label>
      <input type="password" name="password" id="password"> 
    </p>
    <p>
    <input type="submit" value="확인">
    </p>
   </fieldset>
  </form>
 </div><!-- content 끝.  -->
 <div id="footer">
 <span> 2018. Choongang .</span>
 </div> 
</div><!--wrap끝.  -->  
</body>
</html>