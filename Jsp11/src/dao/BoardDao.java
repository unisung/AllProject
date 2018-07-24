package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
 public int insert(Board board){
	//입력처리 결과 받는 변수
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
			 //쿼리 객체 생성
			 pstmt=conn.prepareStatement(sql);
			 //바인딩 변수 에 값 설정
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
			 
			 //입력결과 받기
			 result = pstmt.executeUpdate();

	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		close(conn,pstmt,rs);
	}//finally 끝.
	return result;
 }//insert(Board board) 메소드 끝.
 
 //전체 글 건수 확인
 public int  getBoardCount(){
	 int count=0;
	try {
		  conn=getConnection();
		  pstmt=conn.prepareStatement("select count(*) from board");
		  rs=pstmt.executeQuery();
		  if(rs.next())
			  count =rs.getInt(1);	
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		close(conn,pstmt,rs);
	}
	 return count;
 }// getBoardCount() 메소드 끝.
 
 //게시글 리스트 조회
 public List<Board> getBoards(int startRow,int endRow){
	 List<Board> list=new ArrayList<>();
	 try {
		 String sql="select * " + 
		 		   " from " + 
		 		   " (select rownum rn, a.* " + 
		 		   "  from " + 
		 		   " (select * from board order by ref desc, re_step asc) a) " + 
		 		   " where rn between ? and ? ";
		 conn=getConnection();
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, startRow);
		 pstmt.setInt(2, endRow);
		 rs = pstmt.executeQuery();
		 while(rs.next()) {
			 int i=1;
			 Board board = new Board();
			 board.setNum(rs.getInt(++i)); 
			 board.setWriter(rs.getString(++i));
			 board.setSubject(rs.getString(++i));
			 board.setContent(rs.getString(++i));
			 board.setEmail(rs.getString(++i));
			 board.setReadcount(rs.getInt(++i));
			 board.setPasswd(rs.getString(++i));
			 board.setRef(rs.getInt(++i));
			 board.setRe_step(rs.getInt(++i));
			 board.setRe_level(rs.getInt(++i));
			 board.setIp(rs.getString(++i));
			 board.setReg_date(rs.getDate(++i));
			 
			 list.add(board);
		 }
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn, pstmt, rs);
	 }	 
	 return list;
 }//getBoards(int startRow,int endRow) 메소드 끝.
 
 //번호에 해당하는 글 내용(content) 조회
 public Board getBoard(int num){
	 //updateCount(num);
	 Board board = null;
	 String sql ="select * from board where num=?";
	 try {
		  conn=getConnection();
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, num);
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  int i=0;
			  board = new Board();
			  board.setNum(rs.getInt(++i));
			  board.setWriter(rs.getString(++i));
			  board.setSubject(rs.getString(++i));
			  board.setContent(rs.getString(++i));
			  board.setEmail(rs.getString(++i));
			  board.setReadcount(rs.getInt(++i));
			  board.setPasswd(rs.getString(++i));
			  board.setRef(rs.getInt(++i));
			  board.setRe_step(rs.getInt(++i));
			  board.setRe_level(rs.getInt(++i));
			  board.setIp(rs.getString(++i));
			  board.setReg_date(rs.getDate(++i));
		  }	  
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn,pstmt,rs);
	 }
	 return board;
 }// getBoard(int num) 메소드 끝.
 
 //조회 건수 증가
 public void updateCount(int num){
	String sql ="update board set readcount=readcount+1 where num=?";
	try {
		conn=getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		close(conn,pstmt);
	}
 }//updateCount(int num) 메소드 끝.
 
 //수정 처리 메소드
 public int updateBoard(Board board) {
	 int result=0;
	 String sql ="update board set subject=?,email=?,content=? where num=?";
	 String sql2="select passwd from board where num=?";
	try {
	     conn = getConnection();
	     //비번 조회
	     pstmt =conn.prepareStatement(sql2);
	     pstmt.setInt(1, board.getNum());
	     rs = pstmt.executeQuery();
	     if(rs.next()) {
	    	 String inputPassword = board.getPasswd();//파라미터로 넘어온 패스워드
	    	 String dbPassword = rs.getString(1);//해당 글번호로 조회한 패스워드
	    	  //비번이 같으면 update처리
	    	 if(inputPassword.equals(dbPassword)) {	    		 
			     pstmt = conn.prepareStatement(sql);
			     pstmt.setString(1, board.getSubject());
			     pstmt.setString(2, board.getEmail());
			     pstmt.setString(3, board.getContent());
			     pstmt.setInt(4, board.getNum());
			     //update성공하면 1row의 처리결과값 인 1이 result에 저장, 실패하면 0
				 result = pstmt.executeUpdate();
	    	 }else//비번이 다르면 result값을 -1로 
	    		result =-1;
	    }
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		close(conn,pstmt,rs);
	}
	 return result;
 }//updateBoard(Board board) 메소드 끝.
 
 //게시글 삭제 메소드
 public int  deleteBoard(int num,String passwd){
	 int result =-1;
	 String sqlPass = "select passwd from board where num=?";
	 String sqlDel = "delete board where num=?";
	 try {
	       conn = getConnection();
	       pstmt = conn.prepareStatement(sqlPass);
	       pstmt.setInt(1, num);
	       rs = pstmt.executeQuery();
	       if(rs.next())
	    	   if(passwd.equals(rs.getString(1))) {
	    		   pstmt = conn.prepareStatement(sqlDel);
	    		   pstmt.setInt(1, num);
	    		   //삭제 성공 result=1,실패 result=0
	    		   result = pstmt.executeUpdate();	    		   
	    	   }else
	    		   result =-1;//비번이 틀리면 -1
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn,pstmt,rs);
	 }
	 return result;
 }//deleteBoard(int num,String passwd) 메소드 끝.
 
 //좋아요/싫어요
 public int updateFavor(int num, String ip, String id, String option){
	 int result = 0;
	 String sql = "insert into favorHate values(?,?,?,?,?)";
	 try {
		  conn = getConnection();
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, num);
		  pstmt.setString(2,ip);
		  pstmt.setString(3, id);
		  
		  if(option.equals("1")) {//좋아요
			  pstmt.setInt(4,1);
			  pstmt.setInt(5,0);
		  }
		  else {//싫어요
			  pstmt.setInt(4, 0);
			  pstmt.setInt(5, 1);
		  }
		  result = pstmt.executeUpdate();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn,pstmt);
	 }
	 return result;
 }//updateFavor()메소드
 
 //좋아요 건수 출력
 public int  getFavorCnt(int num) {
	 int cnt =0;
	 String sql ="select sum(favor) from favorHate where num=?";
	 try {
		 conn=getConnection();
		 pstmt=conn.prepareStatement(sql);
		 pstmt.setInt(1, num);
		 rs = pstmt.executeQuery();
		 if(rs.next())
			 cnt = rs.getInt(1);
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn,pstmt,rs);
	 }
	 return cnt;
 }//getFavorCnt(int num) 메소드 끝.
 
//싫어요 건수 출력
public int  getHateCnt(int num) {
	 int cnt =0;
	 String sql ="select sum(hate) from favorHate where num=?";
	 try {
		 conn=getConnection();
		 pstmt=conn.prepareStatement(sql);
		 pstmt.setInt(1, num);
		 rs=pstmt.executeQuery();
		 if(rs.next())
			 cnt = rs.getInt(1);
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 close(conn,pstmt,rs);
	 }
	 return cnt;
}//getFavorCnt(int num) 메소드 끝.

 
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
