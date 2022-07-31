package com.xprod.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="Order_p")
public class Order extends Produits{
	
	@Column (name="UID")
	private Long uid;
	
	@Column (name="QUANTITE")
	private int quantite;
	
	@Column (name="O_DATE")
	private String o_Date;
	
	@Column (name="TOTAL")
	private double total;
	
	@Column (name="EMAIL")
	private String email;

	
	
	public Order(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image, Long uid,
			int quantite, String o_Date, double total, String email) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		this.uid = uid;
		this.quantite = quantite;
		this.o_Date = o_Date;
		this.total = total;
		this.email = email;
	}
	
	

	public Order(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image,
			int averageStar) {
		super(id, ref, designation, descriptif, prixVenteHT, image, averageStar);
		// TODO Auto-generated constructor stub
	}



	public Order(Long id, String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(id, ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}



	public Order(String ref, String designation, String descriptif, double prixVenteHT, String image, int averageStar) {
		super(ref, designation, descriptif, prixVenteHT, image, averageStar);
		// TODO Auto-generated constructor stub
	}



	public Order(String ref, String designation, String descriptif, double prixVenteHT, String image) {
		super(ref, designation, descriptif, prixVenteHT, image);
		// TODO Auto-generated constructor stub
	}



	public Order() {
		super();
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public String getO_Date() {
		return o_Date;
	}

	public void setO_Date(String o_Date) {
		this.o_Date = o_Date;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

	
	
}
