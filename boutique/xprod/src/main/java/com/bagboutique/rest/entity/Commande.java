package com.bagboutique.rest.entity;

import java.io.Serializable;
import java.util.ArrayList;
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
@Table(name ="commande")
public class Commande implements Serializable {
	

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	
	@Column(name="IDCMD")
	private long numCms;
	@Column(name="DATECDE")
	private String dateCde;
	@Column(name="FRAISPORTCDE")
	private double fraisPortCde;
	
	

	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "idFour",nullable=false)
	private  Fournisseur fournisseur;
	
	public Commande() {
		super();
	}


	public Fournisseur getFournisseur() {
		return fournisseur;
	}


	public void setFournisseur(Fournisseur fournisseur) {
		this.fournisseur = fournisseur;
	}



	public Commande(String dateCde, double fraisPortCde, Fournisseur fournisseur) {
		super();
		this.dateCde = dateCde;
		this.fraisPortCde = fraisPortCde;
		this.fournisseur = fournisseur;
	}


	public Commande(long numCms, String dateCde, double fraisPortCde, Fournisseur fournisseur) {
		super();
		this.numCms = numCms;
		this.dateCde = dateCde;
		this.fraisPortCde = fraisPortCde;
		this.fournisseur = fournisseur;
	}






	public Commande(long numCms, String dateCde, double fraisPortCde) {
		super();
		this.numCms = numCms;
		this.dateCde = dateCde;
		this.fraisPortCde = fraisPortCde;
	}

	public long getNumCms() {
		return numCms;
	}

	public void setNumCms(long numCms) {
		this.numCms = numCms;
	}

	public String getDateCde() {
		return dateCde;
	}

	public void setDateCde(String dateCde) {
		this.dateCde = dateCde;
	}

	public double getFraisPortCde() {
		return fraisPortCde;
	}

	public void setFraisPortCde(double fraisPortCde) {
		this.fraisPortCde = fraisPortCde;
	}

	
}
