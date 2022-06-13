package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ab_motors.connection.dbCon;

/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/edit-product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idproducts");
		String name = request.getParameter("nom");
		String category = request.getParameter("categorie");
		String price = request.getParameter("prix");
		String image = request.getParameter("image");
		String active = request.getParameter("active");
		System.out.println(id+" "+name+" "+category+" "+price+" "+" "+active);
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			Connection con = dbCon.getConnection();
			Statement st =con.createStatement();
			st.executeUpdate("update products set nom='"+name+"',categorie='"+category+"',prix='"+price+"',image='"+image+"',active='"+active+"' where idproducts='"+id+"'");
		if(active.equals("No")) {
			st.executeUpdate("delete from cart where idproducts='"+id+"' and adresse is NULL");
		}response.sendRedirect("admin/AllProductEditProduct.jsp");
		}catch(Exception e) {
			System.out.print("No product added !");
			response.sendRedirect("admin/AllProductEditProduct.jsp");
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
