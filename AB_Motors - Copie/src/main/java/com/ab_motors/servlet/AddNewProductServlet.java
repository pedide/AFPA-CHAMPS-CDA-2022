package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ab_motors.connection.dbCon;
import com.ab_motors.dao.productsDAO;
import com.ab_motors.model.products;

/**
 * Servlet implementation class AddNewProductServlet
 */
@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			
			String id = request.getParameter("idproducts");
			String name = request.getParameter("nom");
			String category = request.getParameter("categorie");
			double price = Double.parseDouble(request.getParameter("prix"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			productsDAO pdao = new productsDAO(dbCon.getConnection());
			products product = pdao.addProduct(name,category,price,image,active);
			
			System.out.print("User :"+name+"registerd !");
			response.sendRedirect("admin/adminHome.jsp");
			
		} catch (ClassNotFoundException e) {
			response.sendRedirect("admin/adminHome.jsp");
		} catch (SQLException e) {
			response.sendRedirect("admin/adminHome.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
