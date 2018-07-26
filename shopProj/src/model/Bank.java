package model;

public class Bank {
	//필드
	 private String account;
	 private String bank;
	 private String name;
	//생성자
	public Bank() {}
	public Bank(String account, String bank, String name) {
		this.account = account;
		this.bank = bank;
		this.name = name;
	}
	//getter/setter
	public String getAccount() {		return account;	}
	public void setAccount(String account) {		this.account = account;	}
	public String getBank() {		return bank;	}
	public void setBank(String bank) {		this.bank = bank;	}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}

}
