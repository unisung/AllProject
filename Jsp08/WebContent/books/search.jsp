<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .frm{
 width: 300px;
 }
 .frm fieldset{
 margin:0 auto;
 padding: 10px 40px;
 }
</style>
</head>
<body>
<div class="frm">
<div>
<!-- url 선언 -->
<c:url value="http://search.daum.net/search" var="searchUrl">
  <c:param name="w" value="writer"></c:param>
  <c:param name="q" value="세익스피어"></c:param>
</c:url>
<fieldset>
<legend>통합검색</legend>
  <a href="${searchUrl}">검색</a></li>
</fieldset>
</div>
<div>
<form action="bookList.jsp">
  <fieldset>
   <legend>저자를 입력하세요</legend>
    <p>
    <label>
    <input type="text" name="writer">
    </label>
    </p>
    <p>
    <input type="submit" value="조회">
    </p>
  </fieldset>
</form>
</div>
</div>
</body>
</html>