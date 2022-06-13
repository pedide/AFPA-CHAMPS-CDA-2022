package com.gaiaconsulting.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DataEncryption {
	    private static String converToHex(byte[] data){
	        StringBuffer buf = new StringBuffer(); //La classe StringBuffer en Java est
	        //identique � la classe String, sauf qu'elle peut �tre modifi�
	        for(int i=0; i<data.length;i++){
	            int halfbyte = (data[i]>>>4) & 0x0f; // L'op�rateur >>> est un op�rateur de d�calage de bits
	                                                // vers la droite non sign� en Java. Il divise l'op�rande par 4 � la puissance de l'op�rande droit
	        int two_halfs = 0;
	        
	        do{
	        if((0<=halfbyte) && (halfbyte <=9)){
	        buf.append((char)('0'+halfbyte)); //R�cup�re la s�quence de mes charact�res 
	        }else {
	        buf.append((char)('a'+(halfbyte-10))); //R�cup�re les lettres : a,b,c,d,e
	        }
	        halfbyte = data[i]& 0x0F;
	        }while(two_halfs++<1);
	    }
	        return buf.toString();
	    }
	    
	    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{
	        MessageDigest md; //La classe MessageDigest fournit aux applications
	        //la fonctionnalit� d'un algorithme de r�sum� de message, exemple SHA-1 ou SHA-256
	        md = MessageDigest.getInstance("SHA-1"); //Je prend un aglorihtme 
	        byte[]  sha1hash =new byte[40];
	        md.update(text.getBytes("iso-8859-1"),0,text.length()); //je convertie mon byte selon la norme "iso-8859-1
	        sha1hash = md.digest(); //Termine le calcule de hashage en effectuant des op�rations finales 
	                                //tel que le remplissage.
	                           
	       return converToHex(sha1hash);
	    }
	    
	    
	

}
