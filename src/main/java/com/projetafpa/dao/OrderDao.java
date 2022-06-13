package com.projetafpa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projetafpa.dao.ProductDao;
import com.projetafpa.model.Order;
import com.projetafpa.model.Product;

public class OrderDao {
	private Connection con;
	

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public boolean insertOrder(Order model) {
		boolean result = false;
		
		try {
			query = "insert into orders(idProduit,idUsers, quantity, dateOrders,price,total,email)"
					+"values (?,?,?,?,?;?)";
			pst= this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getOrderId());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.setDouble(6, model.getPrice());
			pst.setDouble(7, model.getTotal());
			pst.setString(8, model.getEmail());
			
			pst.executeUpdate();
			result = true;
			System.out.println("données insérées");
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
		
		
	}
	public List <Order> userOrders (int id){
		
		List<Order> list = new ArrayList<>();
		try {
			query = "select* from orders where idUsers=? order by orders.idOrders desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()){
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("idProduit");
				Product product = productDao.getSingleProduct(pId);
				
				order.setOrderId(rs.getInt("idOrders"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice());
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("dateOrders"));
				order.setTotal(rs.getDouble("total"));
				
				list.add(order);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	
}
	public void cancelOrder(int id) {
		try {
		query = "delete from orders where idOrders=? ";
		pst = this.con.prepareStatement(query);
		pst.setInt(1, id);
		pst.execute();
				
				
	}catch(SQLException e){
		e.printStackTrace();
	
	}
}
}

