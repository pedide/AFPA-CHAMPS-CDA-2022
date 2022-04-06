package com.xprodmvc.model;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DataEncryption {
	    private static String convertToHex(byte[] data){
	        StringBuffer buf = new StringBuffer(); //La classe StringBuffer en Java est identique à la classe String mais peut être modifiée
	        for(int i = 0; i<data.length; i++){
	            int halfbyte = (data[i]>>>4) & 0x0F; //L'opérateur >>> est un opérateur de décalage de bits qui décale vers la droite non signé en Java
	            //Il divise le dividande par 4 à la puissance de l'opérande droit
	            int two_halfs = 0;
	            do{
	                if(halfbyte >= 0 && halfbyte <= 9){
	                    buf.append((char)('0'+halfbyte)); // récupère la séquence de mes caratères
	                }else{
	                    buf.append((char)('a'+(halfbyte-10))); //récupère les lettres
	                }
	                halfbyte = data[i] & 0x0F;
	            }while(two_halfs++<1);
	        }
	        return buf.toString();
	    }
	    
	    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{
	        MessageDigest md; //La classe MessageDigest fourni aux applications la fonctionnalité d'un algorithme de résumé d'un message
	        //ex SHA-1 ou SHA-256
	        md = MessageDigest.getInstance("SHA-1"); // Je prends un algorithme
	        byte[] sha1hash = new byte[40];
	        md.update(text.getBytes("iso-8859-1"),0,text.length());
	        sha1hash = md.digest(); //Termine le calcul de hashage en effectuant des opérations finales telles que le remplissage
	        
	        return convertToHex(sha1hash);
	    }
}
