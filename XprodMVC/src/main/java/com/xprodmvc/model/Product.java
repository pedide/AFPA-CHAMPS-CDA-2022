package com.xprodmvc.model;

public class Product {
	private int id;
	private String nom;
	private String categorie;
	private Double prix;
	private String image;
	private String active;
   private String designation;
	
	public Product() {
		super();
	}
	public Product(int id, String nom, String categorie, Double prix, String image) {
		super();
		this.id = id;
		this.nom = nom;
		this.categorie = categorie;
		this.prix = prix;
		this.image = image;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public Double getPrix() {
		return prix;
	}
	public void setPrix(Double prix) {
		this.prix = prix;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getActive() {
		return active;
	}
	
	public Product(String nom, String categorie, Double prix, String image, String active, String designation) {
		super();
		this.nom = nom;
		this.categorie = categorie;
		this.prix = prix;
		this.image = image;
		this.active = active;
		this.designation = designation;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public void setActive(String active) {
		this.active = active;
	}
	
	
	
	







	

}
