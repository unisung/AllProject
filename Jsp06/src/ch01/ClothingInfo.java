package ch01;

public class ClothingInfo extends ProductInfo {
    //필드 추가
	private char size;//사이즈
	private String color;//색상

	//생성자
	public ClothingInfo() {	}

	//getter/setter
	public char getSize() {	return size;}
	public void setSize(char size) {this.size = size;}
	public String getColor() {	return color;	}
	public void setColor(String color) {
		this.color = color;
	}
	
	
	
	
}
