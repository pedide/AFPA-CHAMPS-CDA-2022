package com.hotelmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotelmvc.connection.DbCon;
import com.hotelmvc.dao.MessageDAO;
import com.hotelmvc.model.MessageContact;


@WebServlet("/contact-form")
public class ContactFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Vous êtes dans la servlet Send Message");
		response.setContentType("text/html;charset=UTF-8");	
		
		try (PrintWriter out = response.getWriter()) {
			
			int userId = 12;
			
			String object = "object";
			String message = request.getParameter("message");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String date = "2022/06/05";
			int receiver=24;

			MessageDAO mdao = new MessageDAO(DbCon.getConnection());
			MessageContact mess = mdao.userSendMessage(object, message, firstname, lastname, email, date, receiver, userId );

			System.out.print("User : " + message + userId  +" registered ! ");
			response.sendRedirect("contact-us.jsp?msg=valid");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.print("No user registered ! ");
			response.sendRedirect("home.jsp.msg=invalid");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
