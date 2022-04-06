package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xprodmvc.model.User;

/* Cette classe sert � faire des requ�tes � la table User de la base de donn�es */
public class UserDao {
	
	private Connection con;
	private String query; 
	private PreparedStatement pst; // 
	private ResultSet rs; //pour stocker le r�sultat
	

	
	//cr�ation d'un constructeur pour r�cuperer la connection
	public UserDao(Connection con) { 
		this.con = con; 
	}
	
	/* Cette m�thode prend un mail et un mot de passse, se connecte � la base de donn�es pour v�rifier les identifiants
	 * Puis retourne l'utilisateur entier : l'id, name, le mail, le mdp, bref un objet User (r�cup�r� depuis la base) */
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			//va chercher le mail et le mot de passe  dans la base de donn�es lorsqu'il est entr� dans le formulaire
			//On pr�pare une requ�te select en mettant des ? � la place des valeurs
			query = "select * from user where email = ? and password = ?";
			//Cette requ�te doit passer dans un prepareStatement pour remplacer les ? par les valeurs
			pst=this.con.prepareStatement(query);
			//remplace le premier ? par la valeur de email
			pst.setString(1, email);
			//remplace le deuxi�me ? par la valeur de password
			pst.setString(2, password);
			//Envoie la requ�te � la base de donn�es
			rs = pst.executeQuery();
			
			//Pour chaque ligne du r�sultat renvoy� par la base
			if(rs.next()) {
				//On cr�� un nouvel objet User
				user = new User ();
				//auquel on attribue les valeurs r�cup�r�es de la bdd
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
