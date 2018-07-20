package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Member;

public class MemberDao {
  Connection conn=null;
  PreparedStatement pstmt=null;
  Statement stmt=null;
  ResultSet rs=null;
  String sql ="";
  
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
  
  //회원정보 입력
  public int insertMember(Member member) {
	  int result =-1;
	  try {
		    sql="insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
		    pstmt = getConnection().prepareStatement(sql);
		    int i=0;
		    pstmt.setString(++i, member.getId());
		    pstmt.setString(++i, member.getPassword());
		    pstmt.setString(++i, member.getName());
		    //Member의 birth타입이 java.sql.Date인 경우
		    //아래 사용
		    //pstmt.setDate(++i,   member.getBirth());
		    //java.util.Date타입 + getTime() => 'yyyy-MM-dd HH:mm:ss'
		    //Member의 birth 타입이 java.util.Date인 경우 
		    //아래 사용
		    pstmt.setDate(++i, new java.sql.Date(member.getBirth().getTime()));
		    pstmt.setString(++i, member.getZipcode());
		    pstmt.setString(++i, member.getAddress1());
		    pstmt.setString(++i, member.getAddress2());
		    pstmt.setString(++i, member.getTel1());
		    pstmt.setString(++i, member.getTel2());
		    pstmt.setString(++i, member.getTel3());
		    pstmt.setString(++i, member.getEmail());
		    result = pstmt.executeUpdate();
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  return result;
  }//insertMember()메소드 끝.
  
}
