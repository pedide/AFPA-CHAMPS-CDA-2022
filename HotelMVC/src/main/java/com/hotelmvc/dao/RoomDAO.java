package com.hotelmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hotelmvc.model.Room;
import com.hotelmvc.model.Cart;
import com.hotelmvc.model.Favorites;


public class RoomDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	
	public RoomDAO(Connection con) {
		this.con = con;
	}
	
	// Read
	public List<Room> getAllRooms() {

		List<Room> room = new ArrayList<Room>();
		try {
			query = "SELECT * FROM room";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {

				Room row = new Room();
				row.setRoomId(rs.getInt("roomId"));
				row.setRoomName(rs.getString("roomName"));
				row.setRoomCategory(rs.getString("roomCategory"));
				row.setRoomTitleDescription(rs.getString("roomTitleDescription"));
				row.setRoomDescription(rs.getString("roomDescription"));
				row.setRoomPrice(rs.getDouble("roomPrice"));
				row.setRoomImage(rs.getString("roomImage"));
				row.setRoomQuantity(rs.getInt("roomQuantity"));
				row.setRoomIsActive(rs.getString("roomIsActive"));

				room.add(row);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return room;
	}
	



	public List<Favorites> getFavRooms(ArrayList<Favorites> favList) {
		List<Favorites> favRooms = new ArrayList<>();
		try {
			// Si mon panier n'est pas vide je lance une boucle
			if (favList.size() > 0) {
				for (Favorites item : favList) {
					query = "SELECT * FROM room WHERE roomId=?";

					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getRoomId());
					rs = pst.executeQuery();// mettre dans un tableau de resultat il ne reste plus qu a faire notre while
											

					// rs.next = boucle tant que j ai des donnees dans mon tableau des resulats
					while (rs.next()) {
						Favorites row = new Favorites();
						row.setRoomId(rs.getInt("roomId"));
						row.setRoomName(rs.getString("roomName"));
						row.setRoomCategory(rs.getString("roomCategory"));
						row.setRoomPrice(rs.getDouble("roomPrice"));
						row.setRoomImage(rs.getString("roomImage"));
						row.setFavQuantity(item.getFavQuantity());
						System.out.println("Quantity of item(Rooms) added as favorites from RoomDAO = [ " + item.getFavQuantity() + " ] ligne113");

						// Je rajoute a ma liste de produits la ligne (row) de tous mes produits
						favRooms.add(row);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favRooms;
	}
	
	public List<Cart> getCartRooms(ArrayList<Cart> cartList) {
		List<Cart> cartRooms = new ArrayList<>();
		try {
			// Si mon panier n'est pas vide je lance une boucle
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "SELECT * FROM room WHERE roomId=?";

					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getRoomId());
					rs = pst.executeQuery();// mettre dans un tableau de resultat il ne reste plus qu a faire notre while
											

					// rs.next = boucle tant que j ai des donnees dans mon tableau des resulats
					while (rs.next()) {
						Cart row = new Cart();
						row.setRoomId(rs.getInt("roomId"));
						row.setRoomName(rs.getString("roomName"));
						row.setRoomCategory(rs.getString("roomCategory"));
						row.setRoomPrice(rs.getDouble("roomPrice"));
						row.setRoomImage(rs.getString("roomImage"));
						row.setCartQuantity(item.getCartQuantity());
						System.out.println("Quantity of item(Rooms) added as favorites from RoomDAO = [ " + item.getCartQuantity() + " ] ligne113");

						// Je rajoute a ma liste de produits la ligne (row) de tous mes produits
						cartRooms.add(row);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartRooms;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "SELECT roomPrice FROM room WHERE roomId=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getRoomId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("roomPrice") * item.getRoomQuantity();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}
	public Room getSingleRoom(int rId) {
		Room row = null;
		try {
			query = "SELECT * FROM room WHERE roomId=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, rId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				row = new Room();
				row.setRoomId(rs.getInt("roomId"));
				row.setRoomName(rs.getString("roomName"));
				row.setRoomCategory(rs.getString("roomCategory"));
				row.setRoomDescription(rs.getString("roomDescription"));
				row.setRoomPrice(rs.getDouble("roomPrice"));
				row.setRoomImage(rs.getString("roomImage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());

		}

		return row;
	}
	
	//ADMIN
	public Room addRoomADMIN(String name, String category, double price, String image, String active) {

		Room product = null;
		try {
			query = "INSERT INTO room (roomName, roomCategory, roomPrice, roomImage, roomIsActive)VALUES(?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, category);
			pst.setDouble(3, price);
			pst.setString(4, image);
			pst.setString(5, active);

			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return product;
	}
	

	public void deleteRoomADMIN(int id) {

		//String product = null;
		try {
			query = "DELETE FROM room WHERE roomId=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}
}
