package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Produits;

public class ProductsDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public ProductsDao(Connection con) {
		this.con = con;
	}

	public List<Produits> getAllProducts() {
		// creation d'une liste de produits
		List<Produits> products = new ArrayList<Produits>();

		try {
			query = "select * from produits";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				// on va ds la base de donnée et on parcourt les produits
				Produits row = new Produits();
				row.setId(rs.getInt("idProduit"));
				row.setName(rs.getString("designation"));
				row.setCategory(rs.getString("descriptif"));
				row.setPrice(rs.getDouble("prixUHT"));
				row.setImage(rs.getString("imageProduit"));

				products.add(row);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select * from produits where idProduit=?";

					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();

					while (rs.next()) {
						Cart row = new Cart();// je cree une ligne ds mon panier
						
						row.setId(rs.getInt("idProduit"));
						row.setName(rs.getString("designation"));
						row.setCategory(rs.getString("descriptif"));
						row.setPrice(rs.getDouble("prixUHT") * item.getQuantity());
						row.setQuantity(item.getQuantity());

						products.add(row);
					}
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double somme = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select prixUHT from produits where idProduit=?";
					pst = this.con.prepareStatement(query);// prepare la requete
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();

					while (rs.next()) {
						somme += rs.getDouble("prixUHT") * item.getQuantity();
					}
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return somme;
	}

	public Produits getSingleProduct(int pId) {
		
		Produits row = null;
		try {
			query = "select * from produits where idProduit=?";
			
			pst = this.con.prepareStatement(query);
			pst.setInt(1, pId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Produits();
				row.setId(rs.getInt("idProduit"));
				row.setName(rs.getString("designation"));
				row.setCategory(rs.getString("descriptif"));
				row.setPrice(rs.getDouble("prixUHT"));
				row.setImage(rs.getString("imageProduit"));
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return row;
	}
	
	public Produits addProduct(String ref, String name, String category, double price, 
			String image, String active) {
		
		Produits produit = null;
		
		try {
			query = "insert into produits (ref, designation, descriptif,prixUHT, imageProduit,active) "
					+ "values (?,?,?,?,?,?)";
			
			pst = this.con.prepareStatement(query);
		
			pst.setString(1, ref);
			pst.setString(2, name);
			pst.setString(3, category);
			pst.setDouble(4, price);
			pst.setString(5, image);
			pst.setString(6, active);
			
			pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return produit;
	}
	
	
	public Produits deleteProduct(int id) {
		
		Produits produits=null;
		
		try {
			query = "delete from produits where idProduit=?";
			
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);//ds pst on place id à l'index 1
			pst.execute();//j'execute mon instruction
		
		
		}catch (SQLException e) {//catch=recupérer les exceptions
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return produits;
	}
	
	
	public Cart addToCartTotal(int product_id, String email) {
		Cart cart = null;
		int quantity = 1;
		double product_price = 0;
		double product_total = 0;
		double cart_total = 0;
		int z = 0;
		
		try {
			con = DbCon.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from produits where idProduit='"+product_id+"' ");
			
			while (rs.next()) {
				product_price= rs.getDouble(5);//"prixUHT"
				product_total = product_price;
			}
			
			ResultSet rs1 = st.executeQuery("select * from orders where idproducts='"+product_id+"' or email='"+email+"' and adresse is null");
			while(rs1.next()) {
				cart_total = rs1.getDouble(7);
				cart_total = cart_total + product_total;
				quantity = rs.getInt(4);
				quantity += 1;
				z = 1;
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		if(z==1) {
			try {
				st.executeUpdate("update orders set total='"+cart_total+"', quantité='"+quantity+"' where idproducts='"+product_id+"' or email='"+email+"' and adresse is null");
				System.out.println("Update in orders s'est fait avec du succès !");
				
			} catch (SQLException e) {
				//System.out.println(e);
				e.printStackTrace();
				System.out.println("Update in orders ne s'est pas fait !");
			}
		
		if(z==0) {
			try {
				PreparedStatement pst = con.prepareStatement("insert into orders (idProducts,quantité,price,total,email) values(?,?,?,?,?)");
				
				pst.setInt(2, product_id);
				pst.setInt(4, quantity);
				pst.setDouble(6, product_price);
				pst.setDouble(7, cart_total);
				pst.setString(19,email);
				
				pst.executeUpdate();
				
				System.out.println("Update in orders s'est fait avec du succès !");

			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Update in orders ne s'est pas fait !");

			}
		}
		}
		return cart;
	}
}
