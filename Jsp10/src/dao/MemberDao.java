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
  
  //로그인 처리
  public int userCheck(String id, String password){
	  int result=-1;//초기 false인 상태로 초기화
	  try {
		    sql = "select password from member where id=?";//id가 없는 경우 null값이 select됨.
		    conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    rs = pstmt.executeQuery();
		    //select 결과 null이 아닌값이 조회된경우
		    if(rs.next()) {//id가 같고
		    	String dbPass = rs.getString(1);
		    	if(password.equals(dbPass)){//password가 같은 경우
		    		result=1;
		    	}else {//id는 같지만  password가 다른경우
		    		result=0;
		    	}
		    }else {//id가 존재하지 않은 경우
		    	result=-1;
		    }
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  return result;
  }//userCheck(id,password)메소드 끝.
  
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
  
  //회원정보 조회
  public Member getMember(String id){
	  Member member = null;
	  try {
		   sql = "select * from member where id=?";
		   pstmt = getConnection().prepareStatement(sql);
		   pstmt.setString(1, id);
		   rs = pstmt.executeQuery();
	       if(rs.next()) {
	    	   member = new Member();
	    	   int i=0;
	    	   member.setId(rs.getString(++i));
	    	   member.setPassword(rs.getString(++i));
	    	   member.setName(rs.getString(++i));
	    	   member.setBirth(rs.getDate(++i));
	    	   member.setZipcode(rs.getString(++i));
	    	   member.setAddress1(rs.getString(++i));
	    	   member.setAddress2(rs.getString(++i));
	    	   member.setTel1(rs.getString(++i));
	    	   member.setTel2(rs.getString(++i));
	    	   member.setTel3(rs.getString(++i));
	    	   member.setEmail(rs.getString(++i));
	       }
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  return member;
  }//getMember()메소드 끝.
  
  
}
