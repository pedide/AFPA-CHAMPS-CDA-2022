package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xprodmvc.model.User;

/* Cette classe sert à faire des requêtes à la table User de la base de données */
public class UserDao {
	
	private Connection con;
	private String query; 
	private PreparedStatement pst; // 
	private ResultSet rs; //pour stocker le résultat
	

	
	//création d'un constructeur pour récuperer la connection
	public UserDao(Connection con) { 
		this.con = con; 
	}
	
	/* Cette méthode prend un mail et un mot de passse, se connecte à la base de données pour vérifier les identifiants
	 * Puis retourne l'utilisateur entier : l'id, name, le mail, le mdp, bref un objet User (récupéré depuis la base) */
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			//va chercher le mail et le mot de passe  dans la base de données lorsqu'il est entré dans le formulaire
			//On prépare une requête select en mettant des ? à la place des valeurs
			query = "select * from user where email = ? and password = ?";
			//Cette requête doit passer dans un prepareStatement pour remplacer les ? par les valeurs
			pst=this.con.prepareStatement(query);
			//remplace le premier ? par la valeur de email
			pst.setString(1, email);
			//remplace le deuxième ? par la valeur de password
			pst.setString(2, password);
			//Envoie la requête à la base de données
			rs = pst.executeQuery();
			
			//Pour chaque ligne du résultat renvoyé par la base
			if(rs.next()) {
				//On créé un nouvel objet User
				user = new User ();
				//auquel on attribue les valeurs récupérées de la bdd
				user.setId(rs.getInt("IDUSER"));
				user.setName(rs.getString("USERNAME"));
				user.setEmail(rs.getString("EMAIL"));
				// affiche l'user
				System.out.println(user);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
}
