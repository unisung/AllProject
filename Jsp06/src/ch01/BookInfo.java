package ch01;

public class BookInfo extends ProductInfo {
	//필드 추가
	private short page;//페이지 수
	private String writer;//저자
	//생성자
	public BookInfo() {	}
	//getter/setter
	public short getPage() {return page;	}
	public void setPage(short page) {this.page = page;	}
	public String getWriter() {	return writer;	}
	public void setWriter(String writer) {	this.writer = writer;}
	
	
	

}
