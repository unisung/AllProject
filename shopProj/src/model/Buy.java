package model;

import java.sql.Date;

public class Buy {
	 private int buy_id;
	 private String buyer;
	 private int book_id;
	 private String book_title;
	 private int buy_price;
	 private int buy_count;
	 private String book_image;
	 private Date buy_date;
	 private String account;
	 private String deliveryname;
	 private String deliverytel;
	 private String deliveryaddress;
	 private String sanction;
	 //생성자
	 public Buy() {}
	 //getter/setter
	 //get+필드명,set+필드명
	 //form의 name이 필드명으로 되어있으면
	 //useBean생성시 setProperty에서 필드명(=파라미터명)에 맞는 set메소드를
	 //찾아서 호출하여 값을 저장
	public int getBuy_id() {		return buy_id;	}
	public void setBuy_id(int buy_id) {		this.buy_id = buy_id;	}
	public String getBuyer() {		return buyer;	}
	public void setBuyer(String buyer) {		this.buyer = buyer;	}
	public int getBook_id() {		return book_id;	}
	public void setBook_id(int book_id) {		this.book_id = book_id;	}
	public String getBook_title() {		return book_title;	}
	public void setBook_title(String book_title) {		this.book_title = book_title;	}
	public int getBuy_price() {		return buy_price;	}
	public void setBuy_price(int buy_price) {		this.buy_price = buy_price;	}
	public int getBuy_count() {		return buy_count;	}
	public void setBuy_count(int buy_count) {		this.buy_count = buy_count;	}
	public String getBook_image() {		return book_image;	}
	public void setBook_image(String book_image) {		this.book_image = book_image;	}
	public Date getBuy_date() {		return buy_date;	}
	public void setBuy_date(Date buy_date) {		this.buy_date = buy_date;	}
	public String getAccount() {		return account;	}
	public void setAccount(String account) {		this.account = account;	}
	public String getDeliveryname() {		return deliveryname;	}
	public void setDeliveryname(String deliveryname) {	this.deliveryname = deliveryname;}
	public String getDeliverytel() {		return deliverytel;	}
	public void setDeliverytel(String deliverytel) {		this.deliverytel = deliverytel;	}
	public String getDeliveryaddress() {		return deliveryaddress;	}
	public void setDeliveryaddress(String deliveryaddress) {		this.deliveryaddress = deliveryaddress;	}
	public String getSanction() {		return sanction;	}
	public void setSanction(String sanction) {		this.sanction = sanction;	}
    	 
	 
}
