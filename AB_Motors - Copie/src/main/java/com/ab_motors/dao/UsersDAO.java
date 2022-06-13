package com.ab_motors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ab_motors.model.Users;

public class UsersDAO{
	
	private Connection con;
	private Statement st;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public UsersDAO(Connection con) {
		this.con = con;
	}
	
	public Users userLog(String email, String password){
		
		Users user = null;
		try {
		query = "select * from user where email = ? and password = ?";
		pst = this.con.prepareStatement(query);
		pst.setString(1,  email);
		pst.setString(2, password);
		rs = pst.executeQuery();
		
		if(rs.next()) {
			user = new Users();
			user.setAuthorization(rs.getString("authorization"));
			user.setID_USERS(rs.getInt("iduser"));
			user.setNOM(rs.getString("name"));
			user.setEMAIL(email);
		}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	public Users userForgotPassword(String email, String mobileNumber, String securityQuestion, String answer,
			String newPassword) {
		Users user=null;
		int check =0;
		
		try {
			query = "select * from user where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion= '"+securityQuestion+"' and answer='"+answer+"'";
			st = this.con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				check=1;
				st.executeUpdate("update user set password='"+newPassword+"' where email='"+email+"'");
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
}