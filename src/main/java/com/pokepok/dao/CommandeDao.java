package com.pokepok.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.pokepok.model.Commande;

public class CommandeDao {
	private Connection con;
	private String query;
	private PreparedStatement pst; //
	private ResultSet rs; // pour stocker le résultat

	public CommandeDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean insertCommande(Commande model) {
		boolean result = false;
		try {
			query = "insert into commandes (DATECMD, FRAISDEPORTCMD, NBARTICLE, TOTALHT, TVA, TOTALTTC, IDCLIENT, NOMCLIENT, PRENOMCLIENT) values (?,?,?,?,?,?,?,?,?)";	
			pst = this.con.prepareStatement(query);
			pst.setString(1, model.getDate());
			pst.setDouble(2, model.getFdp());
			pst.setInt(3, model.getNbArticles() );
			pst.setDouble(4, model.getTotalHT());
			pst.setDouble(5, model.getTva());
			pst.setDouble(6, model.getTotalHT()+ (model.getTotalHT()* 0.2));
			pst.setInt(7, model.getIdClient());
			pst.setString(8, model.getNomClient());
			pst.setString(9, model.getPrenomClient());
			
			pst.executeUpdate(); //update car j'insert des données
			result = true;
		}catch(Exception e ) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
