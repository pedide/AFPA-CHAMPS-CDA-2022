package com.projetafpa.dao;

public class MessageDao {
	
	private int idMessage;
	private String nom;
	private String prenom;
	private String numeroTel;
	private String numeroCmd;
	private String message;
	private String pieceJointe;
	public MessageDao() {
		super();
	}
	public MessageDao(int idMessage, String nom, String prenom, String numeroTel, String numeroCmd, String message,
			String pieceJointe) {
		super();
		this.idMessage = idMessage;
		this.nom = nom;
		this.prenom = prenom;
		this.numeroTel = numeroTel;
		this.numeroCmd = numeroCmd;
		this.message = message;
		this.pieceJointe = pieceJointe;
	}
	public int getIdMessage() {
		return idMessage;
	}
	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNumeroTel() {
		return numeroTel;
	}
	public void setNumeroTel(String numeroTel) {
		this.numeroTel = numeroTel;
	}
	public String getNumeroCmd() {
		return numeroCmd;
	}
	public void setNumeroCmd(String numeroCmd) {
		this.numeroCmd = numeroCmd;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPieceJointe() {
		return pieceJointe;
	}
	public void setPieceJointe(String pieceJointe) {
		this.pieceJointe = pieceJointe;
	}
	
	}
