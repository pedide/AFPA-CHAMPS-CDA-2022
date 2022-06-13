package com.gaiaconsulting.model;

public class Order extends Products {

	private int orderId;
	private int userId;
	private int quantity;
	private String date;
	private double total;
	private String email;

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Order() {
		super();
	}
	
	public Order(int orderId, int userId, int quantity, String date) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.quantity = quantity;
		this.date = date;
		
	}

	public Order(int userId, int quantity, String date) {
		super();
		this.userId = userId;
		this.quantity = quantity;
		this.date = date;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", quantity=" + quantity + ", date=" + date + "]";
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
