package com.xprodmvc.model;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class DataEncryption {
    //convertion en hexadecimal
    private static String convertToHex (byte[] data){//dans data il y a des 0 ou 1
        //chaine de caractere modifiable
        StringBuffer buf = new StringBuffer(); //la classe StringBuffer en java est 
        //identique à la classe String sauf qu'elle peut être modifié
        
        for (int i=0; i<data.length; i++){
            //creer une var qui va recuperer la moitie des byte et je fais un decalage
            // >>> est un operateur de décallage de byte vers la droite sans tenir compte de signe en java
            //puis on met en hexadecimal
            //Puis il divise l'opérande par 4 à la puissance de l'opérande droite
            
            int halfbyte = (data[i] >>> 4) & 0x0F;
            
            int two_halfs = 0;
            
            do{
                if((halfbyte >=0) && (halfbyte<9)){
                    buf.append((char)('0'+halfbyte)); //je recupere la sequence de mes carateres
                    //je le caste en char
                }else{
                    buf.append((char)('a'+(halfbyte-10)));//je recupère les lettres A à E
                }
                halfbyte = data[i] & 0x0F;
            }while(two_halfs++ <1);
  
        }
        return buf.toString();
    }
    
    
    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        //SHA1 secure hash algorithm 
        //elle produit un resultat par un nb hexadecimal de 40 caracrètres
        MessageDigest md ;//la classe MessageDigest va fournir aux applications la fo nctionnalité
        //d'un algo de resumé de massage tel que le SHA-1 ou SHA-256
        
        //on va recuperer l'instance 
        md = MessageDigest.getInstance("SHA-1");//je prends algo
        //on va creer un tableau de byte 
        byte[] sha1hash = new byte[40];
        md.update(text.getBytes("iso-8859-1"), 0, text.length());//je transforme suivant la norme iso
        sha1hash = md.digest(); //on termine le calcul de hashage en effectuant 
        //des operations finaux tel que le remplissage 
        
        return convertToHex(sha1hash);
      }
    
}
