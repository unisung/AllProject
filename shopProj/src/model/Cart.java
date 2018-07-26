package model;

public class Cart {
	 private int cart_id;
	 private String buyer;
	 private int book_id;
	 private String book_title;
	 private int buy_price;
	 private int buy_count;
	 private String book_image;
	 
    //생성자	 
	public Cart() {}
	public Cart(int cart_id, String buyer, int book_id, String book_title,
                int buy_price, int buy_count, String book_image) {
		this.cart_id = cart_id;
		this.buyer = buyer;
		this.book_id = book_id;
		this.book_title = book_title;
		this.buy_price = buy_price;
		this.buy_count = buy_count;
		this.book_image = book_image;
	}
	
	//getter/setter
	public int getCart_id() {		return cart_id;	}
	public void setCart_id(int cart_id) {		this.cart_id = cart_id;	}
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

}
