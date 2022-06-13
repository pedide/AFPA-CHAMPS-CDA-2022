package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;


@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;cherset=utf-8");
		
		String id = request.getParameter("id");
		String nom = request.getParameter("nom");
		String categorie = request.getParameter("categorie");
		//double prix = Double.parseDouble(request.getParameter("prix"));
		String prix = request.getParameter("prix");
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		//String designation = "";
		
		System.out.println(id+" "+nom+" "+categorie+" "+prix+" "+active);
		try (PrintWriter out = response.getWriter()) {
			out.print("Edit product servlet");
			Connection con = DBCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("update products set reference='"+nom+"',descriptif='"+categorie+"',prix='"+prix+"',image='"+image+"',active='"+active+"' where id='"+id+"'");
			
			if(active.equals("No")) {
				st.executeUpdate("delete from cart where product_id='"+id+"' and address is null " );
			}
			response.sendRedirect("admin/AllProductEditProduct.jsp?msg=done");		
					
	}	catch (Exception e) {
		e.printStackTrace();
		 System.out.print("Product :Not added !");
		    response.sendRedirect("admin/AllProductEditProduct.jsp?msg=wrong");
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
