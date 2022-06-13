package com.xprodmvc.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DataEncryption {
    
    private static String convertToHex(byte[] data)
    {
        StringBuffer buf = new StringBuffer();  // la class StringBuffer en java est 
                //identique a la calsse String, sauf qu'elle peut etre modifier
                
      for(int i=0; i<data.length; i++) {
      int halfbyte = (data[i]>>>4) & 0x0F ;//l'operateur >>> est un operateur de decalage de byte
      //vert la droite non signé en java. il devise l'opérande par 4 a la puissance de l'opéronde droit
      
      int two_halfs = 0;
      do{
          if(0<=halfbyte && (halfbyte<=9)){
      
      
      buf.append((char)'0'+halfbyte);  //Récupère la sequence de mes charactere
      } else{
       buf.append((char)('a'+halfbyte-10));  //récupère les lettres :  A B C D E F G E
              }
      halfbyte = data[i] &0x0F;
      
      
      }          
            
        while(two_halfs++<1);
      }
        return buf.toString();
}
  public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{   // ( SHA-1 algorithme de hashage
      
   MessageDigest md;    //la classe messageDigest fournit aux application la, fonctionnalité d'un algorithme de résumé de meessage, exemple SHA-1 ou SHA-256   
  
  md = MessageDigest.getInstance("SHA-1");  //j eprend l'algorithme 
  
  byte[]sha1hash = new byte[40]; //je crie un tableau de byte et je l'instencier (sha1hash)
  md.update(text.getBytes("iso-8859-1"),0,text.length());
  sha1hash = md.digest();  //je termine le calcule de hashage en effectuent des operations finales tel que le remplissage 
  
  return convertToHex(sha1hash);
  
  
          }


    }
   