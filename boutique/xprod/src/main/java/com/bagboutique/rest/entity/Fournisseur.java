package com.bagboutique.rest.entity;

import java.util.Date;
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
@Table(name ="fournisseur")
public class Fournisseur {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="IDFOUR")
	
	private Long idFour;//id for data base
	private String rsFour;//id of the user
	private String nomFour;
	private String rueAdressFour;
	private String cpAdressFour;
	private String villeAdressFour;
	private String paysFour;
	private String telFour;
	private String faxFour;
	private String mailFour;
	

	@OneToMany(mappedBy="numCms" )
	private List<Commande>commande;
	
	
	
	public Fournisseur() {
		super();
	}


	public Fournisseur(String rsFour, String nomFour, String rueAdressFour, String cpAdressFour, String villeAdressFour,
			String paysFour, String telFour, String faxFour, String mailFour, List<Commande> commande) {
		super();
		this.rsFour = rsFour;
		this.nomFour = nomFour;
		this.rueAdressFour = rueAdressFour;
		this.cpAdressFour = cpAdressFour;
		this.villeAdressFour = villeAdressFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.mailFour = mailFour;
		this.commande = commande;
	}


	public Fournisseur(Long idFour, String rsFour, String nomFour, String rueAdressFour, String cpAdressFour,
			String villeAdressFour, String paysFour, String telFour, String faxFour, String mailFour) {
		super();
		this.idFour = idFour;
		this.rsFour = rsFour;
		this.nomFour = nomFour;
		this.rueAdressFour = rueAdressFour;
		this.cpAdressFour = cpAdressFour;
		this.villeAdressFour = villeAdressFour;
		this.paysFour = paysFour;
		this.telFour = telFour;
		this.faxFour = faxFour;
		this.mailFour = mailFour;
	}



	public Long getIdFour() {
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



	public String getRueAdressFour() {
		return rueAdressFour;
	}



	public void setRueAdressFour(String rueAdressFour) {
		this.rueAdressFour = rueAdressFour;
	}



	public String getCpAdressFour() {
		return cpAdressFour;
	}



	public void setCpAdressFour(String cpAdressFour) {
		this.cpAdressFour = cpAdressFour;
	}



	public String getVilleAdressFour() {
		return villeAdressFour;
	}



	public void setVilleAdressFour(String villeAdressFour) {
		this.villeAdressFour = villeAdressFour;
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