package com.pokepok.model;

public class Cart extends Product{
private int quantity;

public Cart() {
	super(); //h�rite de tout les �l�ments de Product
}
public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}
@Override
public String toString() {
	return super.toString()+"Cart [quantity=" + quantity + "]";
}



}
