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
import dto.LoginDto;

public class UserDao {
	public static UserDao instance;
	  Connection conn=null;
	  DataSource ds=null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  Statement stmt=null;
	 private UserDao() {}
	 public static UserDao getInstance() {
		 if(instance==null) instance = new UserDao();
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
	  
	public LoginDto login(String id, String password){
		LoginDto dto=null;
		try {
			 String sql = "select name,pwd from caluser where id=?";
			 pstmt = getConnection().prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
		     if(rs.next()) {
		    	 if(password.equals(rs.getString(2))) {
		    		 dto=new LoginDto();
		    		 dto.setId(id);
		    		 dto.setName(rs.getString(1));
		    	 }
		     }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return dto;
	}
	
	
		
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
