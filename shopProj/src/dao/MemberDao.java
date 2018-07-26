package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Member;
import service.MemberService;

public class MemberDao implements MemberService {
  private static MemberDao instance;
  private MemberDao() {}
  public static MemberDao getInstance() {
	  if(instance==null)instance = new MemberDao();
	  return instance;
  }
  Connection conn=null;
  DataSource ds=null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  Statement stmt=null;
  
  private Connection getConnection() {
	 
	  try {
		  Context init = new InitialContext();
		  ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		  conn=ds.getConnection();
	  }catch(Exception e) {e.printStackTrace();}
	  return conn;
  }//getConnection() 메소드 끝.
  
  	//id 체크
	@Override
	public int userCheck(String id) {
       int result =0;
       try {
    	    pstmt = 
    	       getConnection().prepareStatement("select count(*) from member where id=?");
    	    pstmt.setString(1, id);
    	    rs = pstmt.executeQuery();
    	    if(rs.next())
    	    	result = rs.getInt(1);
       }catch(Exception e) {
    	   e.printStackTrace();
       }finally {
    	   close(conn,pstmt,rs);
       }
		return result;
	}//userCheck(String id) 메소드 끝.

	@Override
	public int emailCheck(String email) {
		int result =0;
	       try {
	    	    pstmt = 
	    	       getConnection()
	    	       .prepareStatement("select count(*) from member where email=?");
	    	    pstmt.setString(1, email);
	    	    rs = pstmt.executeQuery();
	    	    if(rs.next())
	    	    	result = rs.getInt(1);
	       }catch(Exception e) {
	    	   e.printStackTrace();
	       }finally {
	    	   close(conn,pstmt,rs);
	       }
			return result;
	}//emailCheck(String email) 메소드 끝.

	@Override
	public int insertMember(Member member) {

		return 0;
	}

	@Override
	public Member selectMember(String memberId) {

		return null;
	}

	@Override
	public int updateMember(Member member) {

		return 0;
	}

	@Override
	public int deleteMember(String id) {

		return 0;
	}

	@Override
	public ArrayList<Member> getMemberList() {

		return null;
	}

	@Override
	public int userCheck(String id, String password) {

		return 0;
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
