package com.xprodmvc.model;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DataEncryption {
	    private static String convertToHex(byte[] data){
	        StringBuffer buf = new StringBuffer(); //La classe StringBuffer en Java est identique � la classe String mais peut �tre modifi�e
	        for(int i = 0; i<data.length; i++){
	            int halfbyte = (data[i]>>>4) & 0x0F; //L'op�rateur >>> est un op�rateur de d�calage de bits qui d�cale vers la droite non sign� en Java
	            //Il divise le dividande par 4 � la puissance de l'op�rande droit
	            int two_halfs = 0;
	            do{
	                if(halfbyte >= 0 && halfbyte <= 9){
	                    buf.append((char)('0'+halfbyte)); // r�cup�re la s�quence de mes carat�res
	                }else{
	                    buf.append((char)('a'+(halfbyte-10))); //r�cup�re les lettres
	                }
	                halfbyte = data[i] & 0x0F;
	            }while(two_halfs++<1);
	        }
	        return buf.toString();
	    }
	    
	    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{
	        MessageDigest md; //La classe MessageDigest fourni aux applications la fonctionnalit� d'un algorithme de r�sum� d'un message
	        //ex SHA-1 ou SHA-256
	        md = MessageDigest.getInstance("SHA-1"); // Je prends un algorithme
	        byte[] sha1hash = new byte[40];
	        md.update(text.getBytes("iso-8859-1"),0,text.length());
	        sha1hash = md.digest(); //Termine le calcul de hashage en effectuant des op�rations finales telles que le remplissage
	        
	        return convertToHex(sha1hash);
	    }
}
