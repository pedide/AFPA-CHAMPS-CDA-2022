package com.pokepok.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()){
			
			String name = request.getParameter("name");
			String email = request.getParameter("login-mail");
			String password = request.getParameter("nlogin-password");
			String mobileNumber = request.getParameter("mobileNumber");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String adress = "";
			String cp = "";
			String city = "";
			String state = "";
			String country = "";
			
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


}
