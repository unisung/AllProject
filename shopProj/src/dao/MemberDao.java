package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	 //회원가입 처리 메소드
	@Override
	public int insertMember(Member member) {
		 int result = 0;
		 String sql = " insert into member(id, password, name, birth, zipno, " 
		            + " address1, address2, tel1, tel2, tel3, email, regdate, "
		            + " use_flag) "
		            + " values ( ?, ?, ?,?,?,?,?, ?, ?,?, ?,sysdate,'0')";
		             //use_flag=가입된 회원 0, 탈퇴한 회원이면 1,
		try {
			 int i=0;
			 conn = getConnection();
			 //자동 커밋 비활성화 처리
			 conn.setAutoCommit(false);
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(++i, member.getId());
			 pstmt.setString(++i, member.getPassword());
			 pstmt.setString(++i, member.getName());
			 pstmt.setDate(++i, new java.sql.Date(member.getBirth().getTime()));
			 pstmt.setString(++i, member.getZipno());
			 pstmt.setString(++i, member.getAddress1());
			 pstmt.setString(++i,member.getAddress2());
			 pstmt.setString(++i, member.getTel1());
			 pstmt.setString(++i, member.getTel2());
			 pstmt.setString(++i, member.getTel3());
			 pstmt.setString(++i, member.getEmail());

			 result = pstmt.executeUpdate();
			 conn.commit();//커밋처리
		}catch(Exception e) {
			try { conn.rollback();//오류발생시 롤백처리 
			 }catch(Exception e1) {}
			 e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);//자동 커밋 으로 다시 되돌리기.
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(conn, pstmt);
		}
		return result;
	}//insertMember(Member member) 메소드 끝.

	 //id에 해당하는 회원 정보 조회
	@Override
	public Member selectMember(String memberId) {
        Member member = new Member();
        try {
        	  String sql = "select * from member where id=?";
        	  pstmt = getConnection().prepareStatement(sql);
        	  pstmt.setString(1, memberId);
        	  rs = pstmt.executeQuery();
        	  if(rs.next()){
        		  int i=0;
        		  member.setId(rs.getString(++i));
        		  member.setPassword(rs.getString(++i));
        		  member.setName(rs.getString(++i));
        		  member.setBirth(rs.getDate(++i));
        		  member.setZipno(rs.getString(++i));
        		  member.setAddress1(rs.getString(++i));
        		  member.setAddress2(rs.getString(++i));
        		  member.setTel1(rs.getString(++i));
        		  member.setTel2(rs.getString(++i));
        		  member.setTel3(rs.getString(++i));
        		  member.setEmail(rs.getString(++i));
        		  member.setRegdate(rs.getDate(++i));
        		  member.setUse_flag(rs.getString(++i).charAt(0));
        	  }
        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	close(conn, pstmt, rs);
        }
		return member;
	}//selectMember(String memberId) 메소드 끝.

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

	//로그인 id,패스워드 확인 메소드
	@Override
	public int userCheck(String id, String password) {
		int result =-1;
		try {
			 String sql = "select password from member where id=?";
			 pstmt = getConnection().prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {//id가 있는 경우
				 String dbPass = rs.getString(1);
				 String inPutPass = password;
				 if(inPutPass.equals(dbPass)){//id와 패스워드 둘다 맞는 경우
					 result = 1;
				 }else {//id는 있지만 비번이 다른 경우
					 result = 0; 
				 }
			 }else {//id가 없는 경우
				 result=-1;
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return result;
	}//userCheck(String id, String password) 메소드 끝.
	
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
