<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalDao"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<%!
	public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
}
%>
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String hour = request.getParameter("hour");
String min = request.getParameter("min");

String mdate = year+two(month)+two(day)+two(hour)+two(min);

CalDao dao = CalDao.getInstance();
boolean isS = dao.writeCalendar(new CalendarDto(id,title,content,mdate));
String url = String.format("%s?year=%s&month=%s","calendar.jsp",year,month);
if(isS){
%>
<script>
 alert('일정을 입력하였습니다.');
 location.href='<%=url%>';
</script>
<%	
}else{
%>
<script>
alert('일정 입력 실패');
location.href='<%=url%>';
</script>	
<%
}
%>