package model;

import java.util.Date;

public class Member {
	 //필드
	 private String id;
	 private String password;
	 private String name;
	 private Date birth;
	 private String zipcode;
	 private String address1;
	 private String address2;
	 private String tel1;
	 private String tel2;
	 private String tel3;
	 private String email;
	 //생성자
	public Member(){}
	/*public Member(String id, String password, String name, Date birth, String zipcode, String address1, String address2,
			String tel1, String tel2, String tel3, String email) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.email = email;
	}*/
	//getter/setter
	public String getId() {		return id;	}
	public void setId(String id) {		this.id = id;	}
	public String getPassword() {		return password;	}
	public void setPassword(String password) {		this.password = password;	}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}
	public Date getBirth() {		return birth;	}
	public void setBirth(Date birth) {		this.birth = birth;	}
	public String getZipcode() {		return zipcode;	}
	public void setZipcode(String zipcode) {		this.zipcode = zipcode;	}
	public String getAddress1() {		return address1;	}
	public void setAddress1(String address1) {		this.address1 = address1;	}
	public String getAddress2() {		return address2;	}
	public void setAddress2(String address2) {		this.address2 = address2;}	
	public String getTel1() {		return tel1;	}
	public void setTel1(String tel1) {		this.tel1 = tel1;	}
	public String getTel2() {		return tel2;	}
	public void setTel2(String tel2) {		this.tel2 = tel2;	}
	public String getTel3() {		return tel3;}	
	public void setTel3(String tel3) {		this.tel3 = tel3;	}
	public String getEmail() {		return email;	}
	public void setEmail(String email) {		this.email = email;	}


}
