package model;
import java.sql.Date;

//Buy bean 객체
public class Buy {
	private int buy_id;//구매자 id
	private String buyer;//구매자명
	private int book_id;//구매된 book id
	private String book_title;//도서명
	private int buy_price;//가격
	private int buy_count;//수량
	private String book_image;//표지 이미지
	private Date buy_date;//구매일자
	private String account;//결제계좌
	private String deliveryname;//배송지
	private String deliverytel;//배송지 연락처
	private String deliveryaddress;//배송지 주소
	private String sanction;//배송진행 상태
	
	public int getBuy_id() {	return buy_id;	}
	public void setBuy_id(int buy_id) {	this.buy_id = buy_id;	}
	public String getBuyer() {	return buyer;	}
	public void setBuyer(String buyer) {	this.buyer = buyer;	}
	public int getBook_id() {		return book_id;	}
	public void setBook_id(int book_id) {	this.book_id = book_id;	}
	public String getBook_title() {	return book_title;	}
	public void setBook_title(String book_title) {	this.book_title = book_title;	}
	public int getBuy_price() {	return buy_price;	}
	public void setBuy_price(int buy_price) {	this.buy_price = buy_price;	}
	public int getBuy_count() {		return buy_count;	}
	public void setBuy_count(int buy_count) {	this.buy_count = buy_count;	}
	public String getBook_image() {	return book_image;	}
	public void setBook_image(String book_image) {	this.book_image = book_image;	}
	public Date getBuy_date() {	return buy_date;	}
	public void setBuy_date(Date buy_date) {	this.buy_date = buy_date;	}
	public String getAccount() {	return account;	}
	public void setAccount(String account) {	this.account = account;	}
	public String getDeliveryname() {	return deliveryname;	}
	public void setDeliveryname(String deliveryname) {this.deliveryname = deliveryname;	}
	public String getDeliverytel() {	return deliverytel;	}
	public void setDeliverytel(String deliverytel) {	this.deliverytel = deliverytel;	}
	public String getDeliveryaddress() {	return deliveryaddress;	}
	public void setDeliveryaddress(String deliveryaddress) {
		this.deliveryaddress = deliveryaddress;}
	public String getSanction() {	return sanction;	}
	public void setSanction(String sanction) {	this.sanction = sanction; }
	
	
}
