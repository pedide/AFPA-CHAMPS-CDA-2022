package com.xprodmvc.model;

public class Product {
	private int idProd;
	private String name;
	private String category;
	private Double price;
	private String image;
	

	public Product(int idProd, String name, String category, Double price, String image) {
		super();
		this.idProd = idProd;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;

	}

	public Product() {
		super();
	}

	public int getIdProd() {
		return idProd;
	}

	public void setIdProd(int idProd) {
		this.idProd = idProd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
