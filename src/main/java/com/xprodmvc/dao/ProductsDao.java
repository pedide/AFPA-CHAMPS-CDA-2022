package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.model.*;

public class ProductsDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public ProductsDao(Connection con) {
		this.con = con;
	}

	/*
	 * public ProductsDao(Connection con, String query, PreparedStatement pst,
	 * ResultSet rs) { this.con = con; this.query = query; this.pst = pst; this.rs =
	 * rs;
	 * 
	 * }
	 */

	public ProductsDao() {
	}

	public List<Product> getAllProducts() {
		List<Product> produits = new ArrayList<Product>();
		try {
			query = "select * from produits";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				Product row = new Product();
				row.setIdProd(rs.getInt("idProd"));
				row.setName(rs.getString("nom"));
				row.setCategory(rs.getString("categorie"));
				row.setPrice(rs.getDouble("prix"));
				row.setImage(rs.getString("image"));

				produits.add(row);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return produits;
	}

	public List<Cart> getCartProduct(ArrayList<Cart> cartlist) {
		List<Cart> produits = new ArrayList<>();
		try {
			if (cartlist.size() > 0) {

				for (Cart item : cartlist) {

					query = "select * from produits where idProd=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIdProd());
					rs = pst.executeQuery();
					while (rs.next()) {

						Cart row = new Cart();
						row.setIdProd(rs.getInt("idProd"));
						row.setName(rs.getString("nom"));
						row.setCategory(rs.getString("categorie"));
						row.setImage(rs.getString("image"));
						row.setPrice(rs.getDouble("prix") * item.getQuantite());
						row.setQuantite(item.getQuantite());

						produits.add(row);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return produits;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {

		double sum = 0;
		try {
			if (cartList.size() > 0) {

				for (Cart item : cartList) {
					query = "select PRIX from produits where IdProd=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIdProd());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("prix") * item.getQuantite();
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sum;
	}

	public Product getSingleProduct(int pId) {
		Product row = null;
		try {
			query = "select * from produits where idProd=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, pId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				row = new Product();
				row.setIdProd(rs.getInt("idProd"));
				row.setName(rs.getString("nom"));
				row.setCategory(rs.getString("categorie"));
				row.setPrice(rs.getDouble("prix"));
				row.setImage(rs.getString("image"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return row;
	}
public Product addProduct(String nom, String categorie, String prix,String image,String active) {
		
		Product product= null;
		try {
			query="insert into produits(nom,categorie,prix,image,active)values(?,?,?,?,?)";
			pst= this.con.prepareStatement(query);

			pst.setString(1, nom);
			pst.setString(2, categorie);
			pst.setString(3, prix);
			pst.setString(4, image);
			pst.setString(5, active);
			
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return product;
	}
public Product addtoCartTotal(int product_id,String email) {
	System.out.println("t'es bien dans la servlet addtocartottal");
	Cart cart = null;
	int quantite =1;
	double product_price=0;
	double product_total=0;
	double cart_total=0;
	int z=0;
	try {
		con= DbCon.getConnection();
		st=con.createStatement();
		rs=st.executeQuery("select * from produits where idProd='"+product_id+"'");
		while(rs.next()) {
			product_price = rs.getDouble(4);
			product_total=product_price;
		}
		ResultSet rs1=st.executeQuery("select * from orders where idProd='"+product_id+"'and email='"+email+"'and adresse is null");
		while(rs1.next()) {
			cart_total =rs1.getDouble(7);
			cart_total=cart_total + product_total;
			quantite = rs.getInt(4);
			quantite+=1;
			z=1;
			
		}
	}catch(Exception e) {
	System.out.println(e);
	e.printStackTrace();
	}
	if(z==1){
		try {
			st.executeUpdate("update orders set total='"+cart_total+"',quantite='"+quantite+"'where idProd='"+product_id+"'and email='"+email+"'and adress is null");
			System.out.println("update in orders successful!");
		}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			System.out.println("update in orders failed");
			}
	}
	if(z==0) {
		try {
			PreparedStatement pst = con.prepareStatement("insert into orders (id, quantite, prix, total, email) values (?,?,?,?,?)");
			pst.setInt(2, product_id);
			pst.setInt(4, quantite);
			pst.setDouble(6, product_price);
			pst.setDouble(7, cart_total);
			pst.setString(17, email);
			
			pst.executeUpdate();
			System.out.println("insert into orders successful");
			
		}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			System.out.println("update in orders failed");
			}
	}
	return cart;
	
}
}
