package com.projetafpa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.projetafpa.model.Message;

public class Message {
	private Connection con;
	
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	public Message (Connection con) {
		this.con = con;
		
	}

public Message envoyerMessage (String nom, String prenom, String numeroTel, String numeroCmd, String message, String pieceJointe) {
	
	Message message1 = null;
	try {
		query ="insert into messages (nom, prenom, numeroTel, numeroCmd, message, pieceJointe)values (?,?,?,?,?,?)";
		pst = this.con.prepareStatement(query);
		pst.setString(1, nom);
		pst.setString(2, prenom);
		pst.setString(3, numeroTel);
		pst.setString(4, numeroCmd);
		pst.setString(5, message);
		pst.setString(6, pieceJointe);
		
		pst.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
return message1;
}
}


