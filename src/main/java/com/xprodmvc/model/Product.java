package com.xprodmvc.model;

public class Product {
	private int id;
	private String name;
	private String categorie;
	private double prixU;
	private double prix;
	private String image;
	
	
	
	public double getPrixU() {
		return prixU;
	}

	public void setPrixU(double prixU) {
		this.prixU = prixU;
	}

	public Product() {
		super();
	}

	public Product(int id, String name, String categorie,double prixU, double prix, String image) {
		super();
		this.id = id;
		this.name = name;
		this.categorie = categorie;
		this.prixU = prixU;
		this.prix = prix;
		this.image = image;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
