package com.mycom.auction.member.domain;

import java.util.Date;

public class Member {
	
	private String id;
	private String password;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email1;
	private String email2;
	private String gender;
	private String birthyear;
	private String birthmonth;
	private String birthday;
	private String zipcode;
	private String roadaddress;
	private String jibunaddress;
	private String detailaddress;
	private Date register;
	private int grade;
	
	public Member() {}

	public Member(String id, String password, String name, String phone1, String phone2, String phone3, String email1,
			String email2, String gender, String birthyear, String birthmonth, String birthday, String zipcode,
			String roadaddress, String jibunaddress, String detailaddress, Date register, int grade) {

		this.id = id;
		this.password = password;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email1 = email1;
		this.email2 = email2;
		this.gender = gender;
		this.birthyear = birthyear;
		this.birthmonth = birthmonth;
		this.birthday = birthday;
		this.zipcode = zipcode;
		this.roadaddress = roadaddress;
		this.jibunaddress = jibunaddress;
		this.detailaddress = detailaddress;
		this.register = register;
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public String getBirthmonth() {
		return birthmonth;
	}
	public void setBirthmonth(String birthmonth) {
		this.birthmonth = birthmonth;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public String getJibunaddress() {
		return jibunaddress;
	}
	public void setJibunaddress(String jibunaddress) {
		this.jibunaddress = jibunaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public Date getRegister() {
		return register;
	}
	public void setRegister(Date register) {
		this.register = register;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + ", email1=" + email1 + ", email2=" + email2 + ", gender=" + gender
				+ ", birthyear=" + birthyear + ", birthmonth=" + birthmonth + ", birthday=" + birthday + ", zipcode="
				+ zipcode + ", roadaddress=" + roadaddress + ", jibunaddress=" + jibunaddress + ", detailaddress="
				+ detailaddress + ", register=" + register + ", grade=" + grade + "]";
	}
}
