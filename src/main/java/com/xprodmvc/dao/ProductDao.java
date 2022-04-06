package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst; //
	private ResultSet rs; // pour stocker le résultat

	public ProductDao(Connection con) {

		this.con = con;
	}

	// Création d'une liste donc "Product" se met entre < >
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			query = "select * from produits";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				// pour chaque ligne, créer un nouveau produit et récupere les données
				Product row = new Product();
				row.setId(rs.getInt("IDPRODUIT"));
				row.setName(rs.getString("DESIGNATION"));
				row.setCategorie(rs.getString("REF"));
				row.setPrixU(rs.getDouble("PRIXUHT"));
				row.setPrix(rs.getDouble("PRIXUHT"));
				row.setImage(rs.getString("IMAGE"));
				// ajoute la liste de produit
				products.add(row);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// retourne les produits qui ont été récupérés
		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		// Création d'une liste de panier
		List<Cart> products = new ArrayList<>();
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {

					query = "select * from produits where IDPRODUIT=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("IDPRODUIT"));
						row.setName(rs.getString("DESCRIPTIF"));
						row.setCategorie(rs.getString("REF"));
						row.setPrixU(rs.getDouble("PRIXUHT"));
						row.setPrix(rs.getDouble("PRIXUHT") * item.getQuantity());
						row.setQuantity(item.getQuantity());

						products.add(row);

					}
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select PRIXUHT from produits where IDPRODUIT=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("PRIXUHT") * item.getQuantity();
					}

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}

	public int getTotalQteCart(ArrayList<Cart> cartList) {
		int qte = 1;
		try {
			if(cartList.size()>0) {
		
			for(Cart item : cartList) {
				query = "select * from produits where IDPRODUIT=?";
				pst = this.con.prepareStatement(query);
				pst.setInt(1, item.getId());
				rs = pst.executeQuery();
				while(rs.next()) {
					qte += item.getQuantity();
				}
					
			}
				
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return qte;
}

	public Product getSingleProduct(int pId) {
		Product row = null;
		try {
			query = "select * from produits where IDPRODUIT = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, pId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("IDPRODUIT"));
				row.setName(rs.getString("DESIGNATION"));
				row.setCategorie(rs.getString("REF"));
				row.setPrixU(rs.getDouble("PRIXUHT"));
				row.setImage(rs.getString("IMAGE"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return row;
	}
	}
