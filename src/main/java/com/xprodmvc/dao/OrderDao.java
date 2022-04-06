package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.model.Order;
import com.xprodmvc.model.Product;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst; //
	private ResultSet rs; // pour stocker le résultat
	
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		try {
			query = "insert into orders (idProduct, idUsers, quantity, dateOrders) values (?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			
			pst.executeUpdate(); //update car j'insert des données
			result = true;
		}catch(Exception e ) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public List<Order> userOrders(int id){
		
		List<Order> list = new ArrayList<>();
		try {
			query = "select * from orders where idUsers=? order by orders.idOrders desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("idProduct");
				Product product = productDao.getSingleProduct(pId);
				
				order.setOrderId(rs.getInt("idOrders"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategorie(product.getCategorie());
				order.setPrixU(product.getPrixU());
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("dateOrders"));
				
				list.add(order);
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public void cancelOrder(int id) {
		try{
			query = "delete from orders where idOrders = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}
}
