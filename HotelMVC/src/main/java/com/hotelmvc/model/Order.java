package com.hotelmvc.model;

public class Order extends Room{

	private int orderId;
	private int uid;
	private int quantity;
	private Double price;	
	private String date;
	private Double total;
	private String email;
	
	
	
	
	public Order() {
		super();
	}


	public Order(int orderId, int uid, int quantity, Double price, String date, Double total, String email) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.price = price;
		this.date = date;
		this.total = total;
		this.email = email;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public Double getTotal() {
		return total;
	}


	public void setTotal(Double total) {
		this.total = total;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Order [uid = " + uid + ", quantity = " + quantity + ", Date = " + date + " ]";
	}

	
	
	

}
