package com.hotelmvc.model;

public class User {

	private int iduser;
	private String userEmail;
	private String userPassword;
	private String username;
	private String mobileNumber;
	private String securityQuestion;
	private String anwser;
	private String address;
	private String cp;
	private String city;
	private String state;
	private String country;
	private String authorization;
	private String firstname;
	private String lastname;
	private String companyName;
	

	

	public User() {
		super();
	}


	

	public User(int iduser, String userEmail, String userPassword, String username, String mobileNumber,
			String securityQuestion, String anwser, String address, String cp, String city, String state,
			String country, String authorization, String firstname, String lastname, String companyName) {
		super();
		this.iduser = iduser;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.username = username;
		this.mobileNumber = mobileNumber;
		this.securityQuestion = securityQuestion;
		this.anwser = anwser;
		this.address = address;
		this.cp = cp;
		this.city = city;
		this.state = state;
		this.country = country;
		this.authorization = authorization;
		this.firstname = firstname;
		this.lastname = lastname;
		this.companyName = companyName;
	}




	public int getIduser() {
		return iduser;
	}


	public void setIduser(int iduser) {
		this.iduser = iduser;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserPassword() {
		return userPassword;
	}


	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getMobileNumber() {
		return mobileNumber;
	}


	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}


	public String getSecurityQuestion() {
		return securityQuestion;
	}


	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}


	public String getAnwser() {
		return anwser;
	}


	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCp() {
		return cp;
	}


	public void setCp(String cp) {
		this.cp = cp;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getAuthorization() {
		return authorization;
	}


	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}



	public String getFirstname() {
		return firstname;
	}



	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}



	public String getLastname() {
		return lastname;
	}



	public void setLastname(String lastname) {
		this.lastname = lastname;
	}



	public String getCompanyName() {
		return companyName;
	}



	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	
	
}
