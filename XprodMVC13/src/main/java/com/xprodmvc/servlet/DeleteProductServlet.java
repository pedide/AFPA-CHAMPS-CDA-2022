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

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.ProductsDao;

@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {

			String id = request.getParameter("id");

			if (id != null) {
				// on doit creer une instance de ProductsDao pour pouvoir appeller la methode
				ProductsDao productdao = new ProductsDao(DbCon.getConnection());
				productdao.deleteProduct(Integer.parseInt(id));

				System.out.println("Le produit a bien été supprimé.");
				// response.sendRedirect("admin/adminHome.jsp");
				response.sendRedirect("admin/allProductEditProduct.jsp?msg=done");

			}else { 
				System.out.println("Le produit n'a pas été supprimé.");
				response.sendRedirect("admin/allProductEditProduct.jsp?msg=wrong"); }
			 

		} catch (Exception e) {

			e.printStackTrace();
			// System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
