package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.ProductsDao;
import com.xprodmvc.model.Produits;


@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			out.print("This is add new product servlet. ");
			
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String ref = request.getParameter("ref");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			ProductsDao pdao = new ProductsDao(DbCon.getConnection());
			Produits produit = pdao.addProduct(ref, name, category, price, image, active);
			
			System.out.println("Produit: "+name+" a bien été ajouté.");
			response.sendRedirect("admin/adminHome.jsp?msg=done");
		
		} catch (Exception e) {
			System.out.println("Le produit n'a pas été ajouté.");
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		} 
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


