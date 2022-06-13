package com.gaiaconsulting.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gaiaconsulting.connection.DbCon;

public class MessageUs {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public MessageUs(Connection con) {

		this.con = con;
	}
}
