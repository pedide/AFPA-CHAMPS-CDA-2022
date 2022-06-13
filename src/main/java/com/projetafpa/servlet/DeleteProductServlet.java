package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.ProductDao;


@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String id = request.getParameter("id"); // je recupere l'id du champs
			if (id!=null) {// on met null parce que c'est un string 
				try {
					ProductDao pdao = new ProductDao(DbCon.getConnection());
					pdao.deleteProduct(Integer.parseInt(id));
					response.sendRedirect("admin/adminHome.jsp");
				
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}