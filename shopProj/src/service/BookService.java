package service;

import java.util.List;
import model.Book;

public interface BookService {
	//도서리스트
	List<Book> getBookLists(String part, int seq);
/*	Book[] getBookLists(String part, int seq);
*/	//도서등록
	int insertBook(Book book);
	//전체 도서 수량
	int getBookCount();
	//분야별 도서 수량
	int getBookCount(String kind);
	//분야별 도서 리스트
	List<Book> getBooks(String kind);
	//분야별 도서 페이징
	List<Book> getBooks(String kind,int startRow,int endRow);
	//id에 해당하는 도서 정보
	Book getBookInfo(int book_id);
	//도서정보 수정
	int updateBookInfo(Book book, int book_id);
	//도서정보 삭제
	int deleteBook(int book_id);
	//관리자 체크
	int managerCheck(String id,String password);
	 
}
