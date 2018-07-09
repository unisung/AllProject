package ch01;
/**
 * 필드는 private, 기본생성자 필수, get+필드명 메소드,set+필드명 메소드
 * */
public class ProductInfo {
	//필드 
	private String code;//제품코드
	private String name;//제품명
	private int price;//가격
	//생성자
	public ProductInfo() {	}
	//getter/setter
	public String getCode() {	return code;	}
	public void setCode(String code) {	this.code = code;	}
	public String getName() {	return name;	}
	public void setName(String name) {	this.name = name;	}
	public int getPrice() {	return price;	}
	public void setPrice(int price) {	this.price = price;	}
}
