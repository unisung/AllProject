<%@page import="java.util.Calendar"%>
<%@page import="dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

     LoginDto login = new LoginDto();
     login.setId("hong");
      
    session.setAttribute("login", login);
    LoginDto user = (LoginDto)session.getAttribute("login");
    
    Calendar cal = Calendar.getInstance();
    int tyear = cal.get(Calendar.YEAR);
    int tmonth = cal.get(Calendar.MONTH)+1;
    int tday = cal.get(Calendar.DATE);
    int thour = cal.get(Calendar.HOUR_OF_DAY);//24시
    int tmin = cal.get(Calendar.MINUTE);
%>
<form action="calwriteafter.jsp" method="post">
<table border=1>
<col width="200"/><col width="500"/>
<tr>
<td>아이디</td>
<td>
<%=user.getId()%><input type="hidden" name="id" value='<%=user.getId()%>'>
</td>
</tr>
<td>제목</td>
<td>
<input type="text" name="title" size="60">
</td>
</tr>
<tr>
<tr>
<td>일정</td>
<td>
<select name='year'>
<%
for(int i=tyear-5;i<tyear+6;i++){
%>
<option <%=year.equals(i+"")?"selected='selected'":""%> value="<%=i%>"><%=i%></option>
<%
}
%>	
</select>년
 <select name='month'>
<%
for(int i=1;i<=12;i++){
%>
<option <%=month.equals(i+"")?"selected='selected'":""%> value="<%=i%>"><%=i%></option>
<%
}
%>	
</select>월
<select name='day'>
<%
for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++){
%>
<option <%=day.equals(i+"")?"selected='selected'":""%> value="<%=i%>"><%=i%></option>
<%
}
%>	
</select>일
<select name='hour'>
<%
for(int i=1;i<24;i++){
%>
<option <%=(thour+"").equals(i+"")?"selected='selected'":""%> value="<%=i%>"><%=i%></option>
<%
}
%>	
</select>시
<select name='min'>
<%
for(int i=1;i<60;i++){
%>
<option <%=(tmin+"").equals(i+"")?"selected='selected'":""%>  value="<%=i%>"><%=i%></option>
<%
}
%>	
</select>분
</td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="20" cols="60" name="content"></textarea></td>
</tr>
<tr>
<td colspan=2><input type="submit" value="글쓰기"/></td>
</tr>
</table>
</form>    
<%
 String url = String.format("%s?year=%s&month=%s", "calendar.jsp",year,month);
%>    
<a href='<%=url%>'>일정보기</a>
</body>
</html>