package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xprodmvc.connection.DBCon;
import com.xprodmvc.dao.UserDao;
import com.xprodmvc.model.User;

/**
 * Servlet implementation class messageUsAdminServlet
 */
@WebServlet("/message-us-admin")
public class messageUsAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 Date date = new Date();
			 
			 String idm = request.getParameter("idm");
			 String dateAdmin=(formatter.format(date));
			 String messageAdmin = request.getParameter("messageAdmin");
				UserDao udao = new UserDao(DBCon.getConnection());
				User user = udao.adminMessage(messageAdmin,dateAdmin);
				
				
			System.out.println("message envoyer");
			response.sendRedirect("admin/messagerie.jsp?msg=valid");
				
				
				}catch(ClassNotFoundException |SQLException e) {
					System.out.println("No user registred !");
					response.sendRedirect("home.jsp?msg=invalid" );

				}
		
		}
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		
	}

}
