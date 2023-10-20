package com.mycom.auction.member.domain;

public class User {
	
	private String id;
	private String password;
	private String name;
	private String email1;
	private String email2;
	private int grade;
	
	public User() {}
	
	public User(String id, String password, String name, String email1, String email2, int grade) {

		this.id = id;
		this.password = password;
		this.name = name;
		this.email1 = email1;
		this.email2 = email2;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", email1=" + email1 + ", email2="
				+ email2 + ", grade=" + grade + "]";
	}
	
}
