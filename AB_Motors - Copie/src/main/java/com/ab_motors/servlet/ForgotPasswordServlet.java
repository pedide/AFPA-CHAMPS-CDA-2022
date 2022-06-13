package com.ab_motors.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ab_motors.connection.dbCon;
import com.ab_motors.dao.UsersDAO;
import com.ab_motors.model.Users;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			String email = request.getParameter("email");
			String mobileNumber = request.getParameter("mobileNumber");
			//String password = request.getParameter("password");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String newPassword = request.getParameter("newpassword");
			
			UsersDAO udao = new UsersDAO(dbCon.getConnection());
			Users user = udao.userForgotPassword(email,mobileNumber,securityQuestion,answer,newPassword);
			
			System.out.print("User :"+email+" password changed !");
			response.sendRedirect("forgotPassword.jsp?msg=done");
		}catch(Exception e){
			System.out.println("No user password changed !");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
