package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DaoManger {
	  Connection conn=null;
	  DataSource ds=null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  Statement stmt=null;
	  
	  protected Connection getConnection() {
		  try {
			  Context init = new InitialContext();
			  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			  conn=ds.getConnection();
		  }catch(Exception e) {e.printStackTrace();}
		  return conn;
	  }//getConnection() 메소드 끝.
	  

		
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
