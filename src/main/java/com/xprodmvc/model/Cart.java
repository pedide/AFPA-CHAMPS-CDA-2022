package com.xprodmvc.model;

public class Cart extends Product {

	private int quantite;

	
	public Cart() {
		super();
	}

	public Cart(int idProd, String name, String category, Double price, String image, int quantite) {
		super(idProd, name, category, price, image);
		this.quantite = quantite;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
