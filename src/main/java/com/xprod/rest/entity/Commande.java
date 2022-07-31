package com.xprod.rest.entity;

import java.io.Serializable;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Commande")

public class Commande  implements Serializable{ //fait appel a la Liste
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="numCmd")
	private Long numCmd;
	
	@Column(name="dateCmd")
	private Date dateCmd;
	
	@Column(name="fraisPortCmd")
	private double fraisPortCmd;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idFour", nullable=false)
	private Fournisseur fournisseur;
	
	@OneToMany(mappedBy = "idLigneCmd", fetch = FetchType.LAZY)//importe les données lentement contrairement à EAGER
	private List<LigneCmd> ligneCmd;
	
	public Commande() {
		super();
	}

	public Commande(Long numCmd, Date dateCmd, double fraisPortCmd, Fournisseur fournisseur) {
		super();
		this.numCmd = numCmd;
		this.dateCmd = dateCmd;
		this.fraisPortCmd = fraisPortCmd;
		this.fournisseur = fournisseur;
	}

	public Commande(Date dateCmd, double fraisPortCmd, Fournisseur fournisseur) {
		super();
		this.dateCmd = dateCmd;
		this.fraisPortCmd = fraisPortCmd;
		this.fournisseur = fournisseur;
	}

	public Long getNumCmd() {
		return numCmd;
	}

	public void setNumCmd(Long numCmd) {
		this.numCmd = numCmd;
	}

	public Date getDateCmd() {
		return dateCmd;
	}

	public void setDateCmd(Date dateCmd) {
		this.dateCmd = dateCmd;
	}

	public double getFraisPortCmd() {
		return fraisPortCmd;
	}

	public void setFraisPortCmd(double fraisPortCmd) {
		this.fraisPortCmd = fraisPortCmd;
	}

	public Fournisseur getFournisseur() {
		return fournisseur;
	}

	public void setFournisseur(Fournisseur fournisseur) {
		this.fournisseur = fournisseur;
	}

	
	
	
}
