
 package com.xprodmvc.model;
 
 public class Order extends Product {
	 
	 private int idOrder;
	 private int idClient;
	 private double total;
	 private  String adress;
	 private  String city;
	 private  String ville;
	 private  String mobileNumber;
	 private  String pays;
	 private  String deleveryDate;
	 
	public Order() {
		super();
	}

	public Order(int idClient, double total, String adress, String city, String ville, String mobileNumber, String pays,
			String deleveryDate) {
		super();
		this.idClient = idClient;
		this.total = total;
		this.adress = adress;
		this.city = city;
		this.ville = ville;
		this.mobileNumber = mobileNumber;
		this.pays = pays;
		this.deleveryDate = deleveryDate;
	}

	public Order(int idOrder, int idClient, double total, String adress, String city, String ville, String mobileNumber,
			String pays, String deleveryDate) {
		super();
		this.idOrder = idOrder;
		this.idClient = idClient;
		this.total = total;
		this.adress = adress;
		this.city = city;
		this.ville = ville;
		this.mobileNumber = mobileNumber;
		this.pays = pays;
		this.deleveryDate = deleveryDate;
	}

	public int getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}

	public int getIdClient() {
		return idClient;
	}

	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
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






/*
 * package com.xprodmvc.model;
 * 
 * public class Order extends Product {
 * 
 * private int orderId; public Order(int orderId, int uid, int quantite, String
 * date, double total, String email) { super(); this.orderId = orderId; this.uid
 * = uid; this.quantite = quantite; this.date = date; this.total = total;
 * this.email = email;
 * 
 * }
 * 
 * 
 * public Order(int uid, String date) { super(); this.uid = uid; this.date =
 * date; }
 * 
 * 
 * private int uid; private int quantite; private String date; private double
 * total; private String email; private double prix;
 * 
 * 
 * public Order(int orderId, int uid, int quantite, String date, double total,
 * String email, double prix) { super(); this.orderId = orderId; this.uid = uid;
 * this.quantite = quantite; this.date = date; this.total = total; this.email =
 * email; this.prix = prix; }
 * 
 * 
 * public Double getPrix() { return prix; }
 * 
 * 
 * public void setPrix(double prix) { this.prix = prix; }
 * 
 * 
 * public String getEmail() { return email; }
 * 
 * 
 * public void setEmail(String email) { this.email = email; }
 * 
 * 
 * public Order(int orderId, int uid, int quantite, String date, double total) {
 * super(); this.orderId = orderId; this.uid = uid; this.quantite = quantite;
 * this.date = date; this.total = total; }
 * 
 * 
 * public double getTotal() { return total; }
 * 
 * 
 * public void setTotal(double total) { this.total = total; }
 * 
 * 
 * public Order() { super(); }
 * 
 * 
 * public Order(int orderId, int uid, int quantite, String date) { super();
 * this.orderId = orderId; this.uid = uid; this.quantite = quantite; this.date =
 * date; }
 * 
 * 
 * 
 * public Order(int uid, int quantite, String date) { super(); this.uid = uid;
 * this.quantite = quantite; this.date = date; }
 * 
 * 
 * 
 * 
 * public Order(int uid, String date, double total) { super(); this.uid = uid;
 * this.date = date; this.total = total; }
 * 
 * 
 * public int getOrderId() { return orderId; }
 * 
 * 
 * public void setOrderId(int orderId) { this.orderId = orderId; }
 * 
 * 
 * public int getUid() { return uid; }
 * 
 * 
 * public void setUid(int uid) { this.uid = uid; }
 * 
 * 
 * public int getQuantite() { return quantite; }
 * 
 * 
 * public void setQuantite(int quantite) { this.quantite = quantite; }
 * 
 * 
 * public String getDate() { return date; }
 * 
 * 
 * public void setDate(String date) { this.date = date; }
 * 
 * 
 * @Override public String toString() { return "Order [orderId=" + orderId +
 * ", uid=" + uid + ", quantite=" + quantite + ", date=" + date + "]"; }
 * 
 * 
 * 
 * }
 */