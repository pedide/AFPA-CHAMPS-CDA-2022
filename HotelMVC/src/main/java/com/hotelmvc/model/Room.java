package com.hotelmvc.model;

public class Room {
	
	private int roomId;
	private String roomName;
	private String roomCategory;
	private String roomTitleDescription;
	private String roomDescription;
	private Double roomPrice;	
	private String roomImage;
	private int roomQuantity;
	private String roomIsActive;
		
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomCategory() {
		return roomCategory;
	}
	public String getRoomTitleDescription() {
		return roomTitleDescription;
	}
	public void setRoomTitleDescription(String roomTitleDescription) {
		this.roomTitleDescription = roomTitleDescription;
	}
	public void setRoomCategory(String roomCategory) {
		this.roomCategory = roomCategory;
	}
	public String getRoomDescription() {
		return roomDescription;
	}
	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}
	public Double getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(Double roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getRoomImage() {
		return roomImage;
	}
	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;	
	}
	public int getRoomQuantity() {
		return roomQuantity;
	}
	public void setRoomQuantity(int roomQuantity) {
		this.roomQuantity = roomQuantity;
	}
	public String getRoomIsActive() {
		return roomIsActive;
	}
	public void setRoomIsActive(String roomIsActive) {
		this.roomIsActive = roomIsActive;
	}	
}
