package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.xprodmvc.model.Shoppingsession;

public class ShoppingDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ShoppingDao(Connection con) {
		this.con = con;
	}
	public ShoppingDao(Connection con, String query, PreparedStatement pst, ResultSet rs) {
		super();
		this.con = con;
		this.query = query;
		this.pst = pst;
		this.rs = rs;
	}

	
	
	public Shoppingsession insertshoppingSession(int idu, String date) {
		Shoppingsession shopping = null;

		try {
			query = "insert into shoppingsession(iduser,created_at) values (?,?)";
			
			pst = this.con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			pst.setInt(1,idu);
			pst.setString(2, date);
			pst.executeUpdate();
			
			
			ResultSet result = pst.getGeneratedKeys();
			
			int idPannier;
			if (result.next()) {
			    idPannier = result.getInt(1);
			    System.out.println("ID pannier est: " + idPannier);
			    shopping = new Shoppingsession();
				shopping.setId(idPannier);
				shopping.setIduser(idu);
			    
			}
		

		} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
			
		return shopping;
	}
	
	public Shoppingsession checkShoppingS(int idu ) {

		Shoppingsession shopping = null;

		
		
		try {
			query = "select * from shoppingsession where iduser = ?" ;
			pst = this.con.prepareStatement(query);
			
			pst.setInt(1, idu);

			rs = pst.executeQuery();

			if (rs.next()) {
				shopping = new Shoppingsession();
				shopping.setId(rs.getInt("idpanier"));
				shopping.setIduser(rs.getInt("iduser"));
				
			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
		return shopping;
	

	}

	public Shoppingsession deleteShopping(int idShop ) {

		
		try {
			query="delete from shoppingsession where idpanier='"+idShop+"'";
			pst = this.con.prepareStatement(query);
			pst.executeUpdate();

		} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
		return null;
	

	}
	
	
	
	

	
	
}
