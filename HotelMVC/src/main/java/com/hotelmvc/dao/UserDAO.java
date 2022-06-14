package com.hotelmvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.hotelmvc.model.User;


public class UserDAO {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	
	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public User userRegister(String userFirstname, String userLastname, String userEmail, String userPassword, String username, String mobileNumber, String securityQuestion, String answer, String address, String cp, String city, String state, String country, String authorization) {
		User user = null;
		try {
			query= "insert into user(userEmail,userPassword,username,mobileNumber,securityQuestion,answer,address,cp,city,state,country,authorization, firstname, lastname)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			
			pst.setString(1, userEmail);
			pst.setString(2, userPassword);
			pst.setString(3, username);
			pst.setString(4, mobileNumber);
			pst.setString(5, securityQuestion);
			pst.setString(6, answer);
			pst.setString(7, address);
			pst.setString(8, cp);
			pst.setString(9, city);
			pst.setString(10, state);
			pst.setString(11, country);
			pst.setString(12, authorization);
			pst.setString(13, userFirstname);
			pst.setString(14, userLastname);

			pst.executeUpdate();

		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	public User userLogin(String email, String password) {
		User user = null;

		try {
			query = "SELECT * FROM user WHERE useremail = ? and userpassword = ?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setIduser(rs.getInt("idUser"));
				user.setUsername(rs.getString("userName"));
				user.setUserEmail(email);
				user.setAuthorization(rs.getString("authorization"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	
	public User userForgotPassword(String userEmail, String mobileNumber, String securityQuestion, String answer, String newPassword) {
		User user = null;
		int check=0;
		try {
			query = "SELECT * FROM user WHERE userEmail='" + userEmail + "' and mobileNumber = '" + mobileNumber + "' and securityQuestion = '" + securityQuestion + "' and answer = '" + answer + "'";
					
			st= this.con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				check=1;
				st.executeUpdate("Update user SET userPassword = '" + newPassword + "' WHERE userEmail = '" + userEmail + "'");
				System.out.println("Password updated");
			} 
			if(check==0) {
				System.out.println("Password not updated");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	
	public User getSingleUser(int id) {
		User user = null;

		try {
			query = "SELECT * FROM user WHERE iduser = ? ";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setIduser(rs.getInt("idUser"));
				user.setFirstname(rs.getString("firstname"));
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;

	}
	
}
