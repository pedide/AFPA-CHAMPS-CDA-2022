package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="PRODUITS")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)//on va rajouter la strategie d'héritage
public class Produits {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "IDPRODUIT")
	private Long id;
	
	@Column(name = "REF")
	private String reference;
	
	@Column(name = "DESIGNATION")
	private String designation;
	
	@Column(name = "DESCRIPTIF")
	private String descriptif;
	
	@Column(name = "IMAGE")
	private String image;
	
	@Column(name = "PRIXVENTE")
	private double prixVente;
	
	@Column(name = "AVERAGESTAR")
	private int averageStar;

	
	public Produits() {
		super();
	}

	public Produits(Long id, String reference, String designation, String descriptif, String image, double prixVente) {
		super();
		this.id = id;
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.image = image;
		this.prixVente = prixVente;
	}

	public Produits(String reference, String designation, String descriptif, String image, double prixVente) {
		super();
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.image = image;
		this.prixVente = prixVente;
	}
	
	public Produits(Long id, String reference, String designation, String descriptif, String image, double prixVente,
			int averageStar) {
		super();
		this.id = id;
		this.reference = reference;
		this.designation = designation;
		this.descriptif = descriptif;
		this.image = image;
		this.prixVente = prixVente;
		this.averageStar = averageStar;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrixVente() {
		return prixVente;
	}

	public void setPrixVente(double prixVente) {
		this.prixVente = prixVente;
	}


	public int getAverageStar() {
		return averageStar;
	}

	public void setAverageStar(int averageStar) {
		this.averageStar = averageStar;
	}

	//polymorphysme
	@Override
	public String toString() {
		return "Produits [id=" + id + ", reference=" + reference + ", designation=" + designation + ", descriptif="
				+ descriptif + ", image=" + image + ", prixVente=" + prixVente + "]";
	}

}
