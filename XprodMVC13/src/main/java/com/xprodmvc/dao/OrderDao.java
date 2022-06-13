package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.model.Order;
import com.xprodmvc.model.Produits;

public class OrderDao {
			
		private Connection con;
		private String query;
		private PreparedStatement pst;
		private ResultSet rs;//pr stocker le resultat
		
		
		public OrderDao(Connection con) {
			super();
			this.con = con;
		}
		
		public boolean insertOrder(Order model) {
			boolean result = false;
			try{
				query = "insert into orders (idproducts, idusers, quantité, dateOrders, price, total, email)values(?, ?, ?, ?,? ,?, ?)";
						
				pst = this.con.prepareStatement(query);
				
				pst.setInt(1, model.getId());
				pst.setInt(2, model.getUid());
				pst.setInt(3, model.getQuantity());
				pst.setString(4, model.getDate());
				pst.setDouble(5, model.getPrice());
				pst.setDouble(6, model.getTotal());
				pst.setString(7, model.getEmail());
				
				
				pst.executeUpdate();
				result = true;
				
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			return result;
		}
		
		public List<Order> userOrders(int id){
			List<Order> list = new ArrayList<>();
			try{
				query = "select * from orders where idusers=? order by orders.idorders desc";
				
				pst = this.con.prepareStatement(query);
				pst.setInt(1, id);
				rs = pst.executeQuery();
				
				//on va parcourir la table de resultat
				while (rs.next()) {
					Order order = new Order();
					ProductsDao productDao = new ProductsDao(this.con);
					
					int pId = rs.getInt("idproducts");
					Produits product = productDao.getSingleProduct(pId);
					
					order.setOrderId(rs.getInt("idorders"));
					order.setId(pId);
					order.setName(product.getName());
					order.setCategory(product.getCategory());
					order.setPrice(product.getPrice());
					order.setQuantity(rs.getInt("quantité"));
					order.setDate(rs.getString("dateOrders"));
					order.setTotal(rs.getDouble("total"));
					
					list.add(order);
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return list;
		}
		
		public void cancelOrder(int id) {
			try {
				query = "delete from orders where idorders=?";
				
				pst = this.con.prepareStatement(query);
				pst.setInt(1, id);
				pst.execute();
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
}

