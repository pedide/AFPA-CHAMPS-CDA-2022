package com.xprod.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Table(name="Produits")
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Produits {

		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="IdProduit")
		private Long id;
		
		@Column(name="ref")
		private String ref;
		
		@Column(name="designation")
		private String designation;
		
		@Column(name="descriptif")
		private String descriptif;
		
		@Column(name="prixUHT")
		private double prixVenteHT;
		
		@Column(name="image")
		private String image;
		
		
		@Column(name="averageStar") 
		private int averageStar;
		 

		public Produits(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image) {
			super();
			this.id = id;
			this.ref = ref;
			this.designation = designation;
			this.descriptif = descriptif;
			this.prixVenteHT = prixVenteHT;
			this.image = image;
		}

		public Produits(String ref, String designation, String descriptif, double prixVenteHT, String image) {
			super();
			this.ref = ref;
			this.designation = designation;
			this.descriptif = descriptif;
			this.prixVenteHT = prixVenteHT;
			this.image = image;
		}
		
		
		  public Produits(String ref, String designation, String descriptif, double
		  prixVenteHT, String image, int averageStar) { super(); this.ref = ref;
		  this.designation = designation; this.descriptif = descriptif;
		  this.prixVenteHT = prixVenteHT; this.image = image; this.averageStar =
		  averageStar; }
		  
		  public Produits(Long id, String ref, String designation, String descriptif,
		  double prixVenteHT, String image, int averageStar) { super(); this.id = id;
		  this.ref = ref; this.designation = designation; this.descriptif = descriptif;
		  this.prixVenteHT = prixVenteHT; this.image = image; this.averageStar =
		  averageStar; }
		 
		
		public Produits() {
			super();
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getRef() {
			return ref;
		}

		public void setRef(String ref) {
			this.ref = ref;
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

		public double getPrixVenteHT() {
			return prixVenteHT;
		}

		public void setPrixVenteHT(double prixVenteHT) {
			this.prixVenteHT = prixVenteHT;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		
		  public int getAverageStar() { return averageStar; }
		  
		  public void setAverageStar(int averageStar) { this.averageStar = averageStar;
		  }
		 

		
		
		
		
		
		
		
		
		
		

		
		
		
		
}
