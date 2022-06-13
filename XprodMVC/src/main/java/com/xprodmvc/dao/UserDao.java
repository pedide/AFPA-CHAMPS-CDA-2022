package com.xprodmvc.dao;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.cj.xdevapi.Statement;
import com.xprodmvc.model.DataEncryption;
import com.xprodmvc.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
    private java.sql.Statement st ;
	
	public UserDao(Connection con) {

		this.con = con;
	}

	public User userLogin(String email, String password ) {

		User user = null;

		
		
		try {
			query = "select * from user where email=? and password=? " ;
			pst = this.con.prepareStatement(query);
			
			pst.setString(1, email);
			pst.setString(2, password); 
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new User();
				
				user.setId(rs.getInt("iduser"));
				user.setName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setAuthorization(rs.getString("authorization"));
				
			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());
		}
		return user;
	

	}
	public User userRegister (String name, String email, String passwordClair,String authorization,String mobileNum,String securiteQuest,
			String answer, String adress,String cp ,String city,String state,String contry ) {
		User user = null;
		try{
		String password;
		password = DataEncryption.getSHA1(passwordClair);
		query=("insert into user(username,password,email,authorization,mobileNum,securiteQuest,answer,adress,city ,state,cp,contry) values (?,?,?,?,?,?,?,?,?,?,?,?)");
		pst=this.con.prepareStatement(query);
		
		pst.setString(1, name);
		pst.setString(2, password);
		pst.setString(3, email);
		pst.setString(4, authorization);
		pst.setString(5, mobileNum);
		pst.setString(6, securiteQuest);
		pst.setString(7, answer);			
		pst.setString(8, adress);
		pst.setString(9, city);
		pst.setString(10, cp);
		pst.setString(11, state);
		pst.setString(12, contry);

		pst.executeUpdate();
		
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
	}
		return user;
	
	}
	public User insertMessage (String name, String email, String mobileNum,String objetmessage, String message, String date) {
		User user=null;
		try{
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			  //Date date = new Date();
			
		query=("insert into messageu(name,email,mobileNum,objetmessage, message, date) values (?,?,?,?,?,?)");
		pst=this.con.prepareStatement(query);
		
		pst.setString(1, name);
		pst.setString(2, email);
		pst.setString(3, mobileNum);
		pst.setString(4, objetmessage);
		pst.setString(5, message);
		pst.setString(6, date);
		pst.executeUpdate();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		
	}return user;
	}
	
	
	public User adminMessage (String messageAdmin ,String dateAdmin) {
		User user=null;
		try{
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			  //Date date = new Date();
			
		query=("insert into messageu(messageAdmin, dateAdmin) values (?,?)");
		pst=this.con.prepareStatement(query);
		
		pst.setString(1, messageAdmin);
		pst.setString(2, dateAdmin);
		
		pst.executeUpdate();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		
	}return user;
	}
	
	
	
	
	public User userForgotPassword(String email, String newpasswordClair, String mobileNum, String securiteQuest,
			String answer) {
		User user=null;
		
		
		int check=0;
		
		try {
			String newpassword;
			newpassword = DataEncryption.getSHA1(newpasswordClair);
			query=("select * from user where email='"+email+"' and mobileNum='"+mobileNum+"' and securiteQuest= '"+securiteQuest+"' and answer='"+answer+"' ");
			
			
			st=this.con.createStatement();
			rs=st.executeQuery(query);
			
			while(rs.next()) {
				check=1;
				st.executeUpdate("Update user set password = '"+newpassword+"' where email='"+email+"'");
				System.out.println("password updated");
				
				
			}
			
			if (check==0) {
				
				System.out.println("password not updated");
			}
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		return null;
	}			
		 	
}		

	
	//String passwordClair 
	
	 
	 
	
	
	
	
	
	
	
	

