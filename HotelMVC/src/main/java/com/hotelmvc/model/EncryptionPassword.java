package com.hotelmvc.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptionPassword {

    private static String convertToHex(byte[] data){
        StringBuffer buf = new StringBuffer();//La classe String
        //identique à la classe String, sauf qu'elle peut être modifiée
        for(int i=0; i<data.length;i++){
        int halfByte = (data[i]>>>4) & 0x0F; //L'operateur >>>  est un opérateur de décalage de bits
                                              //vers la droite non signé en Java. Il divise l'opérande par 4 à la puissance de l'opérande à droite
        int two_halfs = 0;
       
        do {
        if((0<=halfByte) && (halfByte<=9)) {
        buf.append((char)'0'+halfByte); //Récupere la séquence de mes caracteres
        
                } else { 
        buf.append((char)('a'+(halfByte-10))); //Récupère les lettres : a,b,c,d,e
                }
        halfByte = data[i]&0x0F;
            } while (two_halfs++<1);     
        }
        return buf.toString();
        
    }
    
    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        
    MessageDigest md; // La Classe MessageDisgest fournit aux applications la fonctionalité d'un algorithme de résumé de message exemple SHA-1 ou SHA-256
    md = MessageDigest.getInstance("SHA-1");// Je prend un algorithme
    
    byte[] shalhash = new byte[40];
    md.update(text.getBytes("iso-8859-1"),0,text.length());
    shalhash = md.digest();//Termine le calcul dehashage en effectuant des operations finales, telles que le remplissage. 
    
    return convertToHex(shalhash);
    
 
    }
}
