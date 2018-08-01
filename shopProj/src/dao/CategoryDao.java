package dao;

import java.util.ArrayList;
import java.util.List;

import model.Book;
import service.BookService;

public class CategoryDao extends DaoManger implements BookService {
	 public static CategoryDao instance;
	 private CategoryDao() {}
	 public static CategoryDao getInstance() {
		 if(instance==null) instance = new CategoryDao();
		 return instance;
	 }
	 

	//book_kind에 해당하는 kindName 출력 메소드
	public String getBook_kindName(String book_kind){ 
		String sql = "select * from category where catNo=?";
		String book_kindName="";
		try {
			pstmt=getConnection().prepareStatement(sql);
			pstmt.setString(1, book_kind);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				book_kindName=rs.getString(1);
			}else {
				book_kindName="전체";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return book_kindName;
	}//getBook_kindName() 끝.
	
	
	
	
	@Override
	public List<Book> getBookLists(String part, int seq) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertBook(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getBookCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getBookCount(String kind) {
		// TODO Auto-generated method stub
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
	@Override
	public Book getBookInfo(int book_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
