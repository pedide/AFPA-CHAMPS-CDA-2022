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

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.OrderDao;
import com.xprodmvc.dao.ProductDao;
import com.xprodmvc.model.Cart;

@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try(PrintWriter out = response.getWriter())//
		{
			
			String id = request.getParameter("id");
			if(id !=null) {
				
				ProductDao productdao = new ProductDao(DBCon.getConnection());
			    productdao.deleteProduct(Integer.parseInt(id));
		
			}
			response.sendRedirect("admin/adminHome.jsp");


			
		} catch ( Exception e) {
			
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
	
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
