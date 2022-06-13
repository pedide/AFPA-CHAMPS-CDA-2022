package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.model.User;

@WebServlet("/profil-edit")
public class profilEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.setContentType("text/html;cherset=utf-8");
	

		User auth = (User) request.getSession().getAttribute("auth");

		//request.setAttribute("auth", auth);
	    String email = auth.getEmail();
		String nom = request.getParameter("nom");
		String mobileNum = request.getParameter("mobileNum");
		//double prix = Double.parseDouble(request.getParameter("prix"));
		String adress = request.getParameter("adress");
		String country = request.getParameter("country");
		String securityQuestion = request.getParameter("securityQuestion");
		String reponse = request.getParameter("answer");
		System.out.println("before try");
		//System.out.println(id+" "+nom+" "+categorie+" "+prix+" "+active);
		try (PrintWriter out = response.getWriter()) {
			out.print("Edit user servlet");
			System.out.println("after try");
			Connection con = DBCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("update user set username='"+nom+"',mobileNum='"+mobileNum+"',adress='"+adress+"',contry='"+country+"',securiteQuest='"+securityQuestion+"' where email='"+email+"'");
		
			response.sendRedirect("index.jsp?msg=done");		
					
	
		 System.out.print("Product :Not added !");
		    
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
