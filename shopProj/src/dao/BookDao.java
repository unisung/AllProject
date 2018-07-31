package dao;

import java.util.ArrayList;
import java.util.List;

import model.Book;
import service.BookService;
import sun.security.jca.GetInstance;

public class BookDao extends DaoManger implements BookService {
	 public static BookDao instance;
	 private BookDao() {}
	 public static BookDao getInstance() {
		 if(instance==null) instance = new BookDao();
		 return instance;
	 }
	 
	@Override
	public List<Book> getBookLists(String part, int seq) {
		/*Book[] list = new Book[seq];*/
		List<Book> list = new ArrayList<>();
         String sql = "select * from "
         		    + " (select * from book "
         		    + " where book_kind=? "
         		    + " order by reg_date desc)"
         		    + " where rownum<=?";
	try {
	      pstmt = getConnection().prepareStatement(sql);
	      pstmt.setString(1, part);
	      pstmt.setInt(2,seq);
	      rs = pstmt.executeQuery();
	      //int j=0;
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
	    	  
	    	 /* list[j]=book;
	    	  j++;*/
	    	  list.add(book);
	      }
       }catch(Exception e) {
    	   e.printStackTrace();
       }finally {
    	   close(conn, pstmt, rs);
       }
		return list;
	}//getBookLists(String part, int seq) 메소드 끝.

	@Override
	public int insertBook(Book book) {
		int result =0;
		String sql =" insert into book (book_id, book_kind, book_title, book_price," 
		           +" book_count, author, publishing_com, publishing_date, book_image,"
		           +" book_content, discount_rate, reg_date) "
		           +" values(book_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)"; 
		try {
			 int i=0;
			 pstmt = getConnection().prepareStatement(sql);
/*			 pstmt.setInt(++i, book.getBook_id());*/
			 pstmt.setString(++i,book.getBook_kind());
			 pstmt.setString(++i,book.getBook_title());
			 pstmt.setInt(++i, book.getBook_price());
			 pstmt.setInt(++i,book.getBook_count());
			 pstmt.setString(++i,book.getAuthor());
			 pstmt.setString(++i, book.getPublishing_com());
			 pstmt.setString(++i, book.getPublishing_date());
			 pstmt.setString(++i, book.getBook_image());
			 pstmt.setString(++i, book.getBook_content());
			 pstmt.setInt(++i, book.getDiscount_rate());
			 pstmt.setDate(++i, book.getReg_date());
			
			 result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}//insertBook(Book book) 메소드 끝.

	@Override
	public int getBookCount() {

		return 0;
	}
	
   //분야별 등록 도서 건수 확인메소드
	@Override
	public int getBookCount(String kind) {
       int count=0;
       String sql="";
       try {
    	     if("all".equals(kind)) {
    	         sql = "select count(*) from book";//미리 쿼리문 작성
        	     pstmt = getConnection().prepareStatement(sql);//작성된쿼리문으로 쿼리객체생성
    	         }
    	       else {
    	         sql = "select count(*) from book where book_kind like ?";
        	     pstmt = getConnection().prepareStatement(sql);
    	         pstmt.setString(1, kind);
    	       } 
    	     rs = pstmt.executeQuery();
    	     if(rs.next()) count=rs.getInt(1);
       }catch(Exception e) {
    	   e.printStackTrace();
       }finally {
    	   close(conn,pstmt,rs);
       }
		return count;
	}//getBookCount(String kind) 끝.

	//분야별 등록 도서 리스트 메소드
	@Override
	public List<Book> getBooks(String kind) {
		List<Book> list = new ArrayList<>();
		String sql="";
		if("all".equals(kind)) {
			sql = "select * from book order by reg_date desc";
		}else {
			sql ="select * from book where book_kind like ? order by reg_date desc";
		}
		try {
			if("all".equals(kind)) {//전체
			   pstmt = getConnection().prepareStatement(sql);
			}else {//분야별
			    pstmt = getConnection().prepareStatement(sql);
			    pstmt.setString(1,kind);
			}
			rs = pstmt.executeQuery();
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
				
				list.add(book);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		return list;
	}//getBooks()메소드 끝.

	@Override
	public List<Book> getBooks(String kind, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	//id에 해당하는 book정보 조회
	@Override
	public Book getBookInfo(int book_id) {
		Book book=null; 
		String sql = "select * from book where book_id=?";
		try {
			pstmt=getConnection().prepareStatement(sql);
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
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return book;
	}//getBookInfo(int book_id) 끝.

	 //book데이타 수정 
	@Override
	public int updateBookInfo(Book book, int book_id) {
		int result =0;
		String sql = " update book set " 
			       + " book_kind=?, "
				   + " book_title=?, "
				   + " book_price=?, "
				   + " book_count=?, "
				   + " author=?, "
				   + " publishing_com=?, "
				   + " publishing_date=?, ";
		//이미지 선택했을때  
		String sql1= " book_image=?, "
				   + " book_content=?, "
				   + " discount_rate=? "
				   + " where book_id=?";
		//이미지 선택하지 않았을 때
		String sql2= " book_content=?," 
				   + " discount_rate=? " 
				   + " where book_id=?";
		    if(book.getBook_image()!=null) {//선택했을 때
		    	sql+=sql1;
		    }else {//선택하지 않았을 때
		    	sql+=sql2;
		    }
		 try {
           		pstmt = getConnection().prepareStatement(sql);
           		//이미지 선택했을때 	
           		if(book.getBook_image()!=null) {
           			pstmt.setString(8,book.getBook_image());
               		pstmt.setString(9,book.getBook_content());
               		pstmt.setInt(10,book.getDiscount_rate());
               		pstmt.setInt(11,book_id);	
           		}else {
           		  //이미지 선택하지 않았을 때
               		pstmt.setString(8,book.getBook_content());
               		pstmt.setInt(9,book.getDiscount_rate());
               		pstmt.setInt(10,book_id);
           		}
           		int i=0;
           		//1번부터 7번까지는 공통
           		pstmt.setString(++i,book.getBook_kind());
           		pstmt.setString(++i,book.getBook_title());
           		pstmt.setInt(++i,book.getBook_price());
           		pstmt.setInt(++i,book.getBook_count());
           		pstmt.setString(++i,book.getAuthor());
           		pstmt.setString(++i,book.getPublishing_com());
           		pstmt.setString(++i,book.getPublishing_date());
           		
           		//update처리
           		result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}//updateBookInfo() 메소드 끝.

	//서적 상품 삭제 메소드
	@Override
	public int deleteBook(int book_id) {
	   int result=0;
	   String sql = "delete from book where book_id=?";
	   try {
		     pstmt = getConnection().prepareStatement(sql);
		     pstmt.setInt(1, book_id);
		     result = pstmt.executeUpdate();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   close(conn,pstmt);
	   }
		return result;
	}//deleteBook(int book_id)메소드 끝.

	//관리자 로그인 체크
	@Override
	public int managerCheck(String id, String password) {
		int result=-1;
		String sql ="select managerpasswd from manager where managerid=?";
		try {
			   pstmt = getConnection().prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   if(password.equals(rs.getString(1))) {
					   result=1;//id, 패스워드 모두 맞으면 1
				   }else {
					   result=0;//id는 맞지만, 패스워드가 다를때 0
				   }
			   }else
				   result=-1;//맞는 id가 없을 때 -1
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}//managerCheck()메소드 끝.

}
