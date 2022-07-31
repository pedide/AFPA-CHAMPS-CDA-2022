package com.bagboutique.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.Table;
import javax.persistence.InheritanceType;


@Entity
@Table(name="PRODUIT")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)

public class Produits {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="IDPRODUIT")
	private Long id;
	
	@Column(name="REF")
	private String reference;
	
	@Column(name="DESIGNATION")
	private String designation;
	
	@Column(name="DESCRIPTIF")
	private String descriptif;
	
	@Column(name="PRIX")
	private double prixVente;
	
	@Column(name="IMAGE")
	private String image;
	
	@Column(name="AVERAGESTAR")
	private int averageStar;
	


	public Produits(Long id, String reference, String designation, String descriptif, double prixVente, String image,
			int averageStar) {
		super();
		this.id = id;
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.prixVente = prixVente;
		this.image = image;
		this.averageStar = averageStar;
	}



	public int getAverageStar() {
		return averageStar;
	}





	public void setAverageStar(int averageStar) {
		this.averageStar = averageStar;
	}





	public Produits() {
		super();
	}





	public Produits(Long id, String reference, String designation, String descriptif, double prixVente, String image) {
		super();
		this.id = id;
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.prixVente = prixVente;
		this.image = image;
	}
	

	public Produits(String reference, String designation, String descriptif, double prixVente, String image) {
		super();
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.prixVente = prixVente;
		this.image = image;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getDescriptif() {
		return descriptif;
	}

	public void setDescriptif(String descriptif) {
		this.descriptif = descriptif;
	}

	public double getPrixVente() {
		return prixVente;
	}

	public void setPrixVente(double prixVente) {
		this.prixVente = prixVente;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	


}
