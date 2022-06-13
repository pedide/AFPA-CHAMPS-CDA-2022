package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.model.CartItem;
import com.xprodmvc.model.Product;
import com.xprodmvc.model.Shoppingsession;

public class CartItemDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	
	
	
	public CartItemDao(Connection con, String query, PreparedStatement pst, ResultSet rs, Statement st) {
		super();
		this.con = con;
		this.query = query;
		this.pst = pst;
		this.rs = rs;
		this.st = st;
	}
	public CartItemDao(Connection con) {
		super();
		this.con = con;
	}
	public CartItemDao(Statement st) {
		super();
		this.st = st;
	}
	
	public CartItem addItem (int idShopping, int idProduct ,int quantite) { 
		quantite=1;
	CartItem cartItem = null;
	try {
		query ="insert into cartitem (idShopping,idProduct, qte)value(?,?,?) ";
		
		pst = this.con.prepareStatement(query);
		pst.setInt(1, idShopping);
		pst.setInt(2, idProduct);
		pst.setInt(3, quantite);
		
		
		pst.executeUpdate();
		
		if (rs.next()) {
			
			cartItem = new CartItem();
			cartItem.setIdShopping(rs.getInt("idShopping"));
			cartItem.setIdProduct(rs.getInt("idProduct"));
			
			System.out.println("product id is :" + cartItem.getIdProduct() );
			
		}}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return cartItem;
	
	}
	
	
	public CartItem checkCartItem(int idShopping, int idProduct ) {

		//Shoppingsession shopping = null;

		CartItem cartItem = null;
		
		try {
			query = "select * from cartitem where idShopping=? and  idProduct=?" ;
			pst = this.con.prepareStatement(query);
			//partie manquante
			pst.setInt(1, idShopping);
			pst.setInt(2, idProduct);
			
			rs = pst.executeQuery();

			if (rs.next()) {
				
				cartItem = new CartItem();
				cartItem.setIdShopping(rs.getInt("idShopping"));
				cartItem.setIdProduct(rs.getInt("idProduct"));
				cartItem.setQte(rs.getInt("qte"));
				/*
				 * cartItem = new CartItem(); cartItem.setIdShopping(rs.getInt("idShopping"));
				 * cartItem.setIdProduct(rs.getInt("idProduct"));
				 */
				 System.out.println("ID produit est: " + idProduct);
				 
				

					}
			}
		catch (SQLException e) {
           System.out.println(e.getMessage());
		
		}
		return cartItem;
		}

	
	
	public CartItem updatCartItem(int idShopping, int idProduct, int quantite ) {
		CartItem cartItem=null;
		quantite++;

		try {
			query="update cartitem set qte='"+quantite+"'  where idShopping='"+idShopping+"' and idProduct='"+idProduct+"'"	;	
			pst = this.con.prepareStatement(query);
			pst.executeUpdate();
		 
		System.out.println("update in  CartItem successful !");
	
		
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cartItem;
		
	}
	
	public List<CartItem> cartDetail(int idShopping) {
		
		List<CartItem> cartItemList = new ArrayList<CartItem>();
		try {
	
			//query = "select cartitem.*,products.reference,products.descriptif,products.prix from cartitem,products where cartitem.idShopping=? and caritem.idProduct=products.id" ;
			query = "select * from cartitem inner join products on cartitem.idProduct=products.id where idShopping=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, idShopping);
			
			rs = pst.executeQuery();
			
			while (rs.next()) {
				CartItem row = new CartItem();
				row.setIdcart(rs.getInt("idcart"));
				row.setIdShopping(rs.getInt("idShopping"));
				row.setIdProduct(rs.getInt("idProduct"));
				row.setQte(rs.getInt("qte"));
				System.out.println("quantité from join" + row.getQte());
				row.setNom(rs.getString("reference"));
				row.setDesignation(rs.getString("descriptif"));
				row.setPrix(rs.getDouble("prix"));
				row.setImage(rs.getString("image"));

				cartItemList.add(row);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		
		return cartItemList;
			
		}
		
	public CartItem updat2CartItem(int idShopping, int idProduct, int qte ) {
		CartItem cartItem=null;
		
	qte--;
	
				try {
					
					if (qte==0) {
					query="delete from cartitem where idShopping='"+idShopping+"' and idProduct='"+idProduct+"'";
					pst = this.con.prepareStatement(query);
					pst.executeUpdate();
					
					}else {
					query="update cartitem set qte='"+qte+"'  where idShopping='"+idShopping+"' and idProduct='"+idProduct+"'";
					pst = this.con.prepareStatement(query);
					pst.executeUpdate();
	
					}}  catch (SQLException e) {
					
					e.printStackTrace();
				}
				return cartItem;
				
}
	
	
	public CartItem deleteCardItem(int idShopping ) {
			try {
				
				
				query="delete from cartitem where idShopping='"+idShopping+"'";
				pst = this.con.prepareStatement(query);
				pst.executeUpdate();
				
				}  catch (SQLException e) {
				
				e.printStackTrace();
			}
			return null;
	
			
}
	
public List<CartItem> cartQte(int idShopping) {
		
		List<CartItem> cartItemQte = new ArrayList<CartItem>();
		try {
	
			
			query = "select * from cartitem where idShopping=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, idShopping);
			
			rs = pst.executeQuery();
			
if (rs.next()) {
				
		
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		
		return cartItemQte;
			
		}
}	
	
