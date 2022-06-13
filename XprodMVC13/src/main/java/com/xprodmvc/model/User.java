package com.xprodmvc.model;

public class User {
	private int id;
	private String name;
	private String email;
	private String mobileNumber;
	private String passeword;
	private String authorization;
	private String securityQuestion;
	private String answer;
	private String adresse;
	private String cp;
	private String ville;
	private String departement;
	private String pays;
	
	
	public User() {
		super();
	}
	
	public User(int id, String name, String email, String passeword, String authorization) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.passeword = passeword;
		this.authorization = authorization;
	}

	

	public User(int id, String name, String email, String mobileNumber, String passeword, String securityQuestion,
			String answer, String adresse, String cp, String ville, String departement, String pays) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.passeword = passeword;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.adresse = adresse;
		this.cp = cp;
		this.ville = ville;
		this.departement = departement;
		this.pays = pays;
	}
	
	

	public User(int id, String name, String email, String mobileNumber, String passeword, String authorization,
			String securityQuestion, String answer, String adresse, String cp, String ville, String departement,
			String pays) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.passeword = passeword;
		this.authorization = authorization;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.adresse = adresse;
		this.cp = cp;
		this.ville = ville;
		this.departement = departement;
		this.pays = pays;
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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getDepartement() {
		return departement;
	}

	public void setDepartement(String departement) {
		this.departement = departement;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasseword() {
		return passeword;
	}
	public void setPasseword(String passeword) {
		this.passeword = passeword;
	}
	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	
}
