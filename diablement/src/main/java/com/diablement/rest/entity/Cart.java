package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="CART")
public class Cart extends Produits{
	@Column(name="QUANTITE")
	private int quantite;



	public Cart(Long id, String reference, String designation, String descriptif, String image, double prixVente, int quantite) {
		super(id, reference, designation, descriptif, image, prixVente);
		this.quantite = quantite;
		// TODO Auto-generated constructor stub
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
}
