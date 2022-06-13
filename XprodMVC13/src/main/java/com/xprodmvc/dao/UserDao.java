package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.xprodmvc.model.DataEncryption;
import com.xprodmvc.model.User;

//Cette classe sert à faire des requetes à la table User de la base de données
public class UserDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;//pr stocker le resultat
	private Statement st;
	
	//creation d'un constructeur pour récuperer la onnection
	public UserDao(Connection con) {
		this.con = con;
	}
	
	//cette methode prend un mail et un mdp, se connecte à la bd pr verifier les identifiants
	//puis retourne l'utilisateur entier : l'id, le mdp ... càd un objet User récupéré depuis la base
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			//on va chercher email et mot de passe de l'utilisateur ds bd lorsqu'il est rentré ds le formulaire
			//on prépare une requete select en mettant des ? à la place des valeurs
			query = "select * from user where email=? and password=?";
			//cette requete doit passer ds un prepareStatement pour remplacer les ? par les valeurs
			pst = this.con.prepareStatement(query);
			
			pst.setString(1, email);//remplace le 1er ? par la valeur de email
			pst.setString(2, password );//remplace le 2eme ? par la valeur de password
			
			rs = pst.executeQuery();//envoie la requete à la bd
			
			//pr chaque ligne du résultat renvoyé par la bd
			if(rs.next()) {
				user = new User();//on crée un nouveau objet User
				
				//auquel on attribue les valeurs récupérés de la bd
				user.setId(rs.getInt("iduser"));
				user.setName(rs.getString("username"));
				user.setAuthorization(rs.getString("authorization"));
				user.setEmail(email);
				
				//System.out.println(user);//affiche l'user
			}
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
		
		return user;
	}
	
	
	public User userRegister(String name, String email, String mobileNumber, String passwordSHA1, 
			String securityQuestion, String ansewer, String adresse, String cp, 
			String ville, String departement, String pays) {
		
		User user = null;
		
		try {
			String password = DataEncryption.getSHA1(passwordSHA1);//hash le mdp récupéré ds login de page web
			query = "insert into user (username, email, mobileNumber, password, securityQuestion, answer,adresse,cp, ville, département, pays)value(?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, mobileNumber);
			pst.setString(4, password);
			pst.setString(5, securityQuestion);
			pst.setString(6, ansewer);
			pst.setString(7, adresse);
			pst.setString(8, cp);
			pst.setString(9, ville);
			pst.setString(10, departement);
			pst.setString(11, pays);
			
			pst.executeUpdate();
			
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
		return user;
	}
	
	public User userRegisterB(String name, String email, String mobileNumber, String passwordSHA1, 
			String authorization, String securityQuestion, String ansewer, String adresse, String cp, 
			String ville, String departement, String pays) {
		
		User user = null;
		
		try {
			String password = DataEncryption.getSHA1(passwordSHA1);//hash le mdp récupéré ds login de page web
			query = "insert into user (username, email, mobileNumber, password, authorization, securityQuestion, answer,adresse,cp, ville, département, pays)value(?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, mobileNumber);
			pst.setString(4, password);
			pst.setString(5, authorization);
			pst.setString(6, securityQuestion);
			pst.setString(7, ansewer);
			pst.setString(8, adresse);
			pst.setString(9, cp);
			pst.setString(10, ville);
			pst.setString(11, departement);
			pst.setString(12, pays);
			
			pst.executeUpdate();
			
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
		return user;
	}
	
	public User userForgotPassword (String email, String mobileNumber, String securityQuestion, String answer, String newPasswordSHA1){
		int check = 0;
		User user = null;
		
		try {
			String newPassword = DataEncryption.getSHA1(newPasswordSHA1);
			query = "select * from user where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"' ";
			
			st = this.con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				check = 1;
				Statement st1 = this.con.createStatement();
			
				st1.executeUpdate("update user set password='"+newPassword+"' where email='"+email+"'");
				System.out.println("Le mot de passe a été mise à jour.");
			}
			if(check == 0) {
				System.out.println("Le mot de passe n'a pas été mise à jour !");
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	
	
}
