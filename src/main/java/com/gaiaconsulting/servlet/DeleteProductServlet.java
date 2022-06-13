package com.gaiaconsulting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaiaconsulting.connection.DbCon;
import com.gaiaconsulting.dao.ProductsDao;


@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try (PrintWriter out = response.getWriter()){
	String id =  request.getParameter("id"); // on parametre l'id du champ
	if(id!=null) {//je met null et non 0 car l'id est un string
		ProductsDao pdao = new ProductsDao(DbCon.getConnection());
		pdao.deleteProduct(Integer.parseInt(id));
		response.sendRedirect("admin/adminHome.jsp");
	} 
	
		
 } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} //je cr�� une instance de product dao pour appeller ma m�thode dao
	

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
