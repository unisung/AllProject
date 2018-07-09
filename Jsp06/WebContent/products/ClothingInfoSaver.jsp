<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="pinfo" class="ch01.ClothingInfo" scope ="request"></jsp:useBean>
<jsp:setProperty property="code" name="pinfo" value="70002"/>
<jsp:setProperty property="name" name="pinfo" value="반팔 티셔츠"/>
<jsp:setProperty property="price" name="pinfo" value="15000"/>
<jsp:setProperty property="size" name="pinfo" value="M"/>
<jsp:setProperty property="color" name="pinfo" value="베이지"/>
<hr>
의류정보가 저장되었습니다.<br>
<hr>
<h3>의류 개략 정보</h3>
<jsp:include page="ProductInfo.jsp"/>
</body>
</html>