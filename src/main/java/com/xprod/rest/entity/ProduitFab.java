package com.xprod.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="ProduitFab")
public class ProduitFab extends Produits{
	@Column(name="NBHEURESMOY")
	private int nbHeuresMoy;
	
	
	public ProduitFab() {
		super();
	}

	public ProduitFab(int nbHeuresMoy) {
			super();
			this.nbHeuresMoy = nbHeuresMoy;
		}

	public ProduitFab(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int nbHeuresMoy) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		this.nbHeuresMoy = nbHeuresMoy;
	}
	
	

	public ProduitFab(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}

	public ProduitFab(String ref, String designation, String descriptif, double prixVenteHT, String image,
			int averageStar) {
		super(ref, designation, descriptif, prixVenteHT, image, averageStar);
		// TODO Auto-generated constructor stub
	}

	public ProduitFab(String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}

	public int getNbHeuresMoy() {
		return nbHeuresMoy;
	}

	public void setNbHeuresMoy(int nbHeuresMoy) {
		this.nbHeuresMoy = nbHeuresMoy;
	}

	
	
	
	
}
