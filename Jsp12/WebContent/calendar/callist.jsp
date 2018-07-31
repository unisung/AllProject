<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.LoginDto"%>
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
     public String toDates(String mdate){
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	 String s = mdate.substring(0,4)+"-"+mdate.substring(4,6)+"-"+mdate.substring(6,8)
			  +" "+mdate.substring(8,10)+":"+mdate.substring(10,12)+":00";
	
	 System.out.println(s);
	 Timestamp d =Timestamp.valueOf(s);
	 
	 return sdf.format(d);
}
    
    /* 일정 <a>태그를 사용하여 등록된 일정으로 이동 */
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
	 String url = "calwrite2.jsp";
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
	 if(msg.length()>=15){
		 s=msg.substring(0,15);
		 s+="...";
	 }else{
		 s=msg.trim();
	 }
	 return s;
 }
 
 /* 일정 테이블 생성 */   
public String makeTable(int year,int month,int day, List<CalendarDto> lists){
	String s="";
	String dates=(year+"")+two(month+"")+two(day+"");
	s="<table>";
	s+="<col width='98'/>";
	for(CalendarDto l:lists){
		if(!l.getMdate().substring(0,8).equals(dates)){
			s+="<tr bgcolor='yellow'>";
			s+="<td>";
			
			s+="<a href='caldetail.jsp?seq="+l.getSeq()+"'>";
			s+="<font style='font-size:8;color:red'>";
			s+=dot3(l.getTitle());
			s+="</font></a></td></tr>";
		}
	}
	s+="</table>";
	return s;
}
%>
<%
   LoginDto user = (LoginDto)session.getAttribute("login");
   
System.out.println(user.getId());
   
	/* 달력 생성 */
	Calendar cal = Calendar.getInstance();//칼랜다 객체
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String dates = year+two(month)+two(day);
	System.out.println(dates);
	CalDao dao = CalDao.getInstance();
	List<CalendarDto> cdtos = dao.getDayList(user.getId(),dates);
%>		
<table border=1>
<col width="100"/><col width="200"/><col width="450"/><col width="50"/>
<tr bgcolor="#09bbaa">
<td>번호</td><td>시간</><td>제목</td><td>삭제</td>
</tr>
<%
 for(int i=0;i<cdtos.size();i++){
	 CalendarDto cald = cdtos.get(i);
%>
<tr>
<td><%=i+1 %></td>
<td><%=toDates(cald.getMdate()) %></td>
<td><a href='caldetail.jsp?seq=<%=cald.getSeq()%>'><%=cald.getTitle()%></a></td>
<td>
<form action="caldel.jsp" method="post">
<input type="hidden" name='seq' value="<%=cald.getSeq()%>"/>
<input type="submit" value='일정삭제'/>
</form>
</td>
</tr>
<%
}
%>
</table>
<%
String url = String.format("%s?year=%s&month=%s","calendar.jsp",year,month);
%>
<a href='<%=url%>'>일정보기</a>
</body>
</html>