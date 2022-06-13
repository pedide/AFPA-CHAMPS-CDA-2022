package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.ProductDao;
import com.projetafpa.model.Product;


@WebServlet("/add-new-product")
public class addNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
		out.print("add new product servlet");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		
		ProductDao pdao = new ProductDao(DbCon.getConnection());
		Product product= pdao.addProduct(name, category, price, image, active);
		
		System.out.print("Produit :"+name+ " added !");
		response.sendRedirect("index.jsp?msg=valid");
		}catch(Exception e) {
			e.printStackTrace();
			
			
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
