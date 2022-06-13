package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.xprodmvc.model.Users;

public class UsersDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public UsersDao(Connection con) {
		this.con = con;
	}

	public Users userlogin(String email, String mot_de_passe) {
		Users user = null;

		try {
			query = "select *from users where email=?and mot_de_passe=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, mot_de_passe);
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new Users();
				user.setIdUser(rs.getInt("idUser"));
				user.setNom(rs.getString("nom"));
				user.setEmail(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public Users userRegister(String nom, String email, String numerotel, String mot_de_passe, String questionsecrete,
			String reponsesecrete, String authorizations, String codepostal, String ville, String adresse,
			String region, String pays) {
		Users user = null;
		try {
			query = "insert into users (nom,email,numerotel,mot_de_passe,questionsecrete,responsesecrete,authorizations,codepostal,ville,adresse,region,pays) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, nom);
			pst.setString(2, email);
			pst.setString(3, numerotel);
			pst.setString(4, mot_de_passe);
			pst.setString(5, questionsecrete);
			pst.setString(6, reponsesecrete);
			pst.setString(7, authorizations);
			pst.setString(8, codepostal);
			pst.setString(9, ville);
			pst.setString(10, adresse);
			pst.setString(11, region);
			pst.setString(12, pays);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public Users userForgotPassword(String email,String numerotel,String questionsecrete,String reponsesecrete,String newmot_de_passe) {
		Users user=null;
		int check=0;
		try {
			/*
			 * query = "select * from users where email='"+email+"'and numerotel='"
			 * +numerotel+"'and questionsecrete='"+questionsecrete+"'and reponsesecrete='"
			 * +reponsesecrete+"'";
			 */
			query ="select * from users where email='"+email+"'and numerotel='"+numerotel+"' and questionsecrete='"+questionsecrete+"'  and reponsesecrete='"+reponsesecrete+"'  " ;
			st=this.con.createStatement();
			rs=st.executeQuery(query);
			System.out.println("probleme numero1");
			while(rs.next()) {
				System.out.println("probleme numero2");
				check=1;
				System.out.println("probleme numero3");
				st.executeUpdate("update users set mot_de_passe='"+newmot_de_passe+"'where email='"+email+"'");
				System.out.println("Password updated");				

			}
			if(check==0) {
			System.out.println("Password not updated");
			}
		    }catch(Exception e) {
		    	System.out.println("probleme numero6");
			System.out.println(e.getMessage());
						
		}
		return user;
	}
}
