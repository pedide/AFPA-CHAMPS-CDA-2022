package com.xprodmvc.model;

public class Shoppingsession {
	private int id;
	private String created_at;
	private int iduser;
	
	public Shoppingsession() {
		super();
	}
	public Shoppingsession(int id, String created_at, int iduser) {
		super();
		this.id = id;
		this.created_at = created_at;
		this.iduser = iduser;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}
	
}
