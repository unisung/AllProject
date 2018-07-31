package dto;

import java.util.Date;

public class CalendarDto {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String mdate;
	private Date regdate;
	//생성자
	public CalendarDto() {}
	public CalendarDto(int seq, String id, String title, String content, String mdate, Date regdate) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.mdate = mdate;
		this.regdate = regdate;
	}
	public CalendarDto(int seq, String id, String title, String content, String mdate) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.mdate = mdate;
	}
	public CalendarDto(int seq, String id, String title, String content) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
	}
	public CalendarDto(String id, String title, String content, String mdate) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.mdate = mdate;
	}
	public CalendarDto(String id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return super.toString();
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	

	
	
	
	

}
