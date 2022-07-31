package com.xprod.rest.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ProduitAppro")
public class ProduitAppro extends Produits{
	@Column(name="PRIXACHATUHT")
	private int prixAchatUHT;

	@ManyToMany(fetch=FetchType.LAZY, mappedBy="produitAppro")
	private List<Fournisseur> fournisseur = new ArrayList<>();
	
	
	public ProduitAppro() {
		super();
	}

	public ProduitAppro(int prixAchatUHT) {
		super();
		this.prixAchatUHT = prixAchatUHT;
	}



	public ProduitAppro(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int prixAchatUHT, List<Fournisseur> fournisseur) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		this.prixAchatUHT = prixAchatUHT;
		this.fournisseur = fournisseur;
	}
	
	

	public ProduitAppro(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int averageStar) {
		super(id, ref, designation, descriptif, prixVenteHT, image, averageStar);
		// TODO Auto-generated constructor stub
	}

	public ProduitAppro(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}

	public ProduitAppro(String ref, String designation, String descriptif, double prixVenteHT, String image,
			int averageStar) {
		super(ref, designation, descriptif, prixVenteHT, image, averageStar);
		// TODO Auto-generated constructor stub
	}

	public ProduitAppro(String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}

	public int getPrixAchatUHT() {
		return prixAchatUHT;
	}

	public void setPrixAchatUHT(int prixAchatUHT) {
		this.prixAchatUHT = prixAchatUHT;
	}
	
	
}
