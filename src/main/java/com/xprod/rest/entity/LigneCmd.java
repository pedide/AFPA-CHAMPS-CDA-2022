package com.xprod.rest.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="LigneCmd")
public class LigneCmd {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idLigneCmd")
	private Long idLigneCmd;
	
	@Column(name="qteLigneCmd")
	private int qteLigneCmd;
	
	@Column(name="dateLivLigneCmd")
	private Date dateLivLigneCmd;
	
	@Column(name="prixUHTLigneCmd")
	private double prixUHTLigneCmd;

	@OneToMany(mappedBy = "prixAchatUHT", fetch = FetchType.LAZY)//importe les données lentement contrairement à EAGER
	private List<ProduitAppro> produitAppro;
	
	public LigneCmd() {
		super();
	}

	public LigneCmd(Long idLigneCmd, int qteLigneCmd, Date dateLivLigneCmd, double prixUHTLigneCmd) {
		super();
		this.idLigneCmd = idLigneCmd;
		this.qteLigneCmd = qteLigneCmd;
		this.dateLivLigneCmd = dateLivLigneCmd;
		this.prixUHTLigneCmd = prixUHTLigneCmd;
	}

	public LigneCmd(int qteLigneCmd, Date dateLivLigneCmd, double prixUHTLigneCmd) {
		super();
		this.qteLigneCmd = qteLigneCmd;
		this.dateLivLigneCmd = dateLivLigneCmd;
		this.prixUHTLigneCmd = prixUHTLigneCmd;
	}

	public Long getIdLigneCmd() {
		return idLigneCmd;
	}

	public void setIdLigneCmd(Long idLigneCmd) {
		this.idLigneCmd = idLigneCmd;
	}

	public int getQteLigneCmd() {
		return qteLigneCmd;
	}

	public void setQteLigneCmd(int qteLigneCmd) {
		this.qteLigneCmd = qteLigneCmd;
	}

	public Date getDateLivLigneCmd() {
		return dateLivLigneCmd;
	}

	public void setDateLivLigneCmd(Date dateLivLigneCmd) {
		this.dateLivLigneCmd = dateLivLigneCmd;
	}

	public double getPrixUHTLigneCmd() {
		return prixUHTLigneCmd;
	}

	public void setPrixUHTLigneCmd(double prixUHTLigneCmd) {
		this.prixUHTLigneCmd = prixUHTLigneCmd;
	}
	
	
}
