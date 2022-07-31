package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PRODUITAPPRO")
public class ProduitAppro extends Produits{
	
	@Column (name="PRIXACHATUHT")
	private double prixAchatUHT;


	public ProduitAppro(Long id, String reference, String designation, String descriptif, String image,
			double prixVente) {
		super(id, reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}

	public ProduitAppro(String reference, String designation, String descriptif, String image, double prixVente) {
		super(reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}

	
	public double getPrixAchatUHT() {
		return prixAchatUHT;
	}

	public void setPrixAchatUHT(double prixAchatUHT) {
		this.prixAchatUHT = prixAchatUHT;
	}
	
}
