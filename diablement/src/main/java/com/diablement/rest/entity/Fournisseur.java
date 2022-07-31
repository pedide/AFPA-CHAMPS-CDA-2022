package com.diablement.rest.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="FOURNISSEUR")
public class Fournisseur {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "IDFOURNISSEUR")
	private Long idFour;
	
	@Column(name = "NOMFOURNISSEUR")
	private String nomFournisseur;
	
	@Column(name = "RAISONSOCIAL")
	private String raisonSocial;
	
	@Column(name = "ADRESSEFOUR")
	private String adresseFour;
	
	@Column(name = "CPFOUR")
	private String cpFour;
	
	@Column(name = "VILLEFOUR")
	private String villeFour;
	
	@Column(name = "PAYSFOUR")
	private String paysFour;
	
	@Column(name = "TELFOUR")
	private String telFour;
	
	@Column(name = "FAXFOUR")
	private String faxFour;
	
	@Column(name = "EMAILFOUR")
	private String emailFour;

	
	@OneToMany(mappedBy = "idCmde", fetch = FetchType.LAZY)
	private List<Commande> commande;

	
	public Fournisseur() {
		super();
	}

	public Fournisseur(String nomFournisseur, String raisonSocial, String adresseFour, String cpFour, String villeFour,
			String paysFour, String telFour, String faxFour, String emailFour, List<Commande> commande) {
		super();
		this.nomFournisseur = nomFournisseur;
		this.raisonSocial = raisonSocial;
		this.adresseFour = adresseFour;
		this.cpFour = cpFour;
		this.villeFour = villeFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.emailFour = emailFour;
		this.commande = commande;
	}

	public Fournisseur(Long idFour, String nomFournisseur, String raisonSocial, String adresseFour, String cpFour,
			String villeFour, String paysFour, String telFour, String faxFour, String emailFour,
			List<Commande> commande) {
		super();
		this.idFour = idFour;
		this.nomFournisseur = nomFournisseur;
		this.raisonSocial = raisonSocial;
		this.adresseFour = adresseFour;
		this.cpFour = cpFour;
		this.villeFour = villeFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.emailFour = emailFour;
		this.commande = commande;
	}


	public Long getIdFour() {
		return idFour;
	}

	public void setIdFour(Long idFour) {
		this.idFour = idFour;
	}

	public String getNomFournisseur() {
		return nomFournisseur;
	}

	public void setNomFournisseur(String nomFournisseur) {
		this.nomFournisseur = nomFournisseur;
	}

	public String getRaisonSocial() {
		return raisonSocial;
	}

	public void setRaisonSocial(String raisonSocial) {
		this.raisonSocial = raisonSocial;
	}

	public String getAdresseFour() {
		return adresseFour;
	}

	public void setAdresseFour(String adresseFour) {
		this.adresseFour = adresseFour;
	}

	public String getCpFour() {
		return cpFour;
	}

	public void setCpFour(String cpFour) {
		this.cpFour = cpFour;
	}

	public String getVilleFour() {
		return villeFour;
	}

	public void setVilleFour(String villeFour) {
		this.villeFour = villeFour;
	}

	public String getPaysFour() {
		return paysFour;
	}

	public void setPaysFour(String paysFour) {
		this.paysFour = paysFour;
	}

	public String getTelFour() {
		return telFour;
	}

	public void setTelFour(String telFour) {
		this.telFour = telFour;
	}

	public String getFaxFour() {
		return faxFour;
	}

	public void setFaxFour(String faxFour) {
		this.faxFour = faxFour;
	}

	public String getEmailFour() {
		return emailFour;
	}

	public void setEmailFour(String emailFour) {
		this.emailFour = emailFour;
	}

	public List<Commande> getCommande() {
		return commande;
	}

	public void setCommande(List<Commande> commande) {
		this.commande = commande;
	}

	@Override
	public String toString() {
		return "Fournisseur [idFour=" + idFour + ", nomFournisseur=" + nomFournisseur + ", raisonSocial=" + raisonSocial
				+ ", adresseFour=" + adresseFour + ", cpFour=" + cpFour + ", villeFour=" + villeFour + ", paysFour="
				+ paysFour + ", telFour=" + telFour + ", faxFour=" + faxFour + ", emailFour=" + emailFour
				+ ", commande=" + commande + "]";
	}

}
