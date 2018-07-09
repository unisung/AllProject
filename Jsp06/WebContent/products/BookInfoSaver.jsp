<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:useBean id="pinfo" class="ch01.BookInfo" scope="request"></jsp:useBean>
   <jsp:setProperty property="code" name="pinfo" value="50001"/>
   <jsp:setProperty property="name" name="pinfo" value="의뢰인"/>
   <jsp:setProperty property="price" name="pinfo" value="9000"/>
   <jsp:setProperty property="page" name="pinfo" value="704"/>
   <jsp:setProperty property="writer" name="pinfo" value="존 그리샴"/>
   <hr>
    <h3>책정보가 저장되었습니다.</h3>
    <hr>
    <h4>제품 개략 정보</h4>
    <jsp:include page="ProductInfo.jsp"></jsp:include>
</body>
</html>