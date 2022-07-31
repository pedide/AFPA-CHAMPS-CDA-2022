package com.diablement.rest.entity;

import java.io.Serializable;
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
@Table(name="COMMANDE")
@SequenceGenerator(name="commande_seq", initialValue=1, allocationSize=1)
public class Commande implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="commande_seq")
	@Column(name = "IDCMDE")
	private Long idCmde;
	
	@Column(name = "DATECMDE")
	private String dateCmde;
	
	@Column(name = "FRAISPORTCMDE")
	private double fraisPortCmde;

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idFour", nullable=false)
	private Fournisseur fournisseur;
	
	
	public Commande() {
		super();
	}
	
	
	public Commande(String dateCmde, double fraisPortCmde, Fournisseur fournisseur) {
		super();
		this.dateCmde = dateCmde;
		this.fraisPortCmde = fraisPortCmde;
		this.fournisseur = fournisseur;
	}

	public Commande(Long idCmde, String dateCmde, double fraisPortCmde, Fournisseur fournisseur) {
		super();
		this.idCmde = idCmde;
		this.dateCmde = dateCmde;
		this.fraisPortCmde = fraisPortCmde;
		this.fournisseur = fournisseur;
	}


	
	public Long getIdCmde() {
		return idCmde;
	}


	public void setIdCmde(Long idCmde) {
		this.idCmde = idCmde;
	}


	public String getDateCmde() {
		return dateCmde;
	}


	public void setDateCmde(String dateCmde) {
		this.dateCmde = dateCmde;
	}


	public double getFraisPortCmde() {
		return fraisPortCmde;
	}


	public void setFraisPortCmde(double fraisPortCmde) {
		this.fraisPortCmde = fraisPortCmde;
	}


	public Fournisseur getFournisseur() {
		return fournisseur;
	}


	public void setFournisseur(Fournisseur fournisseur) {
		this.fournisseur = fournisseur;
	}


	@Override
	public String toString() {
		return "Commande [idCmde=" + idCmde + ", dateCmde=" + dateCmde + ", fraisPortCmde=" + fraisPortCmde
				+ ", fournisseur=" + fournisseur + "]";
	}
	
}
