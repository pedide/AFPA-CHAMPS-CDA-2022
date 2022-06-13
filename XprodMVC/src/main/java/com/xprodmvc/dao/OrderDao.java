package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import com.xprodmvc.model.Order;
import com.xprodmvc.model.Product;
import com.xprodmvc.model.Shoppingsession;

public class OrderDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;//pour stocker les resultet
	
	
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}

	/*
	 * public boolean insertOrder(Order model) { boolean result = false;
	 * 
	 * 
	 * 
	 * String adress = null; String city = null; String ville = null; String pays =
	 * null; String mobileNum = null; String deliveryDate = null;
	 * 
	 * try {
	 * 
	 * query =
	 * "insert into commande (idClient, total,adress, city, ville, mobileNum, pays, deliveryDate)values(?,?,?,?,?,?,?,?,?)"
	 * ;
	 * 
	 * pst = this.con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS); 
	 * //pst= this.con.prepareStatement(query);
	 * 
	 * 
	 * pst.setInt(1, model.getUid()); pst.setDouble(3, model.getTotal());
	 * pst.setString(4, adress); pst.setString(5, city); pst.setString(6, ville);
	 * pst.setString(7, pays); pst.setString(8, mobileNum); pst.setString(9,
	 * deliveryDate);
	 * 
	 * 
	 * pst.executeUpdate(); result = true;
	 * 
	 * 
	 * } catch (SQLException e) {
	 * 
	 * System.out.println(e.getMessage()); }
	 * 
	 * return result; }
	 */
	/*

	 */

	public void cancelOrder(int id) {
		try {
			query = "delete from orders where oid=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		} catch ( SQLException e) {
			
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	
	}

	public Order insertOrder(int idClient, double total, String adress, String city, String ville, String pays, String mobileNum,String deliveryDate,String date1) {
		Order ord =null;
		
		try {
			
			query = "insert into orders (idClient,total, adress,city, ville, mobileNumer, pays, deleveryDate, dateCommande)values(?,?,?,?,?,?,?,?,?)";
			
			pst = this.con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			//pst = this.con.prepareStatement(query);
			//pst = this.con.prepareStatement(query);
			
			
			pst.setInt(1, idClient);
			pst.setDouble(2, total);		
			pst.setString(3, adress);
			pst.setString(4, city);
			pst.setString(5, ville);
			pst.setString(6, mobileNum);		
			pst.setString(7, pays);
			pst.setString(8, deliveryDate);
			pst.setString(9, date1);
			
			
			pst.executeUpdate();
			ResultSet result = pst.getGeneratedKeys();
			
			int idOrder;
			if (result.next()) {
			    idOrder = result.getInt(1);
			    System.out.println("ID orders est: " + idOrder);
		    ord = new Order();
			ord.setIdOrder(idOrder);
			ord.setTotal(total);
			ord.setAdress(adress);
			ord.setCity(city);
			ord.setVille(ville);
			ord.setMobileNumber(mobileNum);
			ord.setPays(pays);
			ord.setDeleveryDate(deliveryDate);
				
			

			}} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
			
		
		return ord;
	}
	
	  public List<Order> userOrders(int id){
	 
	  List<Order>list = new ArrayList<>(); try { query =
	  "select * from orders where uid=? order by orders.oid desc"; pst =
	  this.con.prepareStatement(query); pst.setInt(1, id); rs = pst.executeQuery();
	  
	  while(rs.next()) { Order order = new Order(); ProductDao productDao = new
	  ProductDao (this.con);
	  
	  int pId = rs.getInt("pid"); Product product =
	  productDao.getSingleProduct(pId);
	  
	  order.setIdOrder(rs.getInt("oid")); order.setId(pId);
	  order.setNom(product.getNom()); order.setCategorie(product.getCategorie());
	  order.setPrix(product.getPrix());// order.setQuantite(rs.getInt("quantite"));
	  //order.setDate(rs.getString("date")); 
	  order.setTotal(rs.getDouble("total"));
	  order.setPrix(rs.getDouble("prix"));
	  
	  list.add(order); } }catch(Exception e) { e.printStackTrace();
	  System.out.println(e.getMessage()); }
	  
	  return list;
	  
	  }
}
