package ch01;

public class PersonalInfo {
	//필드
	private String id;
	private String name;
	private String gender;
	private int age;
	private String pwd;
	
	//기본생성자
	public PersonalInfo() {	}
	
	//getter/setter메소드
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	

}
