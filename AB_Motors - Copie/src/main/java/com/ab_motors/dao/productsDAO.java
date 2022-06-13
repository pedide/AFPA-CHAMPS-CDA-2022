package com.ab_motors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ab_motors.connection.dbCon;
import com.ab_motors.model.*;

public class productsDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public productsDAO(Connection con) {
		this.con = con;
	}

	/*
	 * public productsDAO(Connection con, String query, PreparedStatement pst,
	 * ResultSet rs) { this.con = con; this.query = query; this.pst = pst; this.rs =
	 * rs; }
	 */
	public productsDAO() {
	}

	public List<products> getAllProducts() {
		List<products> products = new ArrayList<products>();
		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();

			while (rs.next()) {
				products row = new products();
				row.setIDPROD(rs.getInt("idproducts"));
				row.setNOM(rs.getString("nom"));
				row.setCATEGORIE(rs.getString("categorie"));
				row.setPRIX(rs.getDouble("prix"));
				row.setIMAGE(rs.getString("image"));

				products.add(row);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public List<cart> getCardProducts(ArrayList<cart> cardlist) {
		List<cart> products = new ArrayList<>();
		try {
			if (cardlist.size() > 0) {

				for (cart item : cardlist) {

					query = "select * from products where idproducts=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIDPROD());
					rs = pst.executeQuery();
					while (rs.next()) {

						cart row = new cart();
						row.setIDPROD(rs.getInt("idproducts"));
						row.setNOM(rs.getString("nom"));
						row.setCATEGORIE(rs.getString("categorie"));
						row.setIMAGE(rs.getString("image"));
						row.setPRIX(rs.getDouble("prix") * item.getQUANTITY());
						row.setQUANTITY(item.getQUANTITY());

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

	public double getTotalCartPrice(ArrayList<cart> cartlist) {
		double sum = 0;

		try {
			if (cartlist.size() > 0) {
				for (cart item : cartlist) {
					query = "select prix from products where idproducts=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getIDPROD());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("prix") * item.getQUANTITY();
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}

	public products getSingleProduct(int pID) {
		products row = null;
		try {
			query ="select * from products where idproducts=?";
			
			pst = this.con.prepareStatement(query);
			pst.setInt(1, pID);
			ResultSet rs =pst.executeQuery();
			
			while(rs.next()) {
				row = new products();
				row.setIDPROD(rs.getInt("idproducts"));
				row.setNOM(rs.getString("nom"));
				row.setCATEGORIE(rs.getString("categorie"));
					row.setPRIX(rs.getDouble("prix"));
					row.setIMAGE(rs.getString("image"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return row;
	}

	public products addProduct(String name, String category, double price, String image, String active) {
	    products product = null;
	    
	    try {
	    	query = "insert into products(nom,categorie,prix,image,active) values(?,?,?,?,?)";
	    	pst= this.con.prepareStatement(query);
	    	
	    	pst.setString(1, name);
	    	pst.setString(2, category);
	    	pst.setDouble(3, price);
	    	pst.setString(4, image);
	    	pst.setString(5, active);
	    	
	    	pst.executeUpdate();
	    	
	    
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	System.out.println(e.getMessage());
	    }
		return product;
	}
	
	public cart addToCartTotal(int product_id, String email) {
		cart cart = null;
		int quantity=1;
		double product_price=0;
		double product_total =0;
		double cart_total=0;
		
		int z=0;
		
		try {
			con = dbCon.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from products where idproducts='"+product_id+"'");
			while (rs.next()) {
				product_price = rs.getDouble(4);
				product_total = product_price;
			}
			ResultSet rs1 = st.executeQuery("select * from orders where idproducts ='"+product_id+"' and email='"+email+"'");
			while(rs1.next()) {
				cart_total= rs1.getDouble(7);
				cart_total = cart_total + product_total;
				quantity = rs.getInt(4);
				quantity +=1;
				z=1;
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		if(z==1) {
			try {
				st.executeUpdate("update orders set total='"+cart_total+"', quantity='"+quantity+"' where idproducts='"+product_id+"'");
			    System.out.println("update in orders sucessfull !");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("update in orders failed !");
			}
		}
		if(z==0) {
			try {
		        PreparedStatement pst = con.prepareStatement("insert into orders(idproducts,quantity, price, total,email) values(?,?,?,?,?)");
		        pst.setInt(2, product_id);
		        pst.setInt(4, quantity);
		        pst.setDouble(6, product_price);
		        pst.setDouble(7, cart_total);
		        pst.setString(17, email);
		        pst.executeUpdate();
		        System.out.println("insert in orders successfull !");
		        
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("insert in orders failed !");
			}
			}
		
		return cart;
	}
}