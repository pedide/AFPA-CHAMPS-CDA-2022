package com.xprodmvc.model;


public class CartItem {
	private int idcart;
	private int idShopping;
	private int idProduct;
	private int qte;
	private String created_at;
	private String nom;
	private String designation;
	private Double prix;
	private String image;
	private double total;
	
	public CartItem(int idcart, int idShopping, int idProduct, int qte, String created_at, String nom,
			String designation, Double prix, String image, double total) {
		super();
		this.idcart = idcart;
		this.idShopping = idShopping;
		this.idProduct = idProduct;
		this.qte = qte;
		this.created_at = created_at;
		this.nom = nom;
		this.designation = designation;
		this.prix = prix;
		this.image = image;
		this.total = total;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getDesignation() {
		return designation;
	}


	public void setDesignation(String designation) {
		this.designation = designation;
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




	
	
	public CartItem() {
		super();
	}


	public CartItem(int idcart, int idShopping, int idProduct, int qte, String created_at) {
		super();
		this.idcart = idcart;
		this.idShopping = idShopping;
		this.idProduct = idProduct;
		this.qte = qte;
		this.created_at = created_at;
	}


	public int getIdcart() {
		return idcart;
	}


	public void setIdcart(int idcart) {
		this.idcart = idcart;
	}


	public int getIdShopping() {
		return idShopping;
	}


	public void setIdShopping(int idShopping) {
		this.idShopping = idShopping;
	}


	public int getIdProduct() {
		return idProduct;
	}


	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}


	public int getQte() {
		return qte;
	}


	public void setQte(int qte) {
		this.qte = qte;
	}


	public String getCreated_at() {
		return created_at;
	}


	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	
	
}
