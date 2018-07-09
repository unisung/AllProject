<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String pageName = request.getParameter("pageName");
    if(pageName==null){
    	pageName="home";
    }
%>
<link href="layout.css" rel="stylesheet">
</head>
<body>
    <div id="wrap">
         <div id="header">
         <span class="logo"><img src="../img/logo.png" alt="사이트 로고"></span>
         <h1>메인페이지 화면</h1>
         <h2>레이아웃 - 2단 레이아웃</h2>
         <div class="clear"></div>
         </div>
         <div id="content">
            <div id="mainContent">
             <jsp:include page='<%=pageName+".jsp"%>'></jsp:include>
            </div>
            <div id="subContent">
             <jsp:include page="navi.jsp"></jsp:include>
            </div>
         </div>
         <div class="clear"></div>
         <div id="footer">
            <span>2018.Choongang CSS All rights Reserved.</span>
         </div>
    </div>
</body>
</html>