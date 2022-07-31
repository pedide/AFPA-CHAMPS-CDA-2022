package com.pokepok.model;

public class Order extends Product {
	private int orderId;
	private int uid;
	private int quantity;
	private String date;
	private int prodId;
	private double total;
	private String email;
	
	
	public Order(int orderId, int prodId, int uid, int quantity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
		this.prodId = prodId;
	}

	
	public Order(String name, String categorie, double prix, String image, String active, int orderId, int uid,
		int quantity, String date, int prodId, double total) {
		super(name, categorie, prix, image, active);
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
		this.prodId = prodId;
		this.total = total;
	}

	

	public Order(String name, String categorie, double prix, String image, String active, int orderId, int uid,
		int quantity, String date, int prodId, double total, String email) {
		super(name, categorie, prix, image, active);
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
		this.prodId = prodId;
		this.total = total;
		this.email = email;
	}


	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public Order() {
		super();
	}

	public Order(int uid, int quantity, String date) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}

	public Order(int orderId, int uid, int quantity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "Order [OrderId=" + orderId + ", uid=" + uid + ", quantity=" + quantity + ", date=" + date + "]";
	}

	
}
