package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

@WebServlet("/add-new-product")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			String nom = request.getParameter("nom");
			String categorie = request.getParameter("categorie");
			String prix = request.getParameter("prix");
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			ProductsDao pdao = new ProductsDao(DbCon.getConnection());
			pdao.addProduct(nom, categorie, prix, image, active);
			response.sendRedirect("admin/AjouterNvProduit.jsp");
			}catch(Exception e){}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}