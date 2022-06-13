 package com.projetafpa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.projetafpa.connection.DbCon;
import com.projetafpa.model.Cart;
import com.projetafpa.model.Product;

public class ProductDao {
	private Connection con;
	
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	public ProductDao(Connection con) {
		this.con = con;
	}

public List<Product> getAllProducts(){
	List<Product> products = new ArrayList<Product>();

	try {
	query = "select * from products";
	pst = this.con.prepareStatement(query);
	rs = pst.executeQuery();
	
	while (rs.next()) {
		Product row = new Product();
		row.setId(rs.getInt("id"));
		row.setName(rs.getString("name"));
		row.setCategory(rs.getString("category"));
		row.setPrice(rs.getDouble("price"));
		row.setImage(rs.getString("image"));
		
		products.add(row);
		
	}
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	return products;

}

public List<Cart> getCartProducts(ArrayList<Cart> cartList){
	
	List<Cart> products = new ArrayList<>();
	try {
	if(cartList.size() >0 ) { 
		
		for(Cart item : cartList)
		{
			query = "select * from produit where idProd=?";
			
				pst = this.con.prepareStatement(query);
				pst.setInt(1, item.getId());
				rs = pst.executeQuery();
				
				while(rs.next()) {
					
					Cart row = new Cart();
					row.setId(rs.getInt("id"));
					row.setName(rs.getString("name"));
					row.setCategory(rs.getString("category"));
					row.setPrice(rs.getDouble("price")*item.getQuantity());
					row.setQuantity(item.getQuantity());
					
					products.add(row);
				}
		}
	}
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		
	
	return products;
	
}

public double getTotalCartPrice(ArrayList<Cart> cartList) {
	
double sum=0;

	try {
		
		if(cartList.size() >0) {
			for(Cart item : cartList) {
			query = "select prixVenteUHTProd from produit where idProd=?";
		pst = this.con.prepareStatement(query);
		pst.setInt(1, item.getId());
		rs = pst.executeQuery();
		while(rs.next()) {
			sum += rs.getDouble("prixVenteUHTProd")*item.getQuantity();
		}
		}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
return sum;
	
}


public Product getSingleProduct(int pId) {
	Product row = null;
	try {
		query = "select * from products where id=?";
		
		pst = this.con.prepareStatement(query);
		pst.setInt(1, pId);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			row = new Product();
			row.setId(rs.getInt("id"));
			row.setName(rs.getString("name"));
			row.setCategory(rs.getString("category"));
			row.setPrice(rs.getDouble("price"));
			row.setImage(rs.getString("image"));
		}
	}catch(Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
		

		
		
	}
	return row;
}


public Product addProduct(String  name, String category, double price, String image, String active) {
	
	Product product = null;
	try {
		query ="insert into products(name, category, price, image, active) values(?,?,?,?,?)";
		pst = this.con.prepareStatement(query);
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

public Product deleteProduct(int id) {
	Product product = null; // j'initialise le produit en null
	try {
		query = "delete from produit where id=?";
		pst= this.con.prepareStatement(query); // je prepare mon instruction
		pst.setInt(1, id); // je place mon id à l'index 1
		pst.execute();
	}catch (Exception e) {
		e.printStackTrace(); // je recupère l'exception
		System.out.println(e.getMessage());
	} 
	return product;
}

public Cart addToCartTotal (int product_id, String email) {
	Cart cart = null;
	int quantity = 1;
	double product_price = 0;
	double product_total = 0;
	double cart_total = 0;
	
	
	
	int z=0;
	try {
		con = DbCon.getConnection();
		st=con.createStatement();
		rs = st.executeQuery("select * from products where id='"+product_id+"'");
		while (rs.next()){ //tant que j'ai des données dans le resultSet
			product_price = rs.getDouble(5);
			product_price = product_price;
			
		}
		ResultSet rs1 = st.executeQuery("select * from orders where idProduit ='"+product_id+"'and email='"+email+"' adress is NULL");
		while(rs1.next()) {
			cart_total = rs1.getDouble(7);
			cart_total = cart_total + product_total;
			quantity = rs1.getInt(4);
			quantity +=1;
			z=1;
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	if(z==1) {
		try{
		st.executeUpdate("update orders set total='"+cart_total+"',quantity='"+quantity+"', idProduit='"+product_id+"'and adress is NULL");
		System.out.println("insert in orders successuful");
	}catch (Exception e) {
		System.out.println(e);
		e.printStackTrace();
		System.out.println("update in orders failed !");
	}
}
	if (z==0) {
		try {
		PreparedStatement pst = con.prepareStatement("insert into orders(idProduit,quantity,price,total,email)values(?,?,?,?,?)");
		pst.setInt(2,product_id);
		pst.setInt(4, quantity);
		pst.setDouble(4, product_price);
		pst.setDouble(6, cart_total);
		pst.setString(17, email);
		pst.executeUpdate();
		System.out.println("insert in orders successuful");
		
	
	}catch (Exception e) {
		e.printStackTrace();
		System.out.println("insert in order failed");

	return cart;
	}
}
	return cart;
}
}
