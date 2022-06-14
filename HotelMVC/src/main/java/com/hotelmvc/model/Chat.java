package com.hotelmvc.model;

public class Chat extends User {


	private int chatId;
	private String text; 
	private String date;
	private int senderIdUser;
	private int receiverIdUser;
	
	
	
	public Chat() {
	}



	public Chat(int chatId, String text, String date, int senderIdUser, int receiverIdUser) {
		super();
		this.chatId = chatId;
		this.text = text;
		this.date = date;
		this.senderIdUser = senderIdUser;
		this.receiverIdUser = receiverIdUser;
	}



	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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
