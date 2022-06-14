package com.hotelmvc.model;

public class Cart extends Room {
	
	private int cartQuantity;
	private Double cartPrice;

	public Cart() {

	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public Double getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(Double cartPrice) {
		this.cartPrice = cartPrice;
	}	
}
