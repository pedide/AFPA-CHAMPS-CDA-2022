package com.xprodmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.model.Order;
import com.xprodmvc.model.Product;

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
			query = "insert into orders (idProd,idUser,quantite,commandedate)" + "value(?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getIdProd());
			pst.setInt(2, model.getIdUser());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.executeUpdate();
			result = true;
			System.out.println("Order inserted !");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<>();
		try {
			query = "select * from orders where idUser=? order by orders.idOrder desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {

				Order order = new Order();
				ProductsDao pDao = new ProductsDao(DbCon.getConnection());
				int pId = rs.getInt("idProd");
				Product product = pDao.getSingleProduct(pId);
				order.setIdOrder(rs.getInt("idOrder"));
				order.setIdProd(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice());
				order.setQuantity(rs.getInt("quantite"));
				order.setDate(rs.getString("commandedate"));

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;

	}

	public void cancelOrder(int id) {
		try {
			query = " delete from orders where idOrder=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}
}