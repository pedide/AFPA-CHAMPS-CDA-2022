package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokepok.connection.DbCon;
import com.pokepok.dao.ProductDao;
import com.pokepok.model.Product;


@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			double price = Double.parseDouble(request.getParameter("price"));
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			System.out.println(id+" "+name+" "+category+" "+price+" "+active);
			response.setContentType("text/html;charset=UTF-8");
			try(PrintWriter out = response.getWriter()){
			//out.print("modified product");
				
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("update produits set  REF='"+category+"', DESIGNATION='"+name+"', PRIXUHT='"+price+"', IMAGE='"+image+"', active='"+active+"' where IDPRODUIT='"+id+"'");
			
			if(active.equals("No")) {
				System.out.println("delete from cart where id_produit='"+id+"' and adresse is NULL");
				st.executeUpdate("delete from cart where id_produit='"+id+"' and adresse is NULL");
			}
			
			System.out.print("Produit : "+name+" modifié !");
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=done");
		}catch(Exception e) {
			System.out.print("le produit n'a pas été ajouté !");
			System.out.println(e.getMessage());
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=wrong");
		}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		doGet(request, response);
	}

}
