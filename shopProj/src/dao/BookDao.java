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

	@Override
	public int getBookCount(String kind) {

		return 0;
	}

	@Override
	public List<Book> getBooks(String kind) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> getBooks(String kind, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book getBookInfo(int book_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBookInfo(Book book, int book_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBook(int book_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int managerCheck(String id, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

}
