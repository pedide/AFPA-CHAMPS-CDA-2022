package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;

@WebServlet("/add-user-check-in")
public class AddUserCheckIn extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstNameCheckIn = request.getParameter("firstnameCheckIn");
		String lastNameCheckIn = request.getParameter("lastnameCheckIn");
		String emailCheckIn = request.getParameter("emailCheckIn");
		String mobileNumberCheckIn = request.getParameter("mobileNumberCheckIn");

		try(PrintWriter out = response.getWriter()){
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("UPDATE reservation_pending SET check_in_client_firstname='"+firstNameCheckIn+"', check_in_client_lastname='"+lastNameCheckIn+"', check_in_client_email='"+emailCheckIn+"',check_in_client_mobileNumber='"+mobileNumberCheckIn+"' WHERE user_uid='"+id+"'");

		
			response.sendRedirect("check-out.jsp?msg=done");

		}	catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("No user check In updated!");
			response.sendRedirect("check-out.jsp?msg=wrong");
		} 	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
