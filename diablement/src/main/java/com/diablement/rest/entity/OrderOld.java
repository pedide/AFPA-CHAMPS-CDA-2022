package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="ORDERPR")
public class OrderOld extends Produits{
	
	@Column(name="UID")	
	private Long uid;
	
	@Column(name="QUANTITE")
	private int quantite;
	
	@Column(name="DATEORDER")
	private String dateOrder;
	
	@Column(name="TOTAL")
	private double total;
	
	@Column(name="EMAIL")
	private String email;


	public OrderOld(Long id, String reference, String designation, String descriptif, String image, double prixVente) {
		super(id, reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}   
    
	
    public OrderOld() {
		super();
	}


	public OrderOld(Long id, String reference, String designation, String descriptif, String image, double prixVente,
    		Long uid, int quantite, String dateOrder, double total, String email) {
        super(id, reference, designation, descriptif, image, prixVente);
        this.uid = uid;
        this.quantite = quantite;
        this.dateOrder = dateOrder;
        this.total = total;
        this.email = email;
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

	public String getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(String dateOrder) {
		this.dateOrder = dateOrder;
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
