<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	public String showDate(String year, String month, String date){
	return String.format("오늘은 %s년 %s월 %s일 입니다.<br>", year,month,date);
}
%>
<%
	String year=request.getParameter("year");
    String month=request.getParameter("month");
    String day=request.getParameter("day");
    String sss=showDate(year,month,day);
%>
<h2>오늘은 <%=year %>년 <%=String.format("%2d",Integer.parseInt(month)) %>월
    <%=String.format("%2d",Integer.parseInt(day))%>일</h2>
<h2><%=showDate(year, month, day)%></h2>
<a href="calendar.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>">칼렌다로..</a>
</body>
</html>