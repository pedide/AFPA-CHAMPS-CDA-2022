package com.pokepok.model;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String authorization;
	
	public User() {
		
	}
	
	public User(int id, String name, String email, String password, String authorization) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.authorization = authorization;
	}
	
	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String toString() {
		return "idLogin : " + id + ". User name : " + name;
	}

}
