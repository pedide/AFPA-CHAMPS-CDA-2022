package com.gaiaconsulting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.gaiaconsulting.model.DataEncryption;
import com.gaiaconsulting.model.User;

public class UserDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private Statement st;
	public UserDao(Connection con) {
	
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
	
		User user = null;
		
		
		try {
			query = "select * from users where email=? and password = ? ";
			pst=this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs=pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("idLogin"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAuthorization(rs.getString("authorization"));
			}	
		} catch 
			(SQLException e) {
			
			System.out.println(e.getMessage());
					}
		return user;
		
	
		
		
	}

	public User userRegister(String name, String email, String mobileNumber, String adress, String city, String cp, String country, String state, String password, String authorization, String securityQuestion,
			String answer) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			query ="insert into users(name,email,mobileNumber,adress,city,cp,country,state,password,authorization,securityQuestion,answer)values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pst=this.con.prepareStatement(query);
			
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, mobileNumber);
			pst.setString(4, adress);
			pst.setString(5, city);
			pst.setString(6, cp);
			pst.setString(7, country);
			pst.setString(8, state);
			pst.setString(9, DataEncryption.getSHA1(password));
			pst.setString(10, authorization);
			pst.setString(11, securityQuestion);
			pst.setString(12, answer);
		
	
			pst.executeUpdate();
			
		}catch(Exception e){
			
			System.out.println(e.getMessage());
		}return user;
	}

	public User userForgotPassword(String email, String mobileNumber, String newPassword, String securityQuestion,
			String answer) {
			User user = null;
			int check=0;
			try {
				query="select * from users where email='"+email+"' and mobileNumber= '"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"' ";
			st=this.con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				check=1;
				st.executeUpdate("update users set password ='"+newPassword+"' where email = '" +email+"' ");
				System.out.println("Password updated");
			}
			if(check==0) {
				System.out.println("Password not updated !");

			}
			}catch(Exception e){
				System.out.println(e.getMessage());
				
			}
		return user;
	}
	
}
