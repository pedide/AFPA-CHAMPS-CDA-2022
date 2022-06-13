package com.projetafpa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.projetafpa.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private java.sql.Statement st;
	
	public UserDao(Connection con) {
		
		this.con = con;

	}
	
	public User userLogin(String email, String password) {
	
		User user = null;
		
	try {
		query ="select * from users where email=? and password=? ";
		pst=this.con.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
		rs=pst.executeQuery();
		
		if(rs.next()) {
		user = new User();
		
		user.setId(rs.getInt("idUsers"));
		user.setName(rs.getString("username"));
		user.setEmail(email);
		user.setAuthorization(rs.getString("authorization"));
		
		}
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
		return user;
		}

	
	public User UserRegister (String name, String email, String password, String mobileNumber,String securityQuestion ,String answer, 
			String address, String cp, String city, String state, String country) {
		
		User user =null;
		try {
			query= "insert into users (name,email,password,mobileNumber,adress,cp,city,state,country) value (?,?,?,?,?,?,?,?,?,?,?)";
			pst=this.con.prepareStatement(query);
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, mobileNumber);
			pst.setString(4, password);
			pst.setString(5, securityQuestion);
			pst.setString(6, answer);
			pst.setString(7, address);
			pst.setString(8, cp);
			pst.setString(9, city);
			pst.setString(10, state);
			pst.setString(11, country);
			pst.executeUpdate();
	
		}catch (Exception e) {
			System.out.println(e.getMessage());

	
		}
		return user;
	}
	
	public User userForgotPassword (String email, String mobileNumber, String securityQuestion,String answer, String newPassword){
		User user=null;
		
		int check=0;
		try {
			query =("select * from users where email='"+email+"'and mobileNumber= '"+mobileNumber+"' and securityQuestion='"+securityQuestion+"'and answer='"+answer+"'");
			st=this.con.createStatement();
			rs = st.executeQuery(query);
			System.out.println(rs);
			while(rs.next()) {
				check=1;
				st.executeUpdate("update users set password='"+newPassword+"'where email='"+email+"'");
				System.out.println("Password updated");
			}
			if(check==0) {
				System.out.println("Password not updated");
			
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
}
