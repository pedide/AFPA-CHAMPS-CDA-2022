package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.xprodmvc.model.Order;
import com.xprodmvc.model.Shoppingsession;

public class OrderItemDao {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderItemDao() {
		super();
	}

	public OrderItemDao(Connection con, String query, PreparedStatement pst, ResultSet rs) {
		super();
		this.con = con;
		this.query = query;
		this.pst = pst;
		this.rs = rs;
	}
	
	
	public OrderItemDao(Connection con) {
		this.con = con;
		
	}

	public Order insertintoOrderItem(int idOrder, int idProduct, int qte) {
		Shoppingsession shopping = null;

		try {
			query = "insert into orderitem(idOrder,idProduct,qte) values (?,?,?)";
			
			pst = this.con.prepareStatement(query);
			
			pst.setInt(1,idOrder);
			pst.setInt(2, idProduct);
			pst.setInt(3, qte);
			
			pst.executeUpdate();
			
			
		
			    
			
		

		} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
			
		return null;
	}
	

}
