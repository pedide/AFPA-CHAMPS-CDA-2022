package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokepok.connection.DbCon;
import com.pokepok.dao.ProductDao;
import com.pokepok.model.Product;


@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			out.print("add new product");
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			ProductDao pdao = new ProductDao(DbCon.getConnection());
			Product product = pdao.addProduct(name, category, price, image, active);
			
			System.out.print("Produit : "+name+" ajouté !");
			response.sendRedirect("addNewProduct.jsp?msg=done");
		}catch(Exception e) {
			System.out.print("le produit n'a pas été ajouté !");
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
