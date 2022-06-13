package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.ProductsDao;
import com.xprodmvc.model.Cart;
import com.xprodmvc.model.Product;

@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public EditProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	

		String id = request.getParameter("id");
		String nom = request.getParameter("nom");
		String categorie = request.getParameter("categorie");
		String prix = request.getParameter("prix");
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		
		System.out.println(id+" "+nom+" "+categorie+" "+prix+" "+active);
		
		response.setContentType("text/html;charset=UTF-8");
		
		
		try (PrintWriter out = response.getWriter()) {
			Connection con=DbCon.getConnection();
			Statement st = con.createStatement();	
			st.executeUpdate("update produits set nom='"+nom+"',categorie='"+categorie+"',prix ='"+prix+"',image='"+image+"',active='"+active+"' where idProd='"+id+"'");
			if(active.equals("No")){
			st.executeUpdate("delete from cart where idProd='"+id+"' and adresse is NULL");	
			}
			 response.sendRedirect("admin/AllProductEditProduct.jsp");
			
			
		}catch (Exception e) {
				System.out.println("Le produit n'a pas été ajouté");
				response.sendRedirect("admin/AllProductEditProduct.jsp?msg=wrong");
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	doGet(request,response);
	}
}