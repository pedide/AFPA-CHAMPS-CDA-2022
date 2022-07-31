package com.xprod.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="Cart")
public class Cart extends Produits{
	
	@Column (name="QUANTITE")
	private int quantite;

	@Column (name="TOTAL")
	private double total; 
	
	Cart(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int quantite) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		this.quantite = quantite;
	}
	
	
	

	public Cart(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int quantite, double total) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		this.quantite = quantite;
		this.total = total;
	}




	public Cart(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
	}

	

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}




	public double getTotal() {
		return total;
	}




	public void setTotal(double total) {
		this.total = total;
	}
	
	
}

