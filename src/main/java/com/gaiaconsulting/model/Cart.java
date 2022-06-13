package com.gaiaconsulting.model;

public class Cart extends Products {
	private int quantity;

	public Cart(int quantity) {
		
		this.quantity = quantity;
	}

	public Cart() {
		super();
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
