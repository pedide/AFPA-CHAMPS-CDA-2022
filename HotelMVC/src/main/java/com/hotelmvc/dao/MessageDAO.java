package com.hotelmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hotelmvc.model.MessageContact;
import com.hotelmvc.model.User;
import com.hotelmvc.model.Chat;


public class MessageDAO {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	
	public MessageDAO(Connection con) {
		this.con = con;
	}
	
	public MessageContact userSendMessage(String object, String message, String firstname, String lastname, String email, String date, int receiver,int userId) {
		MessageContact mess = null;
		try {
			query= "INSERT INTO messageformcontact (object, message, firstname, lastname, email, date, receiver_id_user, sender_id_user) VALUES (?,?,?,?,?,?,?,?)";
			pst= this.con.prepareStatement(query);
			pst.setString(1,object);
			pst.setString(2,message);
			pst.setString(3,firstname);
			pst.setString(4,lastname);
			pst.setString(5,email);
			pst.setString(6,date);
			pst.setInt(7,receiver);
			pst.setInt(8,userId);

			pst.executeUpdate();
			System.out.println("Message DAO: message : [ " + message + " ]");

		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return mess;
	}
	
	public User clientSendChatMessage(String message, String date, int userId, int receiver) {
		Chat mess = null;
		try {
			query= "INSERT INTO chat (message, dateMessage, senderIdUser, receiverIdUSer)VALUES(?,?,?,?)";
			pst= this.con.prepareStatement(query);
			pst.setString(1, message);
			pst.setString(2, date);
			pst.setInt(3, userId);
			pst.setInt(4, receiver);

			pst.executeUpdate();

		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return mess;
	}

	public List<Chat> getMessageUser(int userid) {
		List<Chat> list = new ArrayList<>();
		try {
			query = "SELECT * FROM chat WHERE senderIdUser=? and receiverIdUser=24 or senderIdUser=24 and receiverIdUser=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, userid);
			pst.setInt(2, userid);

			
			System.out.println(userid);


			rs = pst.executeQuery();

			while (rs.next()) {
				Chat message = new Chat();
				//UserDao userDao = new UserDao(this.con);
				//int uId = rs.getInt("senderIdUser");
				

				message.setChatId(rs.getInt("chatId"));
				message.setText(rs.getString("message"));
				message.setDate(rs.getString("dateMessage"));
				message.setSenderIdUser(rs.getInt("senderIdUser"));
				message.setReceiverIdUser(rs.getInt("receiverIdUser"));


				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}
	

	

	
	public List<MessageContact> getMessageForADMIN(int id) {
		List<MessageContact> list = new ArrayList<>();
		try {
			query = "SELECT * FROM ( SELECT * , ROW_NUMBER() OVER(PARTITION BY sender_id_user ORDER BY id_message_form_contact DESC) AS etc FROM message_form_contact) AS a WHERE etc=1 AND sender_id_user!= ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				MessageContact message = new MessageContact();
				//UserDao userDao = new UserDao(this.con);
				//int uId = rs.getInt("senderIdUser");
				

				message.setIdMessage(rs.getInt("id_message_form_contact"));
				message.setObject(rs.getString("object"));
				message.setText(rs.getString("message"));
				message.setSenderIdUser(rs.getInt("sender_id_user"));
				message.setReceiverIdUser(rs.getInt("receiver_id_user"));


				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public List<Chat> getChatForADMIN(int id) {
		List<Chat> list = new ArrayList<>();
		try {
			query = "SELECT * FROM ( SELECT * , ROW_NUMBER() OVER(PARTITION BY senderIdUser ORDER BY chatId DESC) AS etc FROM chat) AS a WHERE etc=1 AND senderIdUser!= ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				Chat message = new Chat();
				//UserDao userDao = new UserDao(this.con);
				//int uId = rs.getInt("senderIdUser");
				

				message.setChatId(rs.getInt("chatId"));
				message.setText(rs.getString("message"));
				message.setDate(rs.getString("dateMessage"));
				message.setSenderIdUser(rs.getInt("senderIdUser"));
				message.setReceiverIdUser(rs.getInt("receiverIdUser"));


				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public List<MessageContact> getMessageUserFormulaire(int userid) {
		List<MessageContact> list = new ArrayList<>();
		try {
			query = "SELECT * FROM message_form_contact WHERE sender_id_user=? and receiver_id_user=24 or sender_id_user=24 and receiver_id_user=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, userid);
			pst.setInt(2, userid);

			
			System.out.println(userid);


			rs = pst.executeQuery();

			while (rs.next()) {
				MessageContact message = new MessageContact();
				//UserDao userDao = new UserDao(this.con);
				//int uId = rs.getInt("senderIdUser");
				

				message.setIdMessage(rs.getInt("id_message_form_contact"));
				message.setObject(rs.getString("object"));
				message.setText(rs.getString("message"));
				message.setDate(rs.getString("date"));
				message.setSenderIdUser(rs.getInt("sender_id_user"));
				message.setReceiverIdUser(rs.getInt("receiver_id_user"));


				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	
}
