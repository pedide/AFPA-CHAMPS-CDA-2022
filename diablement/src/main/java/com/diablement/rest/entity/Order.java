package com.diablement.rest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="ORDERP")
public class Order extends Produits{
	
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
	
	@Column(name="ADRESSE")
	private String adresse;
	
	@Column(name="VILLE")
	private String ville;
	
	@Column(name="MOBILENUMBER")
	private String mobilNumber;
	
	@Column(name="PAYS")
	private String pays;
	
	@Column(name="deleveryDate")
	private String deleveryDate;
    
	public Order() {
		super();
	}


	public Order(Long id, String reference, String designation, String descriptif, String image, double prixVente) {
		super(id, reference, designation, descriptif, image, prixVente);
		// TODO Auto-generated constructor stub
	}   
    

	public Order(Long uid, int quantite, String dateOrder, double total, String email, String adresse, String ville,
			String mobilNumber, String pays, String deleveryDate) {
		super();
		this.uid = uid;
		this.quantite = quantite;
		this.dateOrder = dateOrder;
		this.total = total;
		this.email = email;
		this.adresse = adresse;
		this.ville = ville;
		this.mobilNumber = mobilNumber;
		this.pays = pays;
		this.deleveryDate = deleveryDate;
	}


	public Order(Long id, String reference, String designation, String descriptif, String image, double prixVente,
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


	public String getAdress() {
		return adresse;
	}

	public void setAdress(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getMobilNumber() {
		return mobilNumber;
	}

	public void setMobilNumber(String mobilNumber) {
		this.mobilNumber = mobilNumber;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getDeleveryDate() {
		return deleveryDate;
	}

	public void setDeleveryDate(String deleveryDate) {
		this.deleveryDate = deleveryDate;
	}

}
