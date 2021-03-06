package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DbCon;
import com.xprodmvc.dao.OrderDao;


@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			
			if(id != null) {
				OrderDao orderDao = new OrderDao (DbCon.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
				
			}
			response.sendRedirect("orders.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
