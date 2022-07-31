package com.bagboutique.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PRODUITAPPRO")

public class ProduitAppro  extends Produits{
	
	@Column(name="PRIXACHATUHT")
	private double prixAchatUHT ;
	
	
	

	public ProduitAppro() {
		super();
		
	}

	public ProduitAppro(Long id, String reference, String designation, String descriptif, double prix, String image) {
		super(id, reference, designation, descriptif, prix ,image);
		
	}

	

	public ProduitAppro(String reference, String designation, String descriptif, double prixVente, String image) {
		super(reference, designation, descriptif, prixVente, image);
		// TODO Auto-generated constructor stub
	}

	public double getPrixAchatUHT() {
		return prixAchatUHT;
	}

	public void setPrixAchatUHT(double prixAchatUHT) {
		this.prixAchatUHT = prixAchatUHT;
	}
	

	

}
