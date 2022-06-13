package com.ab_motors.model;

public class Users {
	
	private int ID_USERS;
	private String NOM;
	private String EMAIL;
	private String MDP;
	private String AUTHOR;
	
	public Users() {
		super();
	}
	
	public Users (int id, String nom, String email, String mdp) {
		super();
		ID_USERS = id;
		NOM = nom;
		EMAIL = email;
		MDP = mdp;
	}

	public int getID_USERS() {
		return ID_USERS;
	}

	public void setID_USERS(int iD_USERS) {
		ID_USERS = iD_USERS;
	}

	public String getNOM() {
		return NOM;
	}

	public void setNOM(String nOM) {
		NOM = nOM;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getMDP() {
		return MDP;
	}

	public void setMDP(String mDP) {
		MDP = mDP;
	}

	public void setAuthorization(String author) {
		AUTHOR = author;
		
	}

	public Object getAuthorization() {
		return AUTHOR;
	}
}