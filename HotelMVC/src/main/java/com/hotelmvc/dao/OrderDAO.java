package com.hotelmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hotelmvc.dao.RoomDAO;
import com.hotelmvc.model.Order;
import com.hotelmvc.model.Room;

public class OrderDAO {

	
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private String query;

	public OrderDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(Order model) {

		boolean result = false;
		try {
			query = "INSERT INTO orders(idproduit, idUsers, quantity, dateOrders, price, total, email)VALUES(?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getRoomId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			pst.setDouble(5, model.getPrice());
			pst.setDouble(6, model.getTotal());
			pst.setString(7, model.getEmail());

			pst.executeUpdate();
			result = true;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<>();
		try {
			query = "select * from orders where idUsers=? order by orders.idOrders desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			
			rs = pst.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				RoomDAO roomDAO = new RoomDAO(this.con);
				int pId = rs.getInt("idProduit");
				
				Room room = roomDAO.getSingleRoom(pId);

				order.setOrderId(rs.getInt("idOrders"));
				order.setRoomId(pId);
				order.setRoomName(room.getRoomName());
				order.setRoomCategory(room.getRoomCategory());
				order.setRoomPrice(room.getRoomPrice());
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("dateOrders"));
	

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
			query = "DELETE FROM orders WHERE idOrders=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public List<Order> getAllSearchOrders(String search) {

		List<Order> orders = new ArrayList<Order>();
		try {
			query = "SELECT * FROM orders WHERE idUsers = '"+search+"' OR idproduit= '"+search+"' OR email= '"+search+"'";
			System.out.println(query);
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {

				Order row = new Order();
				row.setOrderId(rs.getInt("idOrders"));
				row.setRoomId(rs.getInt("idProduit"));
				row.setUid(rs.getInt("idUsers"));
				row.setQuantity(rs.getInt("quantity"));
				row.setDate(rs.getString("dateOrders"));
				row.setPrice(rs.getDouble("price"));
				row.setTotal(rs.getDouble("total"));
				row.setEmail(rs.getString("email"));

				orders.add(row);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return orders;
	}
}
