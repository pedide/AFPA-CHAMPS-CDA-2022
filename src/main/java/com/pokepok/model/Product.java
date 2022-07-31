package com.pokepok.model;

public class Product {
	private int id;
	private String name;
	private String categorie;
	private double prixU;
	private double prix;
	private String image;
	private String active;
	


	public Product() {
		super();
	}
	
	public Product(String name, String categorie, double prix, String image, String active) {
		super();
		this.name = name;
		this.categorie = categorie;
		this.prix = prix;
		this.image = image;
		this.active = active;
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
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public double getPrixU() {
		return prixU;
	}

	public void setPrixU(double prixU) {
		this.prixU = prixU;
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

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", categorie=" + categorie + ", prixU=" + prixU + ", prix="
				+ prix + ", image=" + image + ", active=" + active + "]";
	}
	
}
