package com.ab_motors.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ab_motors.connection.dbCon;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobileNumber = request.getParameter("mobileNumber");
		String password = request.getParameter("password");
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String adresse = "";
		String ville = "";
		String departement = "";
		String cp = "";
		String pays = "";


		try{
			Connection con = dbCon.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into user(name,email,password,mobileNumber,securityQuestion,adresse,ville,departement,cp,pays,answer) value(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,password);
			ps.setString(4,mobileNumber);
			ps.setString(5,securityQuestion);
			ps.setString(11,answer);
			ps.setString(6,adresse);
			ps.setString(7,ville);
			ps.setString(8,departement);
			ps.setString(9,cp);
			ps.setString(10,pays);
			
			ps.execute();
			
			response.sendRedirect("signup.jsp");
		}catch(Exception e){
			System.out.println(e);
			response.sendRedirect("register");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
