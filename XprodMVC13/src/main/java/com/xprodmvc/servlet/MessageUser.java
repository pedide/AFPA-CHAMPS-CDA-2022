package com.xprodmvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/message-user")
public class MessageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String query;
	private Connection con;
	private PreparedStatement pst1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			
		}catch (Exception e) {
			System.out.println("Le message n'a pas été ajouté.");
			response.sendRedirect("addNewMessage.jsp?msg=wrong");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
