package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Book;

//싱글톤 처리
public class BookDao {
	private static BookDao instance;
	private BookDao() {}
	public static BookDao getInstance() {
		if(instance==null) instance=new BookDao();
		return instance;
	}
	//DB 연결 설정
	private Connection getConnection(){
		  Connection conn=null;
		  Context init = null; 
		  DataSource ds=null;
		  try {
			  	    init = new InitialContext();
			  	    ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
			        conn=ds.getConnection();
		  }catch(Exception e) {
			  System.out.println(e.getMessage());
		  }
		  return conn;
	}//getConnection()메소드 끝.
	
	//메니저 id체크(관리자 인증)
	public int managerCheck(String id,String password) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String dbpass ="";
			String sql ="select managerPasswd from manager where managerId=?";
			int result = -1;//해당 아이디 없음
			try {
				  conn = getConnection();//DB연결
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, id);
				  rs=pstmt.executeQuery();
				 if(rs.next()) {
					 if(rs.getString(1).equals(password))
						 	result = 1;//인증 성공
					 else 
						   result = 0;//패스워드 안맞음
				 }//
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
					 System.out.println(e.getMessage());
				}
			}//finally끝.
		return result;
	}//managerCheck()메소드 끝.
	
	//상품등록 메소드
	public int insertBook(Book book){
		int result = 0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql ="insert into book values(book_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			  conn = getConnection();//DB연결
			  pstmt = conn.prepareStatement(sql);
			  int i=0;
			  
			  pstmt.setString(++i,book.getBook_kind());
			  pstmt.setString(++i,book.getBook_title());
			  pstmt.setInt(++i, book.getBook_price());
			  pstmt.setInt(++i, book.getBook_count());
			  pstmt.setString(++i,book.getAuthor());
			  pstmt.setString(++i,book.getPublishing_com());
			  pstmt.setString(++i,book.getPublishing_date());
			  pstmt.setString(++i,book.getBook_image());
			  pstmt.setString(++i,book.getBook_content());
			  pstmt.setInt(++i,book.getDiscount_rate());
			  pstmt.setDate(++i,book.getReg_date());
			  
			  result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				 System.out.println(e.getMessage());
			}
		}//finally끝.
		return result;
	}//insertBook()메소드 끝.
	
	//상품 건수확인
	public int getBookCount() {
		int count = 0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select count(*) from book";
		try {
			  conn = getConnection();//DB연결
			  pstmt = conn.prepareStatement(sql);
			  rs=pstmt.executeQuery();
			 if(rs.next()) {
				 count = rs.getInt(1);
			 }//
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				 System.out.println(e.getMessage());
			}
		}//finally끝.
		return count;
	}//getBookCount()메소드 끝.
	
	//상품 건수확인
		public int getBookCount(String book_kind) {
			int count = 0;
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select count(*) from book ";
			if(!book_kind.equals("all")) {
				  sql +=" where book_kind=?";
			}
			try {
				  conn = getConnection();//DB연결
				  pstmt = conn.prepareStatement(sql);
				  if(!book_kind.equals("all")) {
				      pstmt.setString(1, book_kind);
				  }
				  rs=pstmt.executeQuery();
				 if(rs.next()) {
					 count = rs.getInt(1);
				 }//
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
					 System.out.println(e.getMessage());
				   } 
			}//finally끝.
			return count;
		}//getBookCount(book_kind)메소드 끝.
	
	  public List<Book> getBooks(String book_kind){
		  List<Book> list = new ArrayList<>();
		   Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ="select * from book where book_kind=? order by reg_date desc";
			String sql2 ="select * from book order by reg_date desc";
			try {
				  conn = getConnection();//DB연결
				  if(book_kind.equals("all")) {
					  pstmt = conn.prepareStatement(sql2);
				  }else {
					  pstmt = conn.prepareStatement(sql);
					  pstmt.setString(1, book_kind);
				  }
				  rs=pstmt.executeQuery();
				 
			while(rs.next()) {
					 Book book = new Book();
					 
					 book.setBook_id(rs.getInt("book_id"));
                     book.setBook_kind(rs.getString("book_kind"));
                     book.setBook_title(rs.getString("book_title"));
                     book.setBook_price(rs.getInt("book_price"));
                     book.setBook_count(rs.getInt("book_count"));
                     book.setAuthor(rs.getString("author"));
                     book.setPublishing_com(rs.getString("publishing_com"));
                     book.setPublishing_date(rs.getString("publishing_date"));
                     book.setBook_image(rs.getString("book_image"));
                     book.setDiscount_rate(rs.getInt("discount_rate"));
                     book.setReg_date(rs.getDate("reg_date")); 
					 
					 list.add(book);
				 }//
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
					 System.out.println(e.getMessage());
				}
			}//finally끝.
		  return list;
	  }
	  
	  //분류별 페이지별 도서리스트 조회 메소드
	  public  List<Book> getBooks(String book_kind,int startRow,int endRow){
		  System.out.println(book_kind);
		  System.out.println(startRow);
		  System.out.println(endRow);
		  List<Book> list = new ArrayList<>();
		   Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql =" select * from(select rownum rn,a.* from " 
						  +" (select * from book ";
			String sql2=" order by book_id)a" 
						   +" ) where rn between ? and ?";
			String sql3 =" where book_kind = ? order by book_id) a"
		                    +" ) where rn between ? and ?";
			try {
				  conn = getConnection();//DB연결
				  if(book_kind.equals("all")) {
					  System.out.println(sql+sql2);
					  pstmt = conn.prepareStatement(sql+sql2);
					  pstmt.setInt(1, startRow);
					  pstmt.setInt(2, endRow);
				  }else {
					  System.out.println(sql+sql3);
					  pstmt = conn.prepareStatement(sql+sql3);
					  pstmt.setString(1, book_kind);
					  pstmt.setInt(2, startRow);
					  pstmt.setInt(3, endRow);
				  }
				  rs=pstmt.executeQuery();
				 
			while(rs.next()) {
					 Book book = new Book();
					 
					 book.setBook_id(rs.getInt("book_id"));
                    book.setBook_kind(rs.getString("book_kind"));
                    book.setBook_title(rs.getString("book_title"));
                    book.setBook_price(rs.getInt("book_price"));
                    book.setBook_count(rs.getInt("book_count"));
                    book.setAuthor(rs.getString("author"));
                    book.setPublishing_com(rs.getString("publishing_com"));
                    book.setPublishing_date(rs.getString("publishing_date"));
                    book.setBook_image(rs.getString("book_image"));
                    book.setDiscount_rate(rs.getInt("discount_rate"));
                    book.setReg_date(rs.getDate("reg_date")); 
					 
					 list.add(book);
				 }//
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {
					 System.out.println(e.getMessage());
				}
			}//finally끝.
		  return list;    
	  }//getBooks()메소드 끝.
	  
	  
	  //도서정보 조회-쇼핑몰 메인에 출력하기위한 도서분류별 신간목록
	  public Book[] getBooks(String book_kind,int count){
		  Book[] bookLists=	 null;//배열 생성
		  Connection conn=null;
		  PreparedStatement pstmt = null;
		  ResultSet rs=null;
		  String sql = "select * from" 
		  		        + " (select * from book "  
		  		        + "  where book_kind =?" 
		  		        + "   order by reg_date desc)" 
		  		        + "  where rownum <=? ";
		  try {
			  	conn = getConnection();//DB연결 맺기
			  	System.out.println("connDB연결 맺기="+conn);
			  	pstmt = conn.prepareStatement(sql);
			  	pstmt.setString(1, book_kind);
			  	pstmt.setInt(2, count);
			    rs = pstmt.executeQuery();
			    int j=0;
			    bookLists = new Book[count];
			    while(rs.next()) {
				    int i=0;
				    Book book = new Book();
				    book.setBook_id(rs.getInt(++i));
				    book.setBook_kind(rs.getString(++i));
				    book.setBook_title(rs.getString(++i));
			        book.setBook_price(rs.getInt(++i));
				    book.setBook_count(rs.getInt(++i));
				    book.setAuthor(rs.getString(++i));
				    book.setPublishing_com(rs.getString(++i));
				    book.setPublishing_date(rs.getString(++i));
				    book.setBook_image(rs.getString(++i));
				    book.setBook_content(rs.getString(++i));
				    book.setDiscount_rate(rs.getInt(++i));
				    book.setReg_date(rs.getDate(++i));
				    
				    bookLists[j]=book;
				    j++;
			   }
		  }catch(Exception e) {
			  System.out.println(e.getMessage());
		  }finally {
			  try {
				  if(rs!=null)rs.close();
				  if(pstmt!=null)pstmt.close();
				  if(conn!=null)conn.close();
			  }catch(Exception e) {
				  System.out.println(e.getMessage());
			  }
		  }//finally끝.
		  return bookLists;
	  }//getBooks()메소드 끝.
	  
	//도서상품 정보 조회 메소드
	public Book getBookInfo(int book_id){
		Book book=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book where book_id=?";
		try {
			    conn = getConnection();//DB연결 맺기
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setInt(1, book_id);
			    rs = pstmt.executeQuery();
			    if(rs.next()) {
			    	int i=0;
			    	book = new Book();
			    	book.setBook_id(rs.getInt(++i));
			    	book.setBook_kind(rs.getString(++i));
			    	book.setBook_title(rs.getString(++i));
			    	book.setBook_price(rs.getInt(++i));
			    	book.setBook_count(rs.getInt(++i));
			    	book.setAuthor(rs.getString(++i));
			    	book.setPublishing_com(rs.getString(++i));
			    	book.setPublishing_date(rs.getString(++i));
			    	book.setBook_image(rs.getString(++i));
			    	book.setBook_content(rs.getString(++i));
			    	book.setDiscount_rate(rs.getInt(++i));
			    	book.setReg_date(rs.getDate(++i));
			    }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
			}
		}//finally끝.
		return book;//bookbean객체 리턴
	}//getBookInfo()메소드 끝.
	
	//book상품 정보 수정 처리 메소드
	public  int updateBookInfo(Book book, int book_id){
		int result = 0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = "update book set book_kind=?, book_title=?, book_price=?, "  
				       + " book_count=?,author=?, publishing_com=?,publishing_date=?, ";
		String sql1="",sql2="";
		if(book.getBook_image()!=null) {
		         sql1  =sql
		        		 + " book_image=?,"
		         		 + " book_content=?,discount_rate=?  where book_id =?";/*  이미지파일 수정(선택) 된 경우  */
		}else {     
				 sql2 = sql 
						 + "  book_content=?,discount_rate=? "
					     + " where book_id =?";/* 이미지파일 수정(선택) 안 된 경우 */
		}
		try {
			       conn = getConnection();//DB 연결맺기
			       if(book.getBook_image()!=null) {//이미지 파일 선택 된 경우
			    	   pstmt = conn.prepareStatement(sql1);
			    	   pstmt.setString(8,book.getBook_image());
			    	   pstmt.setString(9,book.getBook_content());
			    	   pstmt.setInt(10, book.getDiscount_rate());
			    	   pstmt.setInt(11, book.getBook_id());
			       }else {//수정 폼에서 이미지파일이 선택 되지 않은 경우 
			    	   pstmt = conn.prepareStatement(sql2);
			    	   pstmt.setString(8,book.getBook_content());
			    	   pstmt.setInt(9, book.getDiscount_rate());
			    	   pstmt.setInt(10, book.getBook_id());
			       }
			       	pstmt.setString(1, book.getBook_kind());
			       	pstmt.setString(2, book.getBook_title());
			       	pstmt.setInt(3, book.getBook_price());
			       	pstmt.setInt(4, book.getBook_count());
			       	pstmt.setString(5, book.getAuthor());
			       	pstmt.setString(6, book.getPublishing_com());
			       	pstmt.setString(7, book.getPublishing_date());
			       //update처리
			       	result = pstmt.executeUpdate();			       	
		}catch(Exception e) {
			 System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
			}
		}//finally끝.
		return result;
	}//updateBookInfo()메소드 끝.
	
	//서적 상품 삭제 처리 메소드
	public int deleteBook(int book_id) {
		int result = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql = "delete from book where book_id=?";
		try {
					conn=getConnection();//DB연결 맺기
					pstmt =conn.prepareStatement(sql);
					pstmt.setInt(1, book_id);
					result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally끝.
		return result;
	}//deleteBook()메소드 끝.
	
	
	
	
}
