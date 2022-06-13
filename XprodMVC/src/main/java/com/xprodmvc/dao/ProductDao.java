package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Product;
import com.xprodmvc.model.User;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public ProductDao(Connection con) {

		this.con = con;
	}

	public List<Product> getAllProducts() {

		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setNom(rs.getString("reference"));
				/* row.setDesignation(rs.getString("designation")); */
				row.setCategorie(rs.getString("descriptif"));
				row.setPrix(rs.getDouble("prix"));
				row.setImage(rs.getString("image"));

				products.add(row);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();

		}
		return products;
	}

	public Connection getCon() {
		return con;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select*from products where id=?";

					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();

					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setNom(rs.getString("reference"));
						row.setCategorie(rs.getString("descriptif"));
						row.setPrix(rs.getDouble("prix") * (item.getQuantite()));
						row.setQuantite(item.getQuantite());
                       // row.setPrix(rs.getDouble("prix"));
                        
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
			/* si il ya des elements dans ma cartList */
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select prix from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
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


	public void setCon(Connection con) {
		this.con = con;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public PreparedStatement getPst() {
		return pst;
	}

	public void setPst(PreparedStatement pst) {
		this.pst = pst;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public Product getSingleProduct(int pId) {
	
		Product row = null;
		try {
			
			query = "select * from products where id=?";
			
			pst = this.con.prepareStatement(query);//je me connect et je recuppere ma requete
			pst.setInt(1,  pId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setNom(rs.getString("reference"));
				row.setCategorie(rs.getString("descriptif"));
				row.setPrix(rs.getDouble("prix"));
				row.setImage(rs.getString("image"));
				
				
			}
			
			
		}catch(Exception e) {
			
			 System.out.println(e.getMessage());
				
		}
		return row;
	}

	public Product addProduct (String nom, String designation ,String categorie, double prix, String image, String active) { 

	Product product = null;
	try {
		query ="insert into products (reference,designation, descriptif, prix, image, active)value(?,?,?,?,?,?) ";
		
		pst = this.con.prepareStatement(query);
		pst.setString(1, nom);
		pst.setString(2, designation);
		pst.setString(3, categorie);
		pst.setDouble(4, prix);
		pst.setString(5, image);
		pst.setString(6, active);
		
		pst.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return product;
	}
	

	public Product deleteProduct (int id) {
		//Product product = null;
		
		try {
			query = "delete from products where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);//place id dans l'index 1
			pst.execute();//j'excute ma prepa
			
		} catch ( SQLException e) {//recuppere l'exception 
			
			e.printStackTrace();//
			System.out.println(e.getMessage());
		}
		return null;//produit null
	
	//return product;

	
	}
	public Cart addToCartTotal(int product_id, String email) {
		Cart cart = null;
		int quantite = 1;
		double product_price=0;
		double product_total=0;
		double cart_total=0;
		
		int z=0;
		try {
			con=DBCon.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select * from products where id='"+product_id+"'");
			while(rs.next()) {
				product_price = rs.getDouble(4);
				product_total=product_price;
			}
			ResultSet rs1=st.executeQuery("select * from orders where pid='"+product_id+"' and email='"+email+"' and adress is null");
			while(rs1.next()) {
				cart_total = rs1.getDouble(7);
				cart_total = cart_total + product_total ;
				quantite = rs.getInt(4);
				quantite+=1;
				z=1;
			}
		}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		if(z==1) {
			try {
			st.executeUpdate("update orders set total='"+cart_total+"' , quantite='"+quantite+"' where  pid='"+product_id+"' and email='"+email+"' and adress is null ");
			System.out.println("update in  orders successful !");
			}catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			System.out.println("update in  orders failed !");
		}
			if(z==0) {
				try {
					PreparedStatement pst = con.prepareStatement("insert into orders (id, quantite,prix, total, email)values(?,?,?,?,?) ");
				pst.setInt(2, product_id);
				pst.setInt(4, quantite);
				pst.setDouble(6, product_price);
				pst.setDouble(7, cart_total);
				pst.setString(17, email);
				
				pst.executeUpdate();
				
				System.out.println("insert into orders successful  !");
				
				} catch (SQLException e) {
					
					e.printStackTrace();
					System.out.println("insert into orders failed !");
				}
			}
		
		
	}
		return cart;
	}
	

	/*
	 * public User editProfil (int user_id, String email) {
	 * 
	 * User user = null; int z;
	 * 
	 * try { ResultSet rs1=st.executeQuery("select * from user where iduser='"
	 * +user_id+"' and email='"+email+"' "); while(rs1.next()) {
	 * 
	 * z=1; } }catch(Exception e) { System.out.println(e); e.printStackTrace(); }
	 * if(z==1) {
	 * 
	 * st.executeUpdate("update user set username='"+name+"' , mobileNum='"
	 * +mobileNum+"' where  iduser='"+user_id+"' and securiteQuestion='"
	 * +securiteQuestion+"' and answer='"+reponse+"' ");
	 * System.out.println("update in  orders successful !");
	 * 
	 * System.out.println("update in  orders failed !"); } return user; }
	 */
}