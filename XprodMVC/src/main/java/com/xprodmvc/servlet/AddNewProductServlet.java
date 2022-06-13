package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.ProductDao;
import com.xprodmvc.model.Product;


@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;cherset=utf-8");
		
		try (PrintWriter out = response.getWriter()) {
			out.print("Add new product servlet");
			
			String id = request.getParameter("id");
			String nom = request.getParameter("nom");
			String categorie = request.getParameter("categorie");
			double prix = Double.parseDouble(request.getParameter("prix"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			String designation = "";
			
			ProductDao pdao = new ProductDao(DBCon.getConnection());
		    Product product = pdao.addProduct(nom,designation ,  categorie, prix, image, active);
			
		    System.out.print("Product :"+nom +"added !");
		    response.sendRedirect("admin/adminHome.jsp?msg=done");
			
	}	catch (Exception e) {
		e.printStackTrace();
		 System.out.print("Product :Not added !");
		    response.sendRedirect("addNewProduct.jsp?msg=wrong");
		
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
