package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.ProductsDao;
import com.gaiaconsulting.model.Products;


@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			out.print(" you re on the add new product servlet ");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			ProductsDao pdao = new ProductsDao(DbCon.getConnection());
			Products product = pdao.addProduct(name,category,price,image,active);
			
			response.sendRedirect("index.jsp?msg=done");
				
					
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("No Product : added ! " );
			response.sendRedirect("AllProductEditProduct.jsp?mag=wrong");
		}
	
		}
		
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
