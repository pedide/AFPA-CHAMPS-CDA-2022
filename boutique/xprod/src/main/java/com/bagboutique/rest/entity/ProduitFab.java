package com.bagboutique.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PRODUITFAB")

public class ProduitFab extends Produits {
	
	@Column(name="NBHEUREMOY")
	private int nbHeureMoy;
	
	
	

	public ProduitFab(Long id, String reference, String designation, String descriptif, double prix ,String image) {
		super(id, reference, designation, descriptif, prix,image);
		
	}


	public ProduitFab(String reference, String designation, String descriptif, double prixVente, String image) {
		super(reference, designation, descriptif, prixVente, image);
		// TODO Auto-generated constructor stub
	}


	public ProduitFab() {
		super();
	}

	public int getNbHeureMoy() {
		return nbHeureMoy;
	}

	public void setNbHeureMoy(int nbHeureMoy) {
		this.nbHeureMoy = nbHeureMoy;
	}
	
	
	
	

}
