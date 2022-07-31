package com.xprod.rest.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Fournisseur")
@SequenceGenerator(name="commande_seq",initialValue=1,allocationSize=1)
public class Fournisseur {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="commande_seq")
	@Column(name="idFour")
	private Long idFour;
	
	@Column(name="rsFour")
	private String rsFour;
	
	@Column(name="nomFour")
	private String nomFour;
	
	@Column(name="rueFour")
	private String rueFour;
	
	@Column(name="cpFour")
	private String cpFour;
	
	@Column(name="villeFour")
	private String villeFour;
	
	@Column(name="paysFour")
	private String paysFour;
	
	@Column(name="telFour")
	private String telFour;
	
	@Column(name="faxFour")
	private String faxFour;
	
	@Column(name="mailFour")
	private String mailFour;

	@OneToMany(mappedBy = "numCmd", fetch = FetchType.LAZY)//importe les données lentement contrairement à EAGER
	private List<Commande> commande;
	
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)//importe les données lentement contrairement à EAGER
	@JoinTable(name="Approvisionner",
	joinColumns = @JoinColumn(name="idFour"),
	inverseJoinColumns = @JoinColumn(name="prixAchatUHT"))
	private List<ProduitAppro> produitAppro;
	
	public Fournisseur() {
		super();
	}

	public Fournisseur(Long idFour, String rsFour, String nomFour, String rueFour, String cpFour, String villeFour,
			String pays, String telFour, String faxFour, String mailFour) {
		super();
		this.idFour = idFour;
		this.rsFour = rsFour;
		this.nomFour = nomFour;
		this.rueFour = rueFour;
		this.cpFour = cpFour;
		this.villeFour = villeFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.mailFour = mailFour;
	}
	

	public Fournisseur(Long idFour, String rsFour, String nomFour, String rueFour, String cpFour, String villeFour,
			String paysFour, String telFour, String faxFour, String mailFour, List<Commande> commande) {
		super();
		this.idFour = idFour;
		this.rsFour = rsFour;
		this.nomFour = nomFour;
		this.rueFour = rueFour;
		this.cpFour = cpFour;
		this.villeFour = villeFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.mailFour = mailFour;
		this.commande = commande;
	}

	public long getIdFour() {
		return idFour;
	}

	public void setIdFour(Long idFour) {
		this.idFour = idFour;
	}
	
	public String getRsFour() {
		return rsFour;
	}

	public void setRsFour(String rsFour) {
		this.rsFour = rsFour;
	}

	public String getNomFour() {
		return nomFour;
	}

	public void setNomFour(String nomFour) {
		this.nomFour = nomFour;
	}

	public String getRueFour() {
		return rueFour;
	}

	public void setRueFour(String rueFour) {
		this.rueFour = rueFour;
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
		return villeFour;
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

	public String getMailFour() {
		return mailFour;
	}

	public void setMailFour(String mailFour) {
		this.mailFour = mailFour;
	}

	public List<Commande> getCommande() {
		return commande;
	}

	public void setCommande(List<Commande> commande) {
		this.commande = commande;
	}

	

	
	
	
	
}
