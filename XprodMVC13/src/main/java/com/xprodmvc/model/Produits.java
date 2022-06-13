package com.xprodmvc.model;

public class Produits {
	private int id;
	private String ref;
	private String name;
	private String category;
	private Double price;
	private String image;
	private String active;
	

	public Produits() {
		
	}
	
	public Produits(int id, String name, String category, Double price, String image) {
		
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
	}


	public Produits(int id, String name, String category, Double price, String image, String active) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.active = active;
	}

	
	public Produits(int id, String ref, String name, String category, Double price, String image, String active) {
		super();
		this.id = id;
		this.ref = ref;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.active = active;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
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
