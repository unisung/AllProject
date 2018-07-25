package model;

import java.util.Date;

//member빈(bean) 생성 (dto:DataTransfer Object)
public class Member {
	private String id;//id
	private String password;//비번
	private String name;//이름
	private String birth;//생일
	private String zipno;//우편번호
	private String address1;//주소1
	private String address2;//주소2
	private String tel1;//지역번호/통신사번호
	private String tel2;//국번호
	private String tel3;//전화번호
	private String email;//email주소
	private Date regdate;//가입일자
	private char use_flag;// 사용중인 회원 '0', 탈회한 회원이면:'1'
	
	public String getId() {		return id;	}
	public void setId(String id) {		this.id = id;	}
	public String getPassword() {		return password;	}
	public void setPassword(String password) {		this.password = password;}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}
	public String getBirth() {	return birth;	}
	public void setBirth(String birth) {	this.birth = birth;	}
	public String getZipno() {		return zipno;	}
	public void setZipno(String zipno) {		this.zipno = zipno;	}
	public String getAddress1() {		return address1;	}
	public void setAddress1(String address1) {		this.address1 = address1;	}
	public String getAddress2() {		return address2;	}
	public void setAddress2(String address2) {		this.address2 = address2;	}
	
	public String getTel1() {	return tel1;	}
	public void setTel1(String tel1) {		this.tel1 = tel1;	}
	public String getTel2() {		return tel2;	}
	public void setTel2(String tel2) {		this.tel2 = tel2;	}
	public String getTel3() {		return tel3;	}
	public void setTel3(String tel3) {		this.tel3 = tel3;	}
	
	public String getEmail() {return email;}
	public void setEmail(String email) {	this.email = email;	}
	public Date getRegdate() {		return regdate;	}
	public void setRegdate(Date regdate) {		this.regdate = regdate;	}
	public char getUse_flag() {		return use_flag;	}
	public void setUse_flag(char use_flag) {		this.use_flag = use_flag;	}
}
