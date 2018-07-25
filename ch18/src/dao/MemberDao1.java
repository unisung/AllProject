package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Member;
//싱글톤
public class MemberDao1 {
	private static MemberDao1 instance;
	private MemberDao1() {}
	public static MemberDao1 getInstance() {
		if(instance==null) instance = new MemberDao1();
		return instance;
	}
	
	private Connection getConnection() {
		 Connection conn = null;
		 DataSource ds=null;
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
			conn=ds.getConnection();	
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	 }//getConnection()메소드 끝. 
	
	//회원체크 메소드
	public int userCheck(String id,String password){
		int result=2;//정상1, 패스워드 이상0, 아이디 없을 때 2
		PreparedStatement pstmt=null;
		Connection conn=null;
		String sql = "select password from member2 where id=? and use_flag='0'";
		try {
			   conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbpass = rs.getString(1);
				System.out.println("dbpass="+dbpass);
				if(password.equals(dbpass))
					result = 1;//정상1
				else
					result = 0;//패스워드 이상0
			}else
				result = 2;//아이디 없을 때 2
			conn.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println("result="+result);
		return result;
	}
	//회원체크 메소드
	
		public int userCheck(String id){
			int result=2;//아이디가 있을 때1,  아이디 없을 때 2
			PreparedStatement pstmt=null;
			Connection conn=null;
			String sql = "select count(*) from member2 where id=?";
			try {
				   conn  = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					int cnt = rs.getInt(1);
					
					if(cnt>0)
						result = 1;//아이디가 있을 때1
					else
						result = 2;//아이디가 없을 때 2
				}
				conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
			System.out.println("result="+result);
			return result;
		}
		
		//이메일 체크 메소드
 public int emailCheck(String email){
			 int result = 2;
			 email = "%"+email+"%";//와일드카드 문자 처리
			 System.out.print("email="+email);
			 String sql = "select count(*) from member2 where email like ? and use_flag='0'";
			 ResultSet rs = null;
			 Connection conn=null;
			 PreparedStatement pstmt = null;
			 try {
				   conn = getConnection();
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, email);
				  rs = pstmt.executeQuery();
				  if(rs.next()) {// email이 존재하지 않으면:1, 존재하면 2(사용불가)
					  int cnt = rs.getInt(1);
					  if(cnt>0)
						  result = 2;//기존에 email이 존재함,
					  else
						  result = 1;//사용할수 있는 email이면 
				  }else {
					  result=1;
				  }
				  conn.close();
			 }catch(Exception e) {
				 System.out.println("오류:"+e.getMessage());
			 }
			 return result;
		 }//메소드끝.
	
 //회원가입 처리 메소드
 	public  int insertMember(Member member) {
 		Connection conn=null;
 		System.out.println("-----------------");
 		System.out.println(member.getId());
 		System.out.println(member.getPassword());
 		System.out.println(member.getName());
 		System.out.println(member.getBirth());
 		System.out.println(member.getZipno());
 		System.out.println(member.getAddress1());
 		System.out.println(member.getAddress2());
 		System.out.println(member.getEmail());
 		System.out.println("-----------------");

 		int result = 0;
 		PreparedStatement pstmt = null;
 		String sql = "insert into member2(id, password, name, birth, zipno," 
 		              + "                            address1, address2, tel1,tel2,tel3, email)"
 		              + " values(?,?,?,?,?,?,?,?,?,?,?)"; 
 		try {
 			        conn = getConnection();
 					 conn.setAutoCommit(false);
 					 pstmt = conn.prepareStatement(sql);
 					 int i=0;
 					 pstmt.setString(++i, member.getId());
 					 pstmt.setString(++i, member.getPassword());
 					 pstmt.setString(++i, member.getName());
 					 pstmt.setString(++i, member.getBirth());//date
 					 pstmt.setString(++i, member.getZipno());
 					 pstmt.setString(++i, member.getAddress1());
 					 pstmt.setString(++i, member.getAddress2());
 					 pstmt.setString(++i, member.getTel1());
 					 pstmt.setString(++i, member.getTel2());
 					 pstmt.setString(++i, member.getTel3());
 					 pstmt.setString(++i,member.getEmail());
 					 
 					  result = pstmt.executeUpdate();//
 			          conn.commit();//정상인 경우 db에 저장
 					 conn.close();		  
 		}catch(Exception e) {//비정상인 경우 rollback;
 			 try {conn.rollback();	} catch (SQLException e1) { }
 			 System.out.println(e.getMessage());
 		}finally {
 			try {conn.setAutoCommit(true);//자동 저장 기능 활성화
 			        pstmt.close();
 			        conn.close();
 		          }catch(Exception e ) {}
 		}
 		return result;
 	}//insertMember()메소드 끝.
 	
 	//회원리스트 조회 메소드
 	public ArrayList<Member> getMemberList(){
 		Connection conn=null;
 		ArrayList<Member> list = new ArrayList<>();
 		 PreparedStatement pstmt = null;
 		 String sql = "select * from member2 where use_flag='0' order by id";
 		 ResultSet rs = null;
 		try {
 			   conn = getConnection();
 			   pstmt = conn.prepareStatement(sql);
 			   rs = pstmt.executeQuery();
 			   while(rs.next()) {
 				   int i=0;
 				   //member객체 생성
 				   Member member = new Member();
 				   //member객체 속성 저장
 				    member.setId(rs.getString(++i));
 				    member.setPassword(rs.getString(++i));
 				    member.setName(rs.getString(++i));
 				    member.setBirth(rs.getString(++i));
 				    member.setZipno(rs.getString(++i));
 				    member.setAddress1(rs.getString(++i));
 				    member.setAddress2(rs.getString(++i));
 				    member.setTel1(rs.getString(++i));
 				    member.setTel2(rs.getString(++i));
 				    member.setTel3(rs.getString(++i));
 				    member.setEmail(rs.getString(++i));
 				    member.setRegdate(rs.getDate(++i));
 				   //회원정보 list에 저장
 				   list.add(member);
 			   }
 			   
 		}catch(Exception e) {
 			System.out.println(e.getMessage());
 		}finally {
 		    try {
 		    	if(rs!=null)rs.close();
 		    	if(pstmt!=null)pstmt.close();
 		    	if(conn!=null)conn.close();
 		    }catch(Exception e) {System.out.println(e.getMessage());}
 		}
 		return list;
 	}
 	//회원정보 조회
 	public Member selectMemberInfo(String memberId){
 		Connection conn=null;
 		//멤버객체 생성
 		Member member = new Member();
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		String sql = "select * from member2 where id =? and use_flag='0'";
 		try {
 			  conn = getConnection();
 			  pstmt = conn.prepareStatement(sql);
 			  pstmt.setString(1, memberId);
 			  rs = pstmt.executeQuery();
 			  if(rs.next()) {
 				  int i=0;
 				  //멤버객체 속성 저장
 				  member.setId(rs.getString(++i));
 				  member.setPassword(rs.getString(++i));
 				  member.setName(rs.getString(++i));
 				  member.setBirth(rs.getString(++i));
 				  member.setZipno(rs.getString(++i));
 				  member.setAddress1(rs.getString(++i));
 				  member.setAddress2(rs.getString(++i));
 				  member.setTel1(rs.getString(++i));
 				  member.setTel2(rs.getString(++i));
 				  member.setTel3(rs.getString(++i));
 				  member.setEmail(rs.getString(++i));
 			  }
 		}catch(Exception e) {System.out.println(e.getMessage());
 		}finally {
 			try {
 				if(rs!=null)rs.close();
 				if(pstmt!=null)pstmt.close();
 				if(conn!=null)conn.close();
 			}catch(Exception e) {}
 		}
 		//멤버객체 리턴
 		return member;
 	}
 	
 	//회원정보 수정 메소드
 	public  int updateMember(Member member) {
 	      int result=0;
 	      Connection conn=null;
 	      PreparedStatement pstmt=null;
 	      String sql = "update member2 "
 	      		        + " set name=?,zipno=?,"
 	      		        + " address1=?,address2=?,tel1=?,tel2=?,tel3=?,"
 	      		        + " email=?"
 	      		        + " where id=?"; 
 	      try {
 	    	      conn=getConnection();
 	    	      pstmt = conn.prepareStatement(sql);
 	    	      int i=0;
 	    	      pstmt.setString(++i, member.getName());
 	    	     // pstmt.setString(++i, member.getBirth());
 	    	      pstmt.setString(++i, member.getZipno());
 	    	      pstmt.setString(++i, member.getAddress1());
 	    	      pstmt.setString(++i, member.getAddress2());
 	    	      pstmt.setString(++i, member.getTel1());
 	    	      pstmt.setString(++i, member.getTel2());
 	    	      pstmt.setString(++i, member.getTel3());
 	    	      pstmt.setString(++i, member.getEmail());
 	    	      pstmt.setString(++i, member.getId());
 	    	      
 	    	       result = pstmt.executeUpdate();
 	      }catch(Exception e) {
 	    	  System.out.println(e.getMessage());
 	      }finally {
 	    	  try {
 	    		  if(pstmt!=null)pstmt.close();
 	    		  if(conn!=null)conn.close();
 	    	  }catch(Exception e) { 		  
 	    	  }
 	      }
 	      return result;
 	}//회원정보 수정메소드 끝.
 	
 	//회원탈퇴 처리 메소드
 	public int deletMember(String id) {
 		int result = 0;
 		Connection conn=null;
 	   PreparedStatement pstmt = null;
 	   String sql = "update member2 set use_flag = '1' where id=?";
 	   try {
 		     conn = getConnection();
 		     pstmt = conn.prepareStatement(sql);
 		     pstmt.setString(1, id);
 		     result = pstmt.executeUpdate();
 	   }catch(Exception e) {
 		   System.out.println(e.getMessage());
 	   }finally {
 		   try {
 			   if(pstmt!=null)pstmt.close();
 			   if(conn!=null)conn.close();
 		   }catch(Exception e) {}
 	   }
 		
 		return result;
 	}
}












