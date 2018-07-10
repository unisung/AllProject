<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:set var="greeting" value="How Are You?"/>
  원래의 문자열:${greeting}<br>
  모두 대문자로:${fn:toUpperCase(greeting)}<br>
  모두 소문자로:${fn:toLowerCase(greeting)}<br>
  Are의 위치는? ${fn:indexOf(greeting,"Are")}<br>
  Are를 Were로 바꾸기${fn:replace(greeting,"Are","Were")}<br>
  문자열의 길이:${fn:length(greeting)}<br>
  특정위치의 문자열 리턴:${fn:substring(greeting,1,5)}<br>
  문자열 출력:${fn:substringAfter(greeting,"Are")}<br>
           ${fn:substringBefore(greeting,"Are")}<br> 
  문자열시작여부 ${fn:startsWith(greeting,"How")}<br>
  문자열종료여부 ${fn:endsWith(greeting,"You?")}<br> 
  문자열 포함여부 ${fn:contains(greeting, "A")}<br>
  문자열 자르기 ${fn:split(greeting," ")}<br>
  문자열 합치기 ${fn:join(greetig,",")}<br>
</body>
</html>