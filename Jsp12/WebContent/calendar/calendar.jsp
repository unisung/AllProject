<%@page import="dao.CalDao"%>
<%@page import="dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%   request.setCharacterEncoding("utf-8"); %>
<%!
    /* 일정 <a>태그를 상요하여 등록된 일정으로 이동 */
	public String callist(int year,int month,int day){
	String s="";
	s+=String.format("<a href='%s?year=%d&month=%d&day=%d'>"
			 ,"callist.jsp",year,month,day);
	s+=String.format("%2d",day);
	s+="</a>";
	
	return s;
}
    /* 일정등록 테이블 생성 */
 public String showPen(int year,int month,int day){
	 String s="";
	 String url = "calWrite2.jsp";
	 String image = "<img src='../image/pen.gif'/>";
	 s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
				       url,year,month,day,image		 
			 );
	 return s;
 }
    //숫자 1~9인 경우 2자리 처리
 public String two(String msg){
	 return msg.trim().length()<2?"0"+msg:msg.trim();
 }
    //메세지가 긴경우(>15) ...으로 표시
 public String dot3(String msg){
	 String s="";
	 if(msg!=null){
	  if(msg.length()>=15){
		 s=msg.substring(0,15);
		 s+="...";
	 }else{
		 s=msg.trim();
	  }
	 }
	 return s;
 }
 
 /* 일정 테이블 생성 */   
public String makeTable(int year,int month,int day, List<CalendarDto> lists){
	String s="";
	String dates=(year+"")+two(month+"")+two(day+"");
	s="<table>";
	s+="<col width='40'/>";
	for(CalendarDto l:lists){
		if(l.getMdate().substring(0,8).equals(dates)){
			s+="<tr bgcolor='green'>";
			s+="<td>";
			s+="<a href='caldetail.jsp?seq="+l.getSeq()+"'>";
			s+="<font style='font-size:10;color:red'>";
			s+=dot3(l.getTitle());
			s+="</font></a></td></tr>";
		}
	}
	s+="</table>";
	return s;
}
%>
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
	
	String id="hong";
    
	CalDao  dao = CalDao.getInstance();
	List<CalendarDto> lists = dao.getCalendarList(id,year+two(month+""));
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
<table border=1 width="500" height="600">
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
	%><td><%=callist(year, month, i)%>&nbsp;<%=showPen(year, month, i)%>
	<%=makeTable(year, month, i, lists) %></td>
   <%
   if((dayOfWeek-1+i)%7==0){
   %>
   </tr><tr>
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