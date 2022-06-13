package com.xprodmvc.model;

public class Users {

	private int idUser;
	private String nom;
	private String email;
	private String numerotel;
	private String mot_de_passe;
	private String questionsecrete;
	private String reponsesecrete;
	private String authorizations;
	private String codepostal;
	private String ville ;
	private String adresse ;
	private String region;
	private String pays;
	
	public Users(int idUser, String nom, String email, String numerotel, String mot_de_passe, String questionsecrete,
			String reponsesecrete, String authorizations, String codepostal, String ville, String adresse,
			String region, String pays) {
		super();
		this.idUser = idUser;
		this.nom = nom;
		this.email = email;
		this.numerotel = numerotel;
		this.mot_de_passe = mot_de_passe;
		this.questionsecrete = questionsecrete;
		this.reponsesecrete = reponsesecrete;
		this.authorizations = authorizations;
		this.codepostal = codepostal;
		this.ville = ville;
		this.adresse = adresse;
		this.region = region;
		this.pays = pays;
	}
	public Users() {
		super();
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumerotel() {
		return numerotel;
	}

	public void setNumerotel(String numerotel) {
		this.numerotel = numerotel;
	}

	public String getMot_de_passe() {
		return mot_de_passe;
	}

	public void setMot_de_passe(String mot_de_passe) {
		this.mot_de_passe = mot_de_passe;
	}

	public String getQuestionsecrete() {
		return questionsecrete;
	}

	public void setQuestionsecrete(String questionsecrete) {
		this.questionsecrete = questionsecrete;
	}

	public String getReponsesecrete() {
		return reponsesecrete;
	}

	public void setReponsesecrete(String reponsesecrete) {
		this.reponsesecrete = reponsesecrete;
	}

	public String getAuthorizations() {
		return authorizations;
	}

	public void setAuthorizations(String authorizations) {
		this.authorizations = authorizations;
	}

	public String getCodepostal() {
		return codepostal;
	}

	public void setCodepostal(String codepostal) {
		this.codepostal = codepostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

}
