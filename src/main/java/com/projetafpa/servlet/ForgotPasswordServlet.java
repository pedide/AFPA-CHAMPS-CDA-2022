package com.projetafpa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projetafpa.connection.DbCon;
import com.projetafpa.dao.UserDao;
import com.projetafpa.model.User;


@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			//out.print("this is register servlet");
			String email = request.getParameter("email");
			String mobileNumber = request.getParameter("mobileNumber");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			String newPassword = request.getParameter("newPassword");
			
			UserDao udao = new UserDao (DbCon.getConnection());
			User user= udao.userForgotPassword(email,mobileNumber,securityQuestion,answer,newPassword);
			System.out.print("User : "+email+ "password changed !");
			response.sendRedirect("ForgotPassword.jsp?msg=done");

			
	}catch (Exception e) {
		System.out.print("No user password changed");
		response.sendRedirect("ForgotPassword.jsp?msg=invalid");
	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
