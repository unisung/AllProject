package model;
import java.sql.Date;
//Book모델 생성
public class Book {
	private int book_id;//book id
	private String book_kind;//book 종류
	private String book_title;//book 제목
	private int book_price;//가격
	private int book_count;//수량
	private String author;//저자
	private String publishing_com;//출판사
	private String publishing_date;//발행일
	private String book_image;//표지 이미지
	private String book_content;//내용 요약
	private int discount_rate;//할인율
	private Date reg_date;//등록일자
	
	public int getBook_id() {		return book_id;	}
	public void setBook_id(int book_id) {		this.book_id = book_id;	}
	public String getBook_kind() {		return book_kind;	}
	public void setBook_kind(String book_kind) {		this.book_kind = book_kind;	}
	public String getBook_title() {		return book_title;	}
	public void setBook_title(String book_title) {		this.book_title = book_title;	}
	public int getBook_price() {		return book_price;	}
	public void setBook_price(int book_price) {		this.book_price = book_price;	}
	public int getBook_count() {		return book_count;	}
	public void setBook_count(int book_count) {		this.book_count = book_count;}
	public String getAuthor() {		return author;	}
	public void setAuthor(String author) {		this.author = author;	}
	public String getPublishing_com() {		return publishing_com;	}
	public void setPublishing_com(String publishing_com) {		this.publishing_com = publishing_com;	}
	public String getPublishing_date() {		return publishing_date;	}
	public void setPublishing_date(String publishing_date) {		this.publishing_date = publishing_date;	}
	public String getBook_image() {		return book_image;	}
	public void setBook_image(String book_image) {		this.book_image = book_image;	}	
	public String getBook_content() {		return book_content;}
	public void setBook_content(String book_content) {		this.book_content = book_content;	}
	public int getDiscount_rate() {		return discount_rate;	}
	public void setDiscount_rate(int discount_rate) {		this.discount_rate = discount_rate;	}
	public Date getReg_date() {		return reg_date;	}
	public void setReg_date(Date reg_date) {		this.reg_date = reg_date;	}
	
}
