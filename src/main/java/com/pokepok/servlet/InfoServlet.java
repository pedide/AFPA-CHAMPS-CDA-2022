package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokepok.connection.DbCon;
import com.pokepok.dao.ProductDao;
import com.pokepok.model.Product;


@WebServlet("/info-client")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				String email = request.getParameter("email");
				String adress = request.getParameter("adress");
				String city = request.getParameter("city");
				String cp = request.getParameter("cp");
				String state = request.getParameter("state");
				String country = request.getParameter("country");
				String phone = request.getParameter("phone");
				
				response.setContentType("text/html;charset=UTF-8");
				try(PrintWriter out = response.getWriter()){
				//out.print("modified product");
					
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				st.executeUpdate("update user set  mobileNumber='"+phone+"', adress='"+adress+"', city='"+city+"', cp='"+cp+"', state='"+state+"', country='"+country+"' where EMAIL='"+email+"'");
				
				System.out.print("Info de "+email+ " " +phone+" " +adress+" "+city+" "+state+" "+country+""+cp+" modifié !");
				response.sendRedirect("info.jsp?msg=done");
			}catch(Exception e) {
				System.out.print("le produit n'a pas été ajouté !");
				System.out.println(e.getMessage());
				response.sendRedirect("info.jsp?msg=wrong");
			}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		doGet(request, response);
	}

}
