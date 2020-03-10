package com.practice.dto;

public class Member {
	private int member_No;
	private String email;
	private String pwd;
	private String nickname;
	private String phone;
	private char verifiy;
	private int type;

	@Override
	public String toString() {
		return "Member [member_No=" + member_No + ", email=" + email + ", pwd=" + pwd + ", nickname=" + nickname
				+ ", phone=" + phone + ", verifiy=" + verifiy + ", type=" + type + "]";
	}

	public int getMember_No() {
		return member_No;
	}

	public void setMember_No(int member_No) {
		this.member_No = member_No;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getVerifiy() {
		return verifiy;
	}

	public void setVerifiy(char verifiy) {
		this.verifiy = verifiy;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
