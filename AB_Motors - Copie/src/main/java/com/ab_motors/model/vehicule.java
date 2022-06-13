package com.ab_motors.model;

public class vehicule {
    private int IDVEHICULE;
    private String MODELE;
    private String CATEGORIE;
    private String MARQUE;
    private double PRIX;
    private int KILOMETRAGE;
    private int PUISSANCE;
    private String CARBURANT;
    private String BOITE;
    private int ANNEE;
    private String IMG1;
    private String IMG2;
    private String IMG3;
	
    public vehicule(int iDVEHICULE, String mODELE, String cATEGORIE, String mARQUE, double pRIX, int kILOMETRAGE,
			int pUISSANCE, String cARBURANT, String bOITE, int aNNEE, String iMG1, String iMG2, String iMG3) {
		super();
		IDVEHICULE = iDVEHICULE;
		MODELE = mODELE;
		CATEGORIE = cATEGORIE;
		MARQUE = mARQUE;
		PRIX = pRIX;
		KILOMETRAGE = kILOMETRAGE;
		PUISSANCE = pUISSANCE;
		CARBURANT = cARBURANT;
		BOITE = bOITE;
		ANNEE = aNNEE;
		IMG1 = iMG1;
		IMG2 = iMG2;
		IMG3 = iMG3;
	}
    public vehicule() {
        super();
    }

	public int getIDVEHICULE() {
		return IDVEHICULE;
	}

	public void setIDVEHICULE(int iDVEHICULE) {
		IDVEHICULE = iDVEHICULE;
	}

	public String getMODELE() {
		return MODELE;
	}

	public void setMODELE(String mODELE) {
		MODELE = mODELE;
	}

	public String getCATEGORIE() {
		return CATEGORIE;
	}

	public void setCATEGORIE(String cATEGORIE) {
		CATEGORIE = cATEGORIE;
	}

	public String getMARQUE() {
		return MARQUE;
	}

	public void setMARQUE(String mARQUE) {
		MARQUE = mARQUE;
	}

	public double getPRIX() {
		return PRIX;
	}

	public void setPRIX(double pRIX) {
		PRIX = pRIX;
	}

	public int getKILOMETRAGE() {
		return KILOMETRAGE;
	}

	public void setKILOMETRAGE(int kILOMETRAGE) {
		KILOMETRAGE = kILOMETRAGE;
	}

	public int getPUISSANCE() {
		return PUISSANCE;
	}

	public void setPUISSANCE(int pUISSANCE) {
		PUISSANCE = pUISSANCE;
	}

	public String getCARBURANT() {
		return CARBURANT;
	}

	public void setCARBURANT(String cARBURANT) {
		CARBURANT = cARBURANT;
	}

	public String getBOITE() {
		return BOITE;
	}

	public void setBOITE(String bOITE) {
		BOITE = bOITE;
	}

	public int getANNEE() {
		return ANNEE;
	}

	public void setANNEE(int aNNEE) {
		ANNEE = aNNEE;
	}

	public String getIMG1() {
		return IMG1;
	}

	public void setIMG1(String iMG1) {
		IMG1 = iMG1;
	}

	public String getIMG2() {
		return IMG2;
	}

	public void setIMG2(String iMG2) {
		IMG2 = iMG2;
	}

	public String getIMG3() {
		return IMG3;
	}

	public void setIMG3(String iMG3) {
		IMG3 = iMG3;
	}
    
    
}