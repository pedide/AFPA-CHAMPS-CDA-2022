package com.xprodmvc.model;

public class Cart extends Product{
private int quantity;

public Cart() {
	super(); //hérite de tout les éléments de Product
}
public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}



}
