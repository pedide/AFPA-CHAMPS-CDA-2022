package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.swing.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DbCon;


@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteProductServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		
		try (PrintWriter out = response.getWriter()){
			out.println("");
		Connection con=DbCon.getConnection();
		Statement st = con.createStatement();	

		st.executeUpdate("delete from produits where idProd='"+id+"'");	
		
		System.out.println("Le produit a bien été delete");
		response.sendRedirect("admin/adminHome.jsp");
		}catch (Exception e) {
			System.out.println("Le produit n'a pas été delete");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
