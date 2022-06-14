package com.hotelmvc.model;

public class MessageContact {

	private int idMessage;
	private String object;
	private String text; 
	private String firstname; 
	private String lastname;
	private String email; 
	private String date;
	private int senderIdUser;
	private int receiverIdUser;
	
	
	
	public MessageContact() {
	}
	
	public MessageContact(String object, String text, String firstname, String lastname, String email, String date,
			int senderIdUser, int receiverIdUser) {
		super();
		this.object = object;
		this.text = text;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.date = date;
		this.senderIdUser = senderIdUser;
		this.receiverIdUser = receiverIdUser;
	}


	public int getIdMessage() {
		return idMessage;
	}

	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSenderIdUser() {
		return senderIdUser;
	}

	public void setSenderIdUser(int senderIdUser) {
		this.senderIdUser = senderIdUser;
	}

	public int getReceiverIdUser() {
		return receiverIdUser;
	}

	public void setReceiverIdUser(int receiverIdUser) {
		this.receiverIdUser = receiverIdUser;
	}

}
