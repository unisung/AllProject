<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* 달력 생성 */
	Calendar cal = Calendar.getInstance();//칼랜다 객체
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	int year=0;
	int month=0;
	
	year = sYear==null?cal.get(Calendar.YEAR):Integer.parseInt(sYear);
	month = sMonth==null?cal.get(Calendar.MONTH)+1:Integer.parseInt(sMonth);
	
	//
	cal.set(Calendar.YEAR,year);
	cal.set(Calendar.MONTH,month-1);
	cal.set(Calendar.DATE,1);
	
	//월>12, 월<1
	if(month<1){
		month=12;
	    year--;
	}else if(month>12){
		month=1;
		year++;
	}
    
	//달력의 시작은 1일의 요일로 부터 시작
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	String s=String.format("%d년 %d월",year,month);
	//
	int lastDay =cal.getActualMaximum(Calendar.DAY_OF_MONTH);//해당월의 마직막 날짜
	String pPs = String.format("<a href='calendar.jsp?year=%d&month=%d'><img src='../image/btn_pre_p11.gif'/></a>",year-1,month);
	String ps = String.format("<a href='calendar.jsp?year=%d&month=%d'><img src='../image/prec.gif'/></a>",year,month-1);
	String ns = String.format("<a href='calendar.jsp?year=%d&month=%d'><img src='../image/next.gif'/></a>",year,month+1);
	String nNs = String.format("<a href='calendar.jsp?year=%d&month=%d'><img src='../image/btn_next_p11.gif'/></a>",year+1,month);
	
%>
<table border=1>
<tr>
<td colspan=7 align="center">
 <%=pPs%><%=ps%><%=s%><%=ns%><%=nNs%>
</td>
</tr>
<tr>
<th>일</th>
<th>월</th>
<th>화</th>
<th>수</th>
<th>목</th>
<th>금</th>
<th>토</th>
</tr>
<tr>
<%
 for(int i=1;i<dayOfWeek;i++){
 %><td>&nbsp;</td>	 
 <%
 }
 for(int i=1;i<=lastDay;i++){
	 String bgColor="#ffffff";
	 if((dayOfWeek-1+i)%7==1)bgColor="#ff5a5a";
	 else if((dayOfWeek-1+i)%7==0)bgColor="#12eaff";
	 String curl=String.format("calWrite.jsp?year=%d&month=%d&day=%d",year,month,i);
	 
	%>
	<td bgColor="<%=bgColor%>"><a href=<%=curl%>><%=String.format("%d",i)%></a></td>
   <%
   if((dayOfWeek-1+i)%7==0){
   %>
   <tr></tr>
<%}
 }
for(int i=0;i<(7-(lastDay-1+dayOfWeek)%7)%7;i++){
	System.out.print((7-(lastDay-1+dayOfWeek)%7)%7);
%>
<td>&nbsp;</td>	
<%
} 
 %>
 </tr>
</table>

</body>
</html>