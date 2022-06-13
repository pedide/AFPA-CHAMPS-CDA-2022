package com.xprodmvc.model;

public class Order extends Product {
	private int idOrder;
	private int idUser;
	private int quantity;
	private String date;
	private Double total;
	private String Email;

		
	
	public Order() {
		super();
	}
	public Order(int idProd, String name, String category, Double price, String image, int idOrder, int idUser,
			int quantity, String date, Double total, String email) {
		super(idProd, name, category, price, image);
		this.idOrder = idOrder;
		this.idUser = idUser;
		this.quantity = quantity;
		this.date = date;
		this.total = total;
		Email = email;
;
	}

	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
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
