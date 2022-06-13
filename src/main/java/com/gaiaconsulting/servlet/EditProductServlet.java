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


@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			out.print(" you re on the edit product servlet ");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			//double price = Double.parseDouble(request.getParameter("price"));
			String price = request.getParameter("price");
			String image = request.getParameter("image");
			String active = request.getParameter("active");
			
			System.out.println(id+" "+name+" "+category+" "+price+" "+active);
			try {
				Connection con=DbCon.getConnection();
				Statement st = con.createStatement();
				st.executeUpdate("update produits set DESCRIPTIF='"+name+"', DESIGNATION='"+category+"', PRIXUHT='"+price+"',IMAGE='"+image+"', ACTIVE='"+active+"'where IDPRODUIT='"+id+"'");
				
			System.out.print("product :"+name+"added ! ");
			response.sendRedirect("admin/AllProductEditProduct.jsp?msg=done");
			
			if(active.equals("No")) {
				
				st.executeUpdate("delete from cart where produits IDPRODUIT='"+id+"'and adress is NULL");
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("No Product : added ! " );
			response.sendRedirect("admin/AllProductEditProduct.jsp?msg=wrong");
		}
	
		}
		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
