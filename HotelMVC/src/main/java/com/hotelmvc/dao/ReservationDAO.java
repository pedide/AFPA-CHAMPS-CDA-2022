package com.hotelmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hotelmvc.model.Reservation;
import com.hotelmvc.model.Room;
import com.hotelmvc.connection.DbCon;
import com.hotelmvc.model.Cart;

public class ReservationDAO {

	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private String query;
	private Statement st;

	public ReservationDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertReservationPending(Reservation model) {

		boolean result = false;
		try {
			query = "INSERT INTO reservation_pending(room_idRoom, user_uid, quantity_night, price, email, lastname, firstname, mobile_number, address, cp, city, state, country)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getRoomId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setDouble(4, model.getPrice());
			pst.setString(5, model.getEmail());
			pst.setString(6, model.getLastname());
			pst.setString(7, model.getResaFirstname());
			pst.setString(8, model.getMobileNumber());
			pst.setString(9, model.getAddress());
			pst.setString(10, model.getCp());
			pst.setString(11, model.getCity());
			pst.setString(12, model.getState());
			pst.setString(13, model.getCountry());

			pst.executeUpdate();
			result = true;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public boolean insertReservationOrder(Reservation model) {

		boolean result = false;
		try {
			query = "INSERT INTO reservation_order(room_idRoom, user_uid, quantity_night, price, email, lastname, firstname, mobile_number, address, cp, city, state, country, check_in_client_firstname, check_in_client_lastname, check_in_client_email,check_in_client_mobileNumber, total_price )VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getRoomId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setDouble(4, model.getPrice());
			pst.setString(5, model.getEmail());
			pst.setString(6, model.getLastname());
			pst.setString(7, model.getResaFirstname());
			pst.setString(8, model.getMobileNumber());
			pst.setString(9, model.getAddress());
			pst.setString(10, model.getCp());
			pst.setString(11, model.getCity());
			pst.setString(12, model.getState());
			pst.setString(13, model.getCountry());
			pst.setString(14, model.getCheckInFirstname());
			pst.setString(15, model.getCheckInLastname());
			pst.setString(16, model.getCheckInEmail());
			pst.setString(17, model.getcheckInMobileNumber());
			pst.setDouble(18, model.getTotal());

			pst.executeUpdate();
			result = true;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public List<Reservation> userReservation(int id) {
		List<Reservation> list = new ArrayList<>();
		try {
			query = "select * from reservation_pending where idUsers=? order by orders.id_reservation desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);

			rs = pst.executeQuery();

			while (rs.next()) {
				Reservation resa = new Reservation();
				RoomDAO roomDAO = new RoomDAO(this.con);
				int rId = rs.getInt("roomId");

				Room room = roomDAO.getSingleRoom(rId);

				resa.setReservationId(rs.getInt("id_reservation"));
				resa.setRoomId(rId);
				resa.setRoomName(room.getRoomName());
				resa.setRoomCategory(room.getRoomCategory());
				resa.setPrice(room.getRoomPrice());
				resa.setQuantity(rs.getInt("quantity"));
				resa.setDate(rs.getString("dateOrders"));

				list.add(resa);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public void cancelReservation(int id) {
		try {
			query = "DELETE FROM reservation_pending WHERE id_reservation=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteReservationPending1(int uid) {
		try {
			query = "DELETE FROM reservation_pending WHERE user_uid=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, uid);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	public List<Reservation> getAllSearchReservations(String search) {

		List<Reservation> reservations = new ArrayList<Reservation>();
		try {
			query = "SELECT * FROM reservation_pending WHERE idUsers = '" + search + "' OR room_idRoom= '" + search
					+ "' OR email= '" + search + "'";
			System.out.println(query);
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {

				Reservation row = new Reservation();
				row.setReservationId(rs.getInt("id_reservation"));
				row.setRoomId(rs.getInt("room_idRoom"));
				row.setUid(rs.getInt("user_uid"));
				row.setQuantity(rs.getInt("quantity_night"));
				row.setDate(rs.getString("reservation_date"));
				row.setPrice(rs.getDouble("price"));
				row.setTotal(rs.getDouble("total_price"));
				row.setEmail(rs.getString("email"));


				reservations.add(row);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reservations;
	}

	public List<Reservation> userReservationPending(int id) {
		List<Reservation> list = new ArrayList<>();
		try {
			query = "SELECT * FROM reservation_pending WHERE user_uid=? order BY reservation_pending.id_reservation DESC";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);

			rs = pst.executeQuery();

			while (rs.next()) {
				Reservation resa = new Reservation();
				RoomDAO roomDAO = new RoomDAO(this.con);
				int rId = rs.getInt("room_IdRoom");

				Room room = roomDAO.getSingleRoom(rId);

				resa.setReservationId(rs.getInt("id_reservation"));
				resa.setRoomId(rs.getInt("room_IdRoom"));
				resa.setUid(rs.getInt("user_uid"));
				resa.setQuantity(rs.getInt("quantity_night"));
				resa.setNumReservation(rs.getInt("num_reservation"));
				resa.setDateArrival(rs.getString("date_arrival"));
				resa.setDateDeparture(rs.getString("date_departure"));
				resa.setDate(rs.getString("reservation_date"));
				resa.setPrice(room.getRoomPrice());
				resa.setEmail(rs.getString("email"));
				resa.setLastname(rs.getString("lastname"));
				resa.setResaFirstname(rs.getString("firstname"));
				resa.setCountry(rs.getString("country"));
				resa.setRoomName(room.getRoomName());
				resa.setRoomImage(room.getRoomImage());
				resa.setRoomDescription(room.getRoomDescription());
				resa.setRoomCategory(room.getRoomCategory());
				resa.setPrice(room.getRoomPrice());
				resa.setDate(rs.getString("reservation_date"));
				resa.setAddress(rs.getString("address"));
				resa.setCp(rs.getString("cp"));
				resa.setCity(rs.getString("city"));
				resa.setState(rs.getString("state"));
				resa.setCountry(rs.getString("country"));

				list.add(resa);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public List<Reservation> getInfoUserCheckOut(int id) {
		List<Reservation> list = new ArrayList<>();
		try {
			query = "SELECT * FROM ( SELECT * , ROW_NUMBER() OVER( ORDER BY id_reservation DESC) AS etc FROM reservation_pending) AS a WHERE etc=1 AND user_uid= ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				Reservation infoUser = new Reservation();
				// UserDao userDao = new UserDao(this.con);
				// int uId = rs.getInt("senderIdUser");

				infoUser.setReservationId(rs.getInt("id_reservation"));
				infoUser.setUid(rs.getInt("user_uid"));
				infoUser.setNumReservation(rs.getInt("num_reservation"));
				infoUser.setResaFirstname(rs.getString("firstname"));
				infoUser.setCheckInFirstname(rs.getString("check_in_client_firstname"));
				infoUser.setCheckInLastname(rs.getString("check_in_client_lastname"));
				infoUser.setCheckInEmail(rs.getString("check_in_client_email"));
				infoUser.setCheckInMobileNumber(rs.getString("check_in_client_mobileNumber"));

				infoUser.setLastname(rs.getString("lastname"));
				infoUser.setEmail(rs.getString("email"));
				infoUser.setMobileNumber(rs.getString("mobile_number"));

				list.add(infoUser);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public double getTotalReservationPrice(List<Reservation> resaList) {
		double sum = 0;
		try {
			if (resaList.size() > 0) {
				for (Reservation item : resaList) {
					query = "SELECT price FROM reservation_pending WHERE id_reservation=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getReservationId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("PRICE") * item.getQuantity();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
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
						sum += rs.getDouble("roomPrice") * item.getCartQuantity();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	public void deleteReservationPending(int id) {

		// String product = null;
		try {
			query = "DELETE FROM reservation_pending WHERE id_reservation=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

	}

	public Reservation getSingleResa(int id) {
		Reservation row = null;
		try {
			query = "SELECT * FROM reservation_pending WHERE user_uid=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				row = new Reservation();
				row.setReservationId(rs.getInt("id_reservation"));
				row.setUid(rs.getInt("user_uid"));
				row.setRoomId(rs.getInt("room_idRoom"));
				row.setQuantity(rs.getInt("quantity_night"));
				row.setNumReservation(rs.getInt("num_reservation"));
				row.setDateArrival(rs.getString("date_arrival"));
				row.setDateDeparture(rs.getString("date_departure"));
				row.setDate(rs.getString("reservation_date"));
				row.setPrice(rs.getDouble("price"));
				row.setTotal(rs.getDouble("total_price"));
				row.setEmail(rs.getString("email"));
				row.setLastname(rs.getString("lastname"));
				row.setResaFirstname(rs.getString("firstname"));
				row.setMobileNumber(rs.getString("mobile_number"));
				row.setAddress(rs.getString("address"));
				row.setCp(rs.getString("cp"));
				row.setCity(rs.getString("city"));
				row.setState(rs.getString("state"));
				row.setCountry(rs.getString("country"));
				row.setCheckInFirstname(rs.getString("check_in_client_firstname"));
				row.setCheckInLastname(rs.getString("check_in_client_lastname"));
				row.setCheckInEmail(rs.getString("check_in_client_email"));
				row.setCheckInMobileNumber(rs.getString("check_in_client_mobileNumber"));

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());

		}

		return row;
	}

	public Reservation addTotal(int roomId, int user_uid) {
		Reservation resa = null;
		int quantity = 1;
		double product_price = 0;
		double product_total = 0;
		double cart_total = 0;
		int z = 0;

		try {
			con = DbCon.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM room WHERE roomId='" + roomId+ "'");

			while (rs.next()) {
				product_price = rs.getDouble(6);
				product_total = product_price;
			}
			ResultSet rs1 = st.executeQuery("SELECT * FROM reservation_pending WHERE user_uid='" + user_uid+ "'");
			while (rs1.next()) {

				cart_total = rs1.getDouble(10);
				cart_total = cart_total + product_total;
				quantity = rs.getInt(4);
				quantity += 1;
				z = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		if (z == 1) {
			try {
				st.executeUpdate("UPDATE reservation_pending SET total_price='" + cart_total + "' WHERE room_idRoom='"
						+ roomId + "' AND user_uid='" + user_uid + "'");
				System.out.println("UPDATED INTO reservation_pending SUCCESSFULLY ");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/*
		 * if(z==0) { PreparedStatement pst; try {
		 * 
		 * pst = con.
		 * prepareStatement("INSERT INTO reservation_pending (idProduit, quantity, price, total, email)VALUES(?,?,?,?,?)"
		 * ); pst.setInt(1, product_id); // Warning maybe 1,2,3 etc related to la base
		 * de données column pst.setInt(2, quantity); pst.setDouble(3, product_price);
		 * pst.setDouble(4, cart_total); pst.setString(5, email);
		 * 
		 * pst.executeUpdate();
		 * System.out.println("INSERT INTO order SUCCESSFULL in ProductDaoligne250");
		 * 
		 * 
		 * 
		 * } catch (SQLException e) { e.printStackTrace();
		 * System.err.println("INSERT INTO order FAILED in ProductDaoligne250");
		 * System.out.println("NEXT"); }
		 * 
		 * }
		 */
		return resa;
	}
	
	public List<Reservation> getAllSearchOrders(String search) {

		List<Reservation> orders = new ArrayList<Reservation>();
		try {
			query = "SELECT * FROM reservation_order WHERE id_reservation = '"+search+"' OR room_idRoom= '"+search+"' OR email= '"+search+"'";
			System.out.println(query);
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {

				Reservation row = new Reservation();
				row.setReservationId(rs.getInt("id_reservation"));
				row.setRoomId(rs.getInt("room_idRoom"));
				row.setUid(rs.getInt("user_uid"));
				row.setQuantity(rs.getInt("quantity_night"));
				row.setDate(rs.getString("reservation_date"));
				row.setPrice(rs.getDouble("price"));
				row.setTotal(rs.getDouble("total_price"));
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