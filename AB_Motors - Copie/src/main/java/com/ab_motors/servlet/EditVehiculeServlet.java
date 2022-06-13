package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ab_motors.connection.dbCon;

/**
 * Servlet implementation class EditVehiculeServlet
 */
@WebServlet("/edit-vehicule")
public class EditVehiculeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idvehicule");
		String modele = request.getParameter("modele");
		String category = request.getParameter("categorie");
		String price = request.getParameter("prix");
		String image = request.getParameter("img1");
		String kilometrage = request.getParameter("kilometrage");
		System.out.println(id+" "+modele+" "+category+" "+price+" "+" "+kilometrage);
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			Connection con = dbCon.getConnection();
			Statement st =con.createStatement();
			st.executeUpdate("update vehicule set modele='"+modele+"',categorie='"+category+"',prix='"+price+"',img1='"+image+"',kilometrage='"+kilometrage+"' where idvehicule='"+id+"'");
		response.sendRedirect("admin/AllProductEditProduct.jsp");
		}catch(Exception e) {
			System.out.print("No product added !");
			response.sendRedirect("admin/AllProductEditProduct.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
