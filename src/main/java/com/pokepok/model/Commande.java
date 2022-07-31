package com.pokepok.model;

public class Commande {
	private int id;
	private String date;
	private double fdp;
	private int nbArticles;
	private double totalHT;
	private double tva;
	private double totalTTC;
	private int idClient;
	private String nomClient;
	private String prenomClient;
	
	public Commande() {
		super();
	}
	public Commande(int id, String date, double fdp, int nbArticles, double totalHT, double tva, double totalTTC,
		int idClient, String nomClient, String prenomClient) {
		super();
		this.id = id;
		this.date = date;
		this.fdp = fdp;
		this.nbArticles = nbArticles;
		this.totalHT = totalHT;
		this.tva = tva;
		this.totalTTC = totalTTC;
		this.idClient = idClient;
		this.nomClient = nomClient;
		this.prenomClient = prenomClient;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getFdp() {
		return fdp;
	}
	public void setFdp(double fdp) {
		this.fdp = fdp;
	}
	public int getNbArticles() {
		return nbArticles;
	}
	public void setNbArticles(int nbArticles) {
		this.nbArticles = nbArticles;
	}
	public double getTotalHT() {
		return totalHT;
	}
	public void setTotalHT(double totalHT) {
		this.totalHT = totalHT;
	}
	public double getTva() {
		return tva;
	}
	public void setTva(double tva) {
		this.tva = tva;
	}
	public double getTotalTTC() {
		return totalTTC;
	}
	public void setTotalTTC(double totalTTC) {
		this.totalTTC = totalTTC;
	}
	public int getIdClient() {
		return idClient;
	}
	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}
	public String getNomClient() {
		return nomClient;
	}
	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	public String getPrenomClient() {
		return prenomClient;
	}
	public void setPrenomClient(String prenomClient) {
		this.prenomClient = prenomClient;
	}

	@Override
	public String toString() {
		return "Commande [id=" + id + ", date=" + date + ", fdp=" + fdp + ", nbArticles=" + nbArticles + ", totalHT="
				+ totalHT + ", tva=" + tva + ", totalTTC=" + totalTTC + ", idClient=" + idClient + ", nomClient="
				+ nomClient + ", prenomClient=" + prenomClient + "]";
	}
	
	
}
