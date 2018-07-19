package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
  Connection conn=null;
  PreparedStatement pstmt=null;
  Statement stmt=null;
  ResultSet rs=null;
  
  private Connection getConnection() {
	  Connection conn=null;
	  DataSource ds=null;
	  try {
		  Context init = new InitialContext();
		  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		  conn=ds.getConnection();
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  return conn;
  }//getConnection() 끝.
  //id체크 메소드
  public int userCheck(String id){
	  int cnt=-1;
	  try {
		  pstmt = getConnection().prepareStatement("select count(*) from member where id=?");
		  pstmt.setString(1, id);
		  rs=pstmt.executeQuery();
		  if(rs.next())
			  cnt=rs.getInt(1);//count(*)함수는 0,아니면 숫자(null값이 없음)
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  return cnt;
  }//userCheck() 끝.
  
}
