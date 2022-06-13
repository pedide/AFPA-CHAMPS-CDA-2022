package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;


@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price= request.getParameter("price");
	String image = request.getParameter("image");
	String active = request.getParameter("active");
	
	System.out.println(id+" "+name+" "+category+" "+price+" "+active);
	try (PrintWriter out = response.getWriter()){
	out.print("this is edit product servlet");
	Connection con = DbCon.getConnection();
	Statement st = con.createStatement();
	st.executeUpdate("update produit set category='"+category+"',name='"+name+"',price='"+price+"',image='"+image+"',active='"+active+"'where id='"+id+"' ");
	
	
	if(active.equals("No")) { // si produit non-actif
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL"); // je vais aller supprimer dans le panier
	}
		response.sendRedirect("admin/allProductEditProduct.jsp?msg=done"); 

	}catch(Exception e) {
		e.printStackTrace();
		
		System.out.print("No product : added !");
		response.sendRedirect("admin/allProductEditProduct.jsp?msg=wrong");
	}
}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
