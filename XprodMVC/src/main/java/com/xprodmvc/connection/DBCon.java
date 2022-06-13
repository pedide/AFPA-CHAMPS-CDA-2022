package com.xprodmvc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private static Connection connection = null;

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		if (connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/xproddb", "root", "Hadjer123@");
			System.out.println("Connection réussie!!");
	
		}
		return connection;
	}
}
