package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PRODUITFAB")
public class ProduitFab extends Produits{
	
	@Column (name="NBHEUREMOY")
	private int nbHeureMoy;



	public ProduitFab(Long id, String reference, String designation, String descriptif, String image,
			double prixVente) {
		super(id, reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}


	public ProduitFab(String reference, String designation, String descriptif, String image, double prixVente) {
		super(reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}


	public int getNbHeureMoy() {
		return nbHeureMoy;
	}

	public void setNbHeureMoy(int nbHeureMoy) {
		this.nbHeureMoy = nbHeureMoy;
	}
	
	
	
}
