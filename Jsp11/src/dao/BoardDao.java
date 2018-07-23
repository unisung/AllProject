package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Board;

/**
 * Singletone -생성자를 private로 처리하여 
 * 외부에서 생성자 호출 못하게 처리, 자신타입의 instance필드를 호출(getInstance)
 * */
public class BoardDao {
   //필드
 private static BoardDao instance;	
  //
 Connection conn=null;
 PreparedStatement pstmt=null;
 ResultSet rs = null;
 
   //생성자
 private BoardDao() {}
   //메소드
 public static BoardDao getInstance() {
	 if(instance==null) instance = new BoardDao();
	 return instance;
 }//getInstance()메소드 끝.
 
 public Connection getConnection() {
	 Connection conn=null;
	 try {
		 Context init = new InitialContext();
		 DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		 conn = ds.getConnection();
	 }catch(Exception e) {
		 System.out.println(e.getMessage());
	 }
	 return conn;
  }//getConnection() 메소드 끝.
 
 //글 입력
 public void insert(Board board){
	int result =-1;
	//글번호
	int num = board.getNum();
	//글 그룹번호
	int ref=board.getRef();
	//글 그룹내 순선
	int re_step=board.getRe_step();
	//글 들여쓰기 
	int re_level=board.getRe_level();
	int number=0;
	String sql="";
	try {
		 conn=getConnection();
		 pstmt = conn.prepareStatement("select max(num) from board");//현재까지의 글 번호 조회
		 rs = pstmt.executeQuery();
		 if(rs.next()) number=rs.getInt(1)+1;//현재 글번호 중 최대값 +1 => 새글 번호
		 else
		  number=1;//결과값이 없으면(null) - 글이 없음 1번 부터 시작
		 pstmt.close();
		 //글 입력
		 if(num!=0) {//신규글이 아님(답변글) 
			 sql="update board set re_step=re_step+1 where ref=? and re_step > ?";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setInt(1, ref);
			 pstmt.setInt(2, re_step);
			 pstmt.executeUpdate();
			 re_step=re_step+1;
			 re_level=re_level+1;
			 pstmt.close();
		 }else{//신규글
			 ref=number;//새로 부여받은 글번호
			 re_step=0;//원글의 step은 0
			 re_level=0;//원글의 들여쓰기 0
		 }
		    //입력처리
			 sql 
			  ="insert into "
			  +" board(num,writer,subject,content,email,passwd,"
			  +" reg_date,ref,re_step,re_level,ip) "
			  +" values(?,?,?,?,?,?,sysdate,?,?,?,?)";
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setInt(1, number);
			 pstmt.setString(2, board.getWriter());
			 pstmt.setString(3, board.getSubject());
			 pstmt.setString(4, board.getContent());
			 pstmt.setString(5,board.getEmail());
			 pstmt.setString(6, board.getPasswd());
			 pstmt.setInt(7,ref);//ref==number;
			 pstmt.setInt(8, re_step);//re_step=0;
			 pstmt.setInt(9, re_level);//re_level=0;
			 pstmt.setString(10, board.getIp());
			 
			 result = pstmt.executeUpdate();

	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		close(conn,pstmt,rs);
	}
 }//insert(Board board) 메소드 끝.
 
 //close메소드
 private void close(Connection conn, PreparedStatement pstmt,ResultSet rs) {
	 try {
		  if(rs!=null) rs.close();
		  if(pstmt!=null)pstmt.close();
		  if(conn!=null)conn.close();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
 }//close() 메소드 끝.
 private void close(Connection conn, PreparedStatement pstmt) {
	 try {
		  if(pstmt!=null)pstmt.close();
		  if(conn!=null)conn.close();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
 }//close() 메소드 끝.
}
