package com.bagboutique.rest.entity;


import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Table;
 
@Entity
@Table(name="Orderp")
public class Orderp extends Produits {


    @Column(name="UID")
    private Long uid;
    @Column(name="QTY")
    private int quantite; 
    @Column(name="O_DATE")
    private String o_Date;
    @Column(name="TOTAL")
    private double total;
    @Column(name="EMAIL")
    private String email;

    

    public Orderp() {
		super();
	}
	public Orderp(Long id, String reference, String designation, String descriptif, double prixVente, String image) {
        super(id, reference, designation, descriptif, prixVente, image);
    }
    public Orderp(Long id, String reference, String designation, String descriptif, double prixVente, String image,
            Long uid, int quantite, String o_Date, double total, String email) {
        super(id, reference, designation, descriptif, prixVente, image);
        this.uid = uid;
        this.quantite = quantite;
        this.o_Date = o_Date;
        this.total = total;
        this.email = email;
    }
    
    
    
	public Orderp(Long id, String reference, String designation, String descriptif, double prixVente, String image,
			int averageStar, Long uid, int quantite, String o_Date, double total, String email) {
		super(id, reference, designation, descriptif, prixVente, image, averageStar);
		this.uid = uid;
		this.quantite = quantite;
		this.o_Date = o_Date;
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