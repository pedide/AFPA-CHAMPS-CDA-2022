package com.gaiaconsulting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.model.Cart;
import com.gaiaconsulting.model.Products;

public class ProductsDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;

	public ProductsDao(Connection con) {

		this.con = con;
	}

	public List<Products> getAllProducts() {

		List<Products> products = new ArrayList<Products>();

		try {
			query = "select * from produits";
			pst = this.con.prepareStatement(query);

			rs = pst.executeQuery();
			while (rs.next()) {
				Products row = new Products();
				row.setId(rs.getInt("IDPRODUIT"));
				row.setName(rs.getString("DESCRIPTIF"));
				row.setCategory(rs.getString("DESIGNATION"));
				row.setPrice(rs.getDouble("PRIXUHT"));
				row.setImage(rs.getString("IMAGE"));

				products.add(row);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}

		return products;
	}



	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
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
						row.setCategory(rs.getString("DESIGNATION"));
						row.setPrice(rs.getDouble("PRIXUHT") * item.getQuantity());
						row.setQuantity(item.getQuantity());

						products.add(row);
					}
				}
			}
		} catch (SQLException e) {

		}

		return products;
	}

public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum=0;
		
				try {
					if(cartList.size()>0) {
						for(Cart item : cartList) {
							query = "select PRIXUHT from produits where IDPRODUIT=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						sum += rs.getDouble("PRIXUHT")*item.getQuantity();
						
						}
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();	
			}
			
		
		
		return sum;
		
	}

public Products getSingleProduct(int pId) {
	Products row = null;
	try {
		query = "select * from produits where IDPRODUIT=?";
		
		pst = this.con.prepareStatement(query);
		pst.setInt(1, pId);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			
			row = new Products();
			row.setId(rs.getInt("IDPRODUIT"));
			row.setName(rs.getString("DESCRIPTIF"));
			row.setCategory(rs.getString("DESIGNATION"));
			row.setPrice(rs.getDouble("PRIXUHT"));
			row.setImage(rs.getString("IMAGE"));
		}
	}catch(Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return row;
}
public Products addProduct(String name, String category, double price, String image, String active) {
	Products product = null;
	try {
		query= "insert into produits (DESIGNATION, DESCRIPTIF,PRIXUHT, IMAGE, ACTIVE) values (?,?,?,?,?)";
		pst = this.con.prepareStatement(query);
		pst.setString(1, name);
		pst.setString(2, category);
		pst.setDouble(3, price);
		pst.setString(4, image);
		pst.setString(5, active);
		
		pst.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return product;
}

public Products deleteProduct(int id) {
	Products product = null; //j'initialise le produit a null
	try {
		query = "delete from produits where IDPRODUIT=?";
		pst = this.con.prepareStatement(query); //Je pr�pare mon instruction et je fais une variable pst
		pst.setInt(1, id);//une fois que j'ai pr�par� mon instruction, je met l'id a l'index 1 
		pst.execute(); 	//j'execute mon instruction
	}catch(Exception e){	//je r�cup�re 
		e.printStackTrace();
		System.out.println(e.getMessage());//j'affiche un msg dans la console
	}
	return product;
	}

public Cart addToCartTotal(int product_id, String email) {
	Cart cart = null;
	int quantity=1;
	double product_price=0;
	double product_total=0;
	double cart_total=0;
	int z=0;
	
	
	try {
		con = DbCon.getConnection();
		st = con.createStatement();
		rs = st.executeQuery("select * from produit where IDPRODUIT=?");
		while(rs.next()) {
			product_price = rs.getDouble(4);
			product_total = product_price;
		}
		ResultSet rs1 = st.executeQuery("select * from orders where IDPRODUIT='"+product_id+"' and email='"+email+"' and adress is null");
			while(rs1.next()) {
			cart_total = rs1.getDouble(7);
			cart_total = cart_total + product_total;
			quantity = rs.getInt(4);
			quantity +=1;
			z=1;
		}
	}catch(Exception e) {
		System.out.print(e);
	}if(z==1) {
		try {
			st.executeUpdate("Update orders set total ='"+cart_total+"',quantity='"+quantity+"',email= '"+email+"', where IDPRODUIT='"+product_id+"' and address is null");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}if(z==0) {
			PreparedStatement pst;
			try {
			pst = con.prepareStatement("insert into orders (idProduit,quantity,price,total,email)values (?,?,?,?,?)");
			pst.setInt(2, product_id);
			pst.setInt(4, quantity);
			pst.setDouble(6, product_price);
			pst.setDouble(7, cart_total);
			pst.setString(17, email);
			pst.executeUpdate();
			
			System.out.println("insert into orders successful !");
			
			}catch(SQLException e){
				e.printStackTrace();
				
				System.out.println("insert into orders failed !");

			}
		} 
		
	return cart;
	
			
}
	
}
