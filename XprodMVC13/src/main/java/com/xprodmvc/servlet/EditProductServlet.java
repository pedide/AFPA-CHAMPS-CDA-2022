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
import com.xprodmvc.model.Produits;


@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String ref = request.getParameter("ref");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		//double price = Double.parseDouble(request.getParameter("price"));
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		
	
		
		try(PrintWriter out = response.getWriter()){
			out.print("This is edict product servlet. ");
		
			
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("update produits set ref='"+ref+"',designation='"+name+"', descriptif='"+category+"', prixUHT='"+price+"',imageProduit='"+image+"', active='"+active+"' where idProduit='"+id+"' ");

			
			if(active.equals("No")) {
				st.executeUpdate("delete from cart where produits_idProduit='"+id+"' and adresse is null");//on supprime

			}
			System.out.println("Le produit a bien été modifié. "+id+" "+ref+" "+name+" "+category+" "+price+" "+active);
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=done");
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Le produit modifié n'a pas été ajouté.");
			response.sendRedirect("admin/allProductEditProduct.jsp?msg=wrong");

		} 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
