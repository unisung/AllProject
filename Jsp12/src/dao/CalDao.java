package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CalendarDto;

public class CalDao {
	public static CalDao instance;
	  Connection conn=null;
	  DataSource ds=null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  Statement stmt=null;
	 private CalDao() {}
	 public static CalDao getInstance() {
		 if(instance==null) instance = new CalDao();
		 return instance;
	 }
	 
	private Connection getConnection() {
		  try {
			  Context init = new InitialContext();
			  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			  conn=ds.getConnection();
		  }catch(Exception e) {e.printStackTrace();}
		  return conn;
	  }//getConnection() 메소드 끝.
	  
	   //
	 public List<CalendarDto> getDayList(String id, String dates){
		 List<CalendarDto> list = new ArrayList<>();
		 String sql = "select seq,id,title,content,mdate,regdate "
		 		    + " from calendar where id=? and substr(mdate,1,8)=? "
		 		    + " order by mdate";
		 try {
			   pstmt = getConnection().prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, dates);
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   int i=0;
				   CalendarDto dto = new CalendarDto(
						   rs.getInt(++i),
						   rs.getString(++i),
						   rs.getString(++i),
						   rs.getString(++i),
						   rs.getString(++i),
						   rs.getDate(++i)
						   );
				   list.add(dto);
			   }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 close(conn,pstmt,rs);
		 }
		return list;
	}
	
   //
	 public List<CalendarDto>  getCalendarList(String id, String dates){
		 List<CalendarDto> cdtos = new ArrayList<>();
		 String sql = "select seq,id,content,mdate,regdate " + 
		 		"  from (" + 
		 		"  select row_number() over( partition by substr(mdate,1,8) order by mdate asc) rn, " + 
		 		"  seq,id,title,content,mdate,regdate from CALENDAR where id=? and substr(mdate,1,6) =?) where rn between 1 and 5";
	     try {
	    	   pstmt = getConnection().prepareStatement(sql);
	    	   pstmt.setString(1, id);
	    	   pstmt.setString(2, dates);
	    	   rs = pstmt.executeQuery();
	    	   
	    	   while(rs.next()) {
	    		   int i=0;
	    		   CalendarDto dto = new CalendarDto();
	    		   dto.setSeq(rs.getInt(++i));
	    		   dto.setId(rs.getString(++i));
/*	    		   dto.setTitle(rs.getString(++i));*/
	    		   dto.setContent(rs.getString(++i));
	    		   dto.setMdate(rs.getString(++i));
	    		   dto.setRegdate(rs.getDate(++i));
	    		   cdtos.add(dto);
	    	   }
	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }finally {
	    	 close(conn,pstmt,rs);
	     }
	     return cdtos;
	 }//getCalendarList() 메소드 끝.
	 
	 
	 //
	 public boolean writeCalendar( CalendarDto dto){
		 int result=0;
		 String sql = "insert into calendar(seq,id,title,content,mdate,regdate) "
		 		    + " values(calendar_seq.nextval,?,?,?,?,sysdate)";
		 try {
			  pstmt = getConnection().prepareStatement(sql);
			  pstmt.setString(1, dto.getId());
			  pstmt.setString(2, dto.getTitle());
			  pstmt.setString(3, dto.getContent());
			  pstmt.setString(4, dto.getMdate());
			  result = pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 close(conn,pstmt);
		 }
		 
		 return result>0?true:false;
	 }//writeCalendar() 메소드 끝.
		
		void close(Connection conn, Statement pstmt, ResultSet rs) {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		void close(Connection conn, Statement pstmt) {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	 
}
