package model;

import java.util.Date;

public class Member {
	//필드
	private String id;
    private String password;
	private String name;
	private Date reg_date;
	//생성자
	public Member(){}
	//getter/setter
	public String getId() {	return id;	}
	public void setId(String id) {	this.id = id;	}
	public String getPassword() {	return password;	}
	public void setPassword(String password) {	this.password = password;	}
	public String getName() {	return name;	}
	public void setName(String name) {	this.name = name;	}
	public Date getReg_date() {	return reg_date;	}
	public void setReg_date(Date reg_date) {this.reg_date = reg_date;	}
	
	
	
}
