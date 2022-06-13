package com.ab_motors.model;

public class cartVehicule extends vehicule{

    private int QUANTITY;


    public cartVehicule() {
        super();
    }


    public cartVehicule(int iDVEHICULE, String mODELE, String cATEGORIE, String mARQUE, double pRIX, int kILOMETRAGE,
			int pUISSANCE, String cARBURANT, String bOITE, int aNNEE, String iMG1, String iMG2, String iMG3,int qUANTITY){
          super( iDVEHICULE,  mODELE,  cATEGORIE,  mARQUE,  pRIX,  kILOMETRAGE,
			 pUISSANCE,  cARBURANT,  bOITE,  aNNEE,  iMG1,  iMG2,  iMG3);
				QUANTITY = qUANTITY;
    }


    public int getQUANTITY() {
        return QUANTITY;
    }

    public void setQUANTITY(int qUANTITY) {
        QUANTITY = qUANTITY;
    }


}